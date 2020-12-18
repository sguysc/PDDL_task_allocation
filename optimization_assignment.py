#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Dec  2 13:58:15 2020

@author: Guy
"""
import sys
import gurobipy as gp
from gurobipy import GRB
import networkx as nx
import pickle

class Robot():
    def __init__(self, name, cap, init_loc):
        self.name = name
        self.cap = cap
        self.init_loc = init_loc

    def __str__(self):
        return f"Robot: {self.name}\n  Capacity: {self.cap}\n  init: {self.init_loc}"

class Job():
    def __init__(self, name, duration, coveredBy):
        self.name = name
        self.duration = duration
        self.coveredBy = coveredBy
        self.priority = 1

    def __str__(self):
        about = f"Job: {self.name}\n  Duration: {self.duration}\n  Covered by: "
        about += ", ".join([t.name for t in self.coveredBy])
        return about

class Pallet():
    def __init__(self, name, pick, loc, job, tStart, tEnd):
        self.name = name
        self.pick = pick
        self.loc = loc
        self.job = job
        self.tStart = tStart
        self.tEnd = tEnd
        self.tDue = tEnd + 30

    def __str__(self):
        coveredBy = ", ".join([t.name for t in self.job.coveredBy])
        return f"Pallet: {self.name}\n  Location: {self.loc}\n  Job: {self.job.name}\n  Priority: {self.job.priority}\n  Duration: {self.job.duration}\n  Covered by: {coveredBy}\n  Start time: {self.tStart}\n  End time: {self.tEnd}\n"

ff = open('ECE6950.pickle', 'rb')
rmap = pickle.load(ff, encoding="latin1")
ff.close()

# Read location data
pickups  = ['H3X5Y12','H0X10Y10','H0X10Y10','H3X2Y20']
dropoffs = ['H3X2Y6','H2X10Y5','H0X10Y19','H0X6Y4']
robot_IC = ['H0X9Y10', 'H3X5Y11']

locations = dropoffs + robot_IC #pickups 

dist = {}
for i, ic in enumerate(robot_IC):
    for j, d in enumerate(dropoffs):
        dist[(ic, d)] = len(nx.dijkstra_path(rmap, source=ic, target=pickups[j], weight='weight')) + \
                        len(nx.dijkstra_path(rmap, source=pickups[j], target=d, weight='weight')) - 2
        dist[(d, ic)] = len(nx.dijkstra_path(rmap, source=d, target=ic, weight='weight')) - 1
for j, d in enumerate(dropoffs):
    for i, p in enumerate(dropoffs):
        if(i==j):
            continue
        dist[(d, p)] = len(nx.dijkstra_path(rmap, source=d, target=pickups[i], weight='weight')) + \
                       len(nx.dijkstra_path(rmap, source=pickups[i], target=p, weight='weight')) - 2
for j, d in enumerate(locations):
        dist[(d, d)] = 0
for j, d in enumerate(robot_IC):
    for i, p in enumerate(robot_IC):
        dist[(d, p)] = len(nx.dijkstra_path(rmap, source=d, target=p, weight='weight')) - 1
        dist[(p, d)] = len(nx.dijkstra_path(rmap, source=p, target=d, weight='weight')) - 1

# Read Robot data
Robots = []
Robots.append(Robot('robot0', 100,	robot_IC[0]))
Robots.append(Robot('robot1', 40, robot_IC[1]))

# Read job data
jobs = []
jobs.append( Job('typeA', 1, [Robots[0], Robots[1]]) )

# Read Pallet data
Pallets = []
Pallets.append(Pallet('p0', pickups[0], dropoffs[0], jobs[0], 0, 200))
Pallets.append(Pallet('p1', pickups[1], dropoffs[1], jobs[0], 0, 200))
Pallets.append(Pallet('p2', pickups[2], dropoffs[2], jobs[0], 0, 200))
Pallets.append(Pallet('p3', pickups[3], dropoffs[3], jobs[0], 0, 200))

def solve_allocation(Robots, Pallets, dist):
    # Build useful data structures
    K = [k.name for k in Robots]
    C = [j.name for j in Pallets]
    J = [j.loc for j in Pallets ]
    L = list(set([l[0] for l in dist.keys()]))
    D = list(set([t.init_loc for t in Robots]))
    cap = {k.name : k.cap for k in Robots}
    loc = {j.name : j.loc for j in Pallets}
    init_loc = {k.name : k.init_loc for k in Robots}
    canCover = {j.name : [k.name for k in j.job.coveredBy] for j in Pallets}
    dur = {j.name : j.job.duration for j in Pallets}
    tStart = {j.name : j.tStart for j in Pallets}
    tEnd = {j.name : j.tEnd for j in Pallets}
    tDue = {j.name : j.tDue for j in Pallets}
    priority = {j.name : j.job.priority for j in Pallets}
    
    ### Create model
    m = gp.Model("trs0")
    
    ### Decision variables
    # Pallet-Robot assignment
    x = m.addVars(C, K, vtype=GRB.BINARY, name="x")
    
    # Robot assignment
    u = m.addVars(K, vtype=GRB.BINARY, name="u")
    
    # Edge-route assignment to Robot
    y = m.addVars(L, L, K, vtype=GRB.BINARY, name="y")
   
    # Robot cannot leave or return to an init_loc that is not its base
    for k in Robots:
        for d in D:
            if k.init_loc != d:
                for i in L:
                    y[i,d,k.name].ub = 0
                    y[d,i,k.name].ub = 0
    
    # Start time of service
    t = m.addVars(L, ub=600, name="t")
    
    # Lateness of service
    z = m.addVars(C, name="z")
    
    # Artificial variables to correct time window upper and lower limits
    xa = m.addVars(C, name="xa")
    xb = m.addVars(C, name="xb")
    
    # Unfilled jobs
    g = m.addVars(C, vtype=GRB.BINARY, name="g")
    
    ### Constraints

    # A Robot must be assigned to a job, or a gap is declared (1)
    m.addConstrs((gp.quicksum(x[j, k] for k in canCover[j]) + g[j] == 1 for j in C), name="assignToJob")
    
    # At most one Robot can be assigned to a job (2)
    m.addConstrs((x.sum(j, '*') <= 1 for j in C), name="assignOne")

    # Robot capacity constraints (3)
    capLHS = {k : gp.quicksum(dur[j]*x[j,k] for j in C) +\
        gp.quicksum(dist[i,j]*y[i,j,k] for i in L for j in L) for k in K}
    m.addConstrs((capLHS[k] <= cap[k]*u[k] for k in K), name="techCapacity")

    # Robot tour constraints (4 and 5)
    m.addConstrs((y.sum('*', loc[j], k) == x[j,k] for k in K for j in C),\
        name="techTour1")
    m.addConstrs((y.sum(loc[j], '*', k) == x[j,k] for k in K for j in C),\
        name="techTour2")

    # Same init_loc constraints (6 and 7)
    m.addConstrs((gp.quicksum(y[j,init_loc[k],k] for j in J) == u[k] for k in K),\
        name="sameinit_loc1")
    m.addConstrs((gp.quicksum(y[init_loc[k],j,k] for j in J) == u[k] for k in K),\
        name="sameinit_loc2")

    # Temporal constraints (8) for Pallet locations
    M = {(i,j) : 600 + dur[i] + dist[loc[i], loc[j]] for i in C for j in C}
    m.addConstrs((t[loc[j]] >= t[loc[i]] + dur[i] + dist[loc[i], loc[j]]\
        - M[i,j]*(1 - gp.quicksum(y[loc[i],loc[j],k] for k in K))\
        for i in C for j in C), name="tempoPallet")
    
    # Temporal constraints (8) for init_loc locations
    M = {(i,j) : 600 + dist[i, loc[j]] for i in D for j in C}
    m.addConstrs((t[loc[j]] >= t[i] + dist[i, loc[j]]\
        - M[i,j]*(1 - y.sum(i,loc[j],'*')) for i in D for j in C),\
        name="tempoinit_loc")

    # Time window constraints (9 and 10)
    m.addConstrs((t[loc[j]] + xa[j] >= tStart[j] for j in C), name="timeWinA")
    m.addConstrs((t[loc[j]] - xb[j] <= tEnd[j] for j in C), name="timeWinB")

    # Lateness constraint (11)
    m.addConstrs((z[j] >= t[loc[j]] + dur[j] - tDue[j] for j in C),\
        name="lateness")

    ### Objective function
    M = 6100
    
    m.setObjective( gp.quicksum( 0.01 * M * priority[j] * (xa[j] + xb[j]) for j in C) +
                   gp.quicksum( M * priority[j] * g[j] for j in C) + \
                   (10.*gp.quicksum(dist[i,j]*y[i,j,k] \
                            for i,j in dist.keys() for k in K)), GRB.MINIMIZE)
    
    m.write("TRS0.lp")
    m.optimize()

    # import pdb; pdb.set_trace()
    status = m.Status
    if status in [GRB.INF_OR_UNBD, GRB.INFEASIBLE, GRB.UNBOUNDED]:
        print("Model is either infeasible or unbounded.")
        sys.exit(0)
    elif status != GRB.OPTIMAL:
        print("Optimization terminated with status {}".format(status))
        sys.exit(0)
        
    ### Print results
    # Assignments
    print("")
    for j in Pallets:
        if g[j.name].X > 0.5:
            jobStr = "Nobody assigned to {} ({}) in {}".format(j.name,j.job.name,j.loc)
        else:
            for k in K:
                if x[j.name,k].X > 0.5:
                    jobStr = "{} assigned to {} ({}) in {}. Start at t={:.2f}.".format(k,j.name,j.job.name,j.loc,t[j.loc].X)
                    if z[j.name].X > 1e-6:
                        jobStr += " {:.2f} minutes late.".format(z[j.name].X)
                    if xa[j.name].X > 1e-6:
                        jobStr += " Start time corrected by {:.2f} minutes.".format(xa[j.name].X)
                    if xb[j.name].X > 1e-6:
                        jobStr += " End time corrected by {:.2f} minutes.".format(xb[j.name].X)
        print(jobStr)

    #import pdb; pdb.set_trace()
    # Robots
    print("")
    for k in Robots:
        if u[k.name].X > 0.5:
            cur = k.init_loc
            route = k.init_loc
            N = 15
            while N>0:
                N -= 1
                for j in Pallets:
                    if y[cur,j.loc,k.name].X > 0.5:
                        #route += " -> {} (dist={}, t={:.2f}, proc={})".format(j.loc, dist[cur,j.loc], t[j.loc].X, j.job.duration)
                        route += " -> {} -> {} (dist={}, t={:.2f}, proc={})".format(j.pick, j.loc, dist[cur,j.loc], t[j.loc].X, j.job.duration)
                        cur = j.loc
                for i in D:
                    if y[cur,i,k.name].X > 0.5:
                        # route += " -> {} (dist={})".format(i, dist[cur,i])
                        cur = i
                        break
                if cur == k.init_loc:
                    break
            print("{}'s route: {}".format(k.name, route))
        else:
            print("{} is not used".format(k.name)) 
            
    
    # Utilization
    print("")
    for k in K:
        used = capLHS[k].getValue()
        util = used / cap[k] if cap[k] > 0 else 0
        print("{}'s utilization is {:.2%} ({:.2f}/{:.2f})".format(k, util,\
            used, cap[k]))
    totUsed = sum(capLHS[k].getValue() for k in K)
    totCap = sum(cap[k] for k in K)
    totUtil = totUsed / totCap if totCap > 0 else 0
    print("Total Robot utilization is {:.2%} ({:.2f}/{:.2f})".format(totUtil, totUsed, totCap))
    
    
    

def printScen(scenStr):
    sLen = len(scenStr)
    print("\n" + "*"*sLen + "\n" + scenStr + "\n" + "*"*sLen + "\n")

if __name__ == "__main__":
    # Base model
    printScen("Solving base scenario model")
    solve_allocation(Robots, Pallets, dist)

