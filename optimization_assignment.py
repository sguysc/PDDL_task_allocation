#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Dec  2 11:36:08 2020

@author: Guy
"""


import gurobipy as gp
from gurobipy import GRB

# Resource and job sets
#R = ['robot1', 'robot2']   # resources
#J = ['package1', 'package2', 'package3', 'package4']  # jobs
R = ['Carlos', 'Joe', 'Monika']
J = ['Tester', 'JavaDeveloper', 'Architect']

# Matching score data, cost
combinations, scores, costs = gp.multidict({
    ('Carlos', 'Tester'): [53,1],
    ('Carlos', 'JavaDeveloper'): [27,1],
    ('Carlos', 'Architect'): [13,1],
    ('Joe', 'Tester'): [80,2],
    ('Joe', 'JavaDeveloper'): [47,2],
    ('Joe', 'Architect'): [67,2],
    ('Monika', 'Tester'): [53,3],
    ('Monika', 'JavaDeveloper'): [73,3],
    ('Monika', 'Architect'): [47,3]
})

# Available budget (thousands of dollars)
budget = 5

# Declare and initialize model
model = gp.Model('RAP')


# Create decision variables for the RAP model
x = model.addVars(combinations, vtype=GRB.BINARY, name="assign") 
# Create gap variables for the RAP model
g = model.addVars(J, name="gap")

# Create job constraints
jobs = model.addConstrs((x.sum('*',j) + g[j] == 1 for j in J), name='job')

# Create resource constraints
resources = model.addConstrs((x.sum(r,'*') <= 1 for r in R), name='resource')

budget = model.addConstr((x.prod(costs) <= budget), name='budget')

# Penalty for not filling a job position
M = 101

# Objective: maximize total matching score of all assignments
model.setObjective(x.prod(scores) - M*g.sum(), GRB.MAXIMIZE)

# Save model for inspection
model.write('RAP.lp')

# Run optimization engine
model.optimize()

# Compute total matching score from assignment variables
total_matching_score = 0
for r, j in combinations:
    if x[r, j].x > 1e-6:
        print(x[r, j].varName, x[r, j].x) 
        total_matching_score += scores[r, j]*x[r, j].x

print('Total matching score: ', total_matching_score)  
