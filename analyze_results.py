#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Dec  8 10:49:24 2020

@author: cornell

# analyse the result file
"""

work_dir = '/home/cornell/Tools/ipc-2018-temp-sat/rundir/'
file_name = 'sas_plan.3'

pickups = {'p0': [-0.60,  0.35, -1.57],
           'p1': [1.10, -0.30, 0.00], 
           'p2': [1.10, -0.30, 0.00], 
           'p3': [-1.50,  2.50, -1.57] }
dropoffs = {'p0': [-1.50, -1.60, -1.57],
            'p1': [1.10, -2.00, 3.14],
            'p2': [1.10,  2.30, 0.00], 
            'p3': [-0.30, -2.20,  0.00]}


if __name__ == '__main__':
    with open(work_dir + file_name, 'rt') as f:
        Time = float(f.readline().split()[2])
        Length = int(f.readline().split()[2])
        
        f.readline()
        TotalCost = int(f.readline().split()[2])
        
        robot_path = {'robot0': [], 'robot1': []}
        robot_assignment = {'robot0': {}, 'robot1': {}}
        while(True):
            tmp_str = f.readline().split()
            if('END' in tmp_str[1]):
                break
            
            robot = tmp_str[2]
            if('move' in tmp_str[1]):
                cur = robot_path[robot]
                cur.append(tmp_str[3])
                robot_path.update({robot: cur})
            elif('unload' in tmp_str[1]):
                #import pdb; pdb.set_trace()
                cur = robot_assignment[robot]
                pallet = tmp_str[3]
                pallet_loc = tmp_str[4][:-1]
                prev = cur[pallet]
                prev[1] = pallet_loc
                cur.update({pallet: prev})
                robot_assignment.update({robot: cur})
            elif('load' in tmp_str[1]):
                #import pdb; pdb.set_trace()
                pallet = tmp_str[3]
                pallet_loc = tmp_str[4][:-1]
                cur = {pallet: [pallet_loc, '']}
                prev = robot_assignment[robot]
                prev.update(cur)
                robot_assignment.update({robot: prev})
            #import pdb; pdb.set_trace()
    print('Time to solve = %f sec' %Time)
    print('Number of steps = %d' %Length)
    print('Total cost = %d' %TotalCost)
    for key, val in robot_assignment.items():
        print('%s has this assignment:' %key)
        for i, ass in val.items():
            print('take pallet %s ([%f ,%f]) to ([%f ,%f])' %(i, pickups[i][0], pickups[i][1], dropoffs[i][0], dropoffs[i][1] ))
        print('===========================')