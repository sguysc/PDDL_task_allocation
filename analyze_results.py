#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Dec  8 10:49:24 2020

@author: cornell

# analyse the result file
"""
import networkx as nx
import pickle 

work_dir = '/home/cornell/Tools/ipc-2018-temp-sat/rundir/'
file_name = 'sas_plan.1'

pickups = {'p0': [-0.60,  0.35, -1.57],
           'p1': [1.10, -0.30, 0.00], 
           'p2': [1.10, -0.30, 0.00], 
           'p3': [-1.50,  2.50, -1.57] }
dropoffs = {'p0': [-1.50, -1.60, -1.57],
            'p1': [1.10, -2.00, 3.14],
            'p2': [1.10,  2.30, 0.00], 
            'p3': [-0.30, -2.20,  0.00]}


if __name__ == '__main__':
    ff = open('ECE6950.pickle', 'rb')
    roadmap = pickle.load(ff, encoding="latin1") 
    ff.close()
    
    with open(work_dir + file_name, 'rt') as f:
        Time = float(f.readline().split()[2])
        Length = int(f.readline().split()[2])
        
        f.readline()
        TotalCost = int(f.readline().split()[2])
        
        robot_path = {'robot0': [], 'robot1': [], 'robot2': [], 'robot3': []}
        robot_lastnode = {'robot0': [], 'robot1': [], 'robot2': [], 'robot3': []}
        robot_assignment = {'robot0': {}, 'robot1': {}, 'robot2': {}, 'robot3': {}}
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
                
                robot_lastnode.update({robot: tmp_str[4][:-1]})
            elif('load' in tmp_str[1]):
                #import pdb; pdb.set_trace()
                pallet = tmp_str[3]
                pallet_loc = tmp_str[4][:-1]
                cur = {pallet: [pallet_loc, '']}
                prev = robot_assignment[robot]
                prev.update(cur)
                robot_assignment.update({robot: prev})
            #import pdb; pdb.set_trace()
    
    for robot, val in robot_lastnode.items():
        cur = robot_path[robot]
        cur.append(val)
        robot_path.update({robot: cur})
        
    print('Time to solve = %f sec' %Time)
    print('Number of steps = %d' %Length)
    print('Total cost = %d' %TotalCost)
    for key, val in robot_assignment.items():
        # idx = 1
        print('%s has this assignment:' %key)
        # states = ''
        # actions = ''
        # former = ''
        for i, ass in val.items():
            # import pdb; pdb.set_trace()
            print('take pallet %s ([%f ,%f]) to ([%f ,%f])' %(i, pickups[i][0], pickups[i][1], dropoffs[i][0], dropoffs[i][1] ))
            # if(idx == 1):
                
            # if(idx > 1):
            #     path = nx.dijkstra_path(roadmap, source=former, target=ass[0].upper(), weight='weight1')
            #     for j in range(1, len(path)):
            #         states += '\'%s\', ' %(path[j].upper())
            #         actions += '%d, ' %(roadmap[path[j-1]][path[j]]['motion'])
            # path = nx.dijkstra_path(roadmap, source=ass[0].upper(), target=ass[1].upper(), weight='weight1')
            # for j in range(1, len(path)):
            #     states += '\'%s\', ' %(path[j-1].upper())
            #     actions += '%d, ' %(roadmap[path[j-1]][path[j]]['motion'])
            # states += '\'%s\', ' %(path[-1])
            # idx += 1
            # former = ass[1].upper()
    for key, nodes in robot_path.items():
        states = ''
        actions = ''
        if(len(nodes[0]) == 0 ):
            print('%s is not participating' %key)
            continue
        # import pdb; pdb.set_trace()
        for j, node in enumerate(nodes):
            states += '\'%s\', ' %(node.upper())
            if(j < len(nodes)-1):
                actions += '%d, ' %(roadmap[node.upper()][nodes[j+1].upper()]['motion'])
            # if(j+1 == len(nodes)):
            #     states += '\'%s\', ' %(node.upper())
            #     break
            # path = nx.dijkstra_path(roadmap, source=nodes[j].upper(), target=nodes[j+1].upper(), weight='weight1')
            # for i in range(1, len(path)):
            #     states += '\'%s\', ' %(path[i-1].upper())
            #     actions += '%d, ' %(roadmap[path[i-1]][path[i]]['motion'])
        print('%s' %key)
        print('path={' + states[:-2] + '};')
        print('actions=[' + actions + '0];')
        print('===========================')