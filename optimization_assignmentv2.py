#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Dec  2 13:58:15 2020

@author: Guy
"""
import sys
from collections import defaultdict
import xlrd
import gurobipy as gp
from gurobipy import GRB


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
    def __init__(self, name, loc, job, tStart, tEnd):
        self.name = name
        self.loc = loc
        self.job = job
        self.tStart = tStart
        self.tEnd = tEnd
        self.tDue = tEnd + 30

    def __str__(self):
        coveredBy = ", ".join([t.name for t in self.job.coveredBy])
        return f"Pallet: {self.name}\n  Location: {self.loc}\n  Job: {self.job.name}\n  Priority: {self.job.priority}\n  Duration: {self.job.duration}\n  Covered by: {coveredBy}\n  Start time: {self.tStart}\n  End time: {self.tEnd}\n"



# Open Excel workbook
wb = xlrd.open_workbook('data-Sce0.xlsx')

# Read Robot data
ws = wb.sheet_by_name('Technicians')
Robots = []
Robots.append(Robot('robot0', 480,	'H2X7Y5'))
Robots.append(Robot('robot1', 480,	'H3X2Y4'))

# Read job data
jobs = []
jobs.append( Job('typeA', 1, [Robots[0], Robots[1]]) )
jobs.append( Job('typeB', 2, []) )

# Read location data
locations = ['H1X9Y5', 'H2X7Y20', 'H1X4Y11', 'H1X4Y15', 'H0X12Y17', \
             'H3X2Y4', 'H2X7Y5', 'H3X1Y12' ]
# dist = {(l, l) : 0 for l in locations}
dist = {}
dist[('H1X9Y5', 'H1X9Y5')] = 0
dist[('H1X9Y5', 'H2X7Y20')] = 10
dist[('H2X7Y20', 'H1X9Y5')] = 10
dist[('H1X9Y5', 'H1X4Y11')] = 5
dist[('H1X4Y11', 'H1X9Y5')] = 13
dist[('H1X9Y5', 'H1X4Y15')] = 4
dist[('H1X4Y15', 'H1X9Y5')] = 17
dist[('H1X9Y5', 'H0X12Y17')] = 7
dist[('H0X12Y17', 'H1X9Y5')] = 15
dist[('H1X9Y5', 'H3X2Y4')] = 3
dist[('H3X2Y4', 'H1X9Y5')] = 3
dist[('H1X9Y5', 'H2X7Y5')] = 3
dist[('H2X7Y5', 'H1X9Y5')] = 5
dist[('H1X9Y5', 'H3X1Y12')] = 10
dist[('H3X1Y12', 'H1X9Y5')] = 5
dist[('H2X7Y20', 'H2X7Y20')] = 0
dist[('H2X7Y20', 'H1X4Y11')] = 6
dist[('H1X4Y11', 'H2X7Y20')] = 8
dist[('H2X7Y20', 'H1X4Y15')] = 8
dist[('H1X4Y15', 'H2X7Y20')] = 6
dist[('H2X7Y20', 'H0X12Y17')] = 7
dist[('H0X12Y17', 'H2X7Y20')] = 6
dist[('H2X7Y20', 'H3X2Y4')] = 7
dist[('H3X2Y4', 'H2X7Y20')] = 13
dist[('H2X7Y20', 'H2X7Y5')] = 11
dist[('H2X7Y5', 'H2X7Y20')] = 11
dist[('H2X7Y20', 'H3X1Y12')] = 5
dist[('H3X1Y12', 'H2X7Y20')] = 11
dist[('H1X4Y11', 'H1X4Y11')] = 0
dist[('H1X4Y11', 'H1X4Y15')] = 2
dist[('H1X4Y15', 'H1X4Y11')] = 4
dist[('H1X4Y11', 'H0X12Y17')] = 5
dist[('H0X12Y17', 'H1X4Y11')] = 17
dist[('H1X4Y11', 'H3X2Y4')] = 8
dist[('H3X2Y4', 'H1X4Y11')] = 5
dist[('H1X4Y11', 'H2X7Y5')] = 8
dist[('H2X7Y5', 'H1X4Y11')] = 3
dist[('H1X4Y11', 'H3X1Y12')] = 12
dist[('H3X1Y12', 'H1X4Y11')] = 4
dist[('H1X4Y15', 'H1X4Y15')] = 0
dist[('H1X4Y15', 'H0X12Y17')] = 3
dist[('H0X12Y17', 'H1X4Y15')] = 19
dist[('H1X4Y15', 'H3X2Y4')] = 12
dist[('H3X2Y4', 'H1X4Y15')] = 7
dist[('H1X4Y15', 'H2X7Y5')] = 12
dist[('H2X7Y5', 'H1X4Y15')] = 5
dist[('H1X4Y15', 'H3X1Y12')] = 7
dist[('H3X1Y12', 'H1X4Y15')] = 5
dist[('H0X12Y17', 'H0X12Y17')] = 0
dist[('H0X12Y17', 'H3X2Y4')] = 14
dist[('H3X2Y4', 'H0X12Y17')] = 10
dist[('H0X12Y17', 'H2X7Y5')] = 17
dist[('H2X7Y5', 'H0X12Y17')] = 8
dist[('H0X12Y17', 'H3X1Y12')] = 11
dist[('H3X1Y12', 'H0X12Y17')] = 8
dist[('H3X2Y4', 'H3X2Y4')] = 0
dist[('H3X2Y4', 'H2X7Y5')] = 4
dist[('H2X7Y5', 'H3X2Y4')] = 2
dist[('H3X2Y4', 'H3X1Y12')] = 12
dist[('H3X1Y12', 'H3X2Y4')] = 4
dist[('H2X7Y5', 'H2X7Y5')] = 0
dist[('H2X7Y5', 'H3X1Y12')] = 8
dist[('H3X1Y12', 'H2X7Y5')] = 6
dist[('H3X1Y12', 'H3X1Y12')] = 0


#
# Read Pallet data
Pallets = []
Pallets.append(Pallet('p0', 'H1X4Y15', jobs[0], 0, 200))
Pallets.append(Pallet('p1', 'H0X12Y17', jobs[0], 0, 200))
Pallets.append(Pallet('p2', 'H3X1Y12', jobs[0], 0, 200))
Pallets.append(Pallet('p3', 'H2X7Y20', jobs[0], 0, 200))
Pallets.append(Pallet('p0_', 'H2X7Y5', jobs[0], 0, 200))
Pallets.append(Pallet('p1_', 'H3X2Y4', jobs[0], 0, 200))
Pallets.append(Pallet('p2_', 'H1X9Y5', jobs[0], 0, 200))
Pallets.append(Pallet('p3_', 'H1X4Y11', jobs[0], 0, 200))

def solve_allocation(Robots, Pallets, dist):
    # Build useful data structures
    K = [k.name for k in Robots]
    C = [j.name for j in Pallets]
    J = [j.loc for j in Pallets]
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
    
    import pdb; pdb.set_trace()
    ### Create model
    m = gp.Model("trs0")
    
    ### Decision variables
    # Pallet-Robot assignment
    x = m.addVars(C, K, vtype=GRB.BINARY, name="x")
    
    # Robot assignment
    u = m.addVars(K, vtype=GRB.BINARY, name="u")
    
    # Edge-route assignment to Robot
    y = m.addVars(L, L, K, vtype=GRB.BINARY, name="y")
   
    # Robot cannot leave or return to a init_loc that is not its base
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
    
    m.setObjective(z.prod(priority) + gp.quicksum( 0.01 * M * priority[j] * (xa[j] + xb[j]) for j in C) +
                   gp.quicksum( M * priority[j] * g[j] for j in C) , GRB.MINIMIZE)
    
    m.write("TRS0.lp")
    m.optimize()

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

    # Robots
    print("")
    for k in Robots:
        if u[k.name].X > 0.5:
            cur = k.init_loc
            route = k.init_loc
            while True:
                for j in Pallets:
                    if y[cur,j.loc,k.name].X > 0.5:
                        route += " -> {} (dist={}, t={:.2f}, proc={})".format(j.loc, dist[cur,j.loc], t[j.loc].X, j.job.duration)
                        cur = j.loc
                for i in D:
                    if y[cur,i,k.name].X > 0.5:
                        route += " -> {} (dist={})".format(i, dist[cur,i])
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
        total = cap[k]
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

