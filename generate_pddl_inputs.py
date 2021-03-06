#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Nov 30 23:44:51 2020

@author: Guy

# automatically create PDDL domain and problem files based on the roadmap
"""

import argparse
import numpy as np
import json
import pickle 
from itertools import combinations_with_replacement
import networkx as nx
import shutil

formalism = 'b1' # 'b1',b2','c','d' # I did not implement a
d_filename = 'domain_%s.pddl' %formalism
t_filename = 'task_%s.pddl' %formalism
specification_path = './'
env_name = 'ECE6950'
copy_to_folder = '/home/cornell/Tools/ipc-2018-temp-sat/rundir/'
cell_size = 0.3
# cost of creating motion primitive #x:
# dictionary{(key(motion primitive):  cost)}
#could be length, time to complete, difficulty ...
cost = {0: 1, 1: 1, 2: 1, 3: 1, 4: 1, 5: 1, 6: 1, 7: 1, 8: 1, 9: 0}


def LoadRoadMap(filename):
    ff = open(specification_path + filename + '.pickle', 'rb')
    #ff = open(filename + '.pkl', 'rb')
    # python2->python3 conversion
    rmap = pickle.load(ff, encoding="latin1") 
    ff.close()
    return rmap

# act as "structs"
class Robot(object):
    def __init__(self, name, location):
        self.name = name
        self.location = location
        print('robot starts at %s' %location)

class Pallet(object):
    def __init__(self, name, pick, drop):
        self.name = name
        self.pick = pick
        self.drop = drop
        print('pallet from %s to %s' %(pick, drop))

class Location:
    def __init__(self, name):
        self.name = name

def unique(list1): 
    # insert the list to the set 
    list_set = set(list1) 
    # convert the set to the list 
    return (list(list_set)) 

def create_domain_file3():
    with open(d_filename, 'w+') as f:
        f.write('; Guy - ECE final project v%s\n' %formalism.upper() )
        f.write('; minimizes total length of all the robots based on the length of\n')
        f.write('; each action. this means that we need to encode the path length\n')
        f.write('; of each combination (loc(i)->loc(j), loc(j)->loc(i) for all connected i,j) in the task file.\n')
        f.write('; it does not take into any account the reactive nature which might elongate the path.\n')
        f.write('; encode unconnected two points with a ridiculously large cost.\n\n')
        f.write('(define (domain auto_warehouse)\n\n')
        f.write(';; Defining options for the planning system\n')
        f.write('(:requirements :adl :typing :action-costs)\n\n')
        f.write(';; Defining types\n')
        f.write('(:types\n')
        f.write('  forklift_a forklift_b - agent\n')
        f.write('  nodes - location\n')
        f.write('  pallet_a pallet_b - pallet\n')
        f.write('  pallet agent - physobj\n')
        f.write('  physobj operation location - object\n  )\n\n')
        f.write('; just dummy for stopping\n')
        f.write('(:constants\n')
        f.write('      stop - operation\n  )\n')
        f.write('(:functions\n')
        f.write('    (distance ?from ?to)\n')
        f.write('    (total-cost)\n  )\n')
        f.write('(:predicates\n')
        f.write('    ;location of a robot or package. Either initial, pickup or dropoff\n')
        f.write('    (at ?obj - physobj ?loc - location)\n')
        f.write('    ;is a certain pallet on a certain robot?\n')
        f.write('    (on ?pkg - pallet ?robot - agent)\n')
        f.write('    ;can we use this forklift or this package\n')
        f.write('    (avail ?obj - physobj )\n')
        f.write('  )\n\n')
        f.write(';just moves the robot between places\n')
        f.write('(:action move\n')
        f.write('    :parameters (?robot - agent ?from - location ?to - location)\n')
        f.write('    :precondition (at ?robot ?from)\n')
        f.write('    :effect (and (at ?robot ?to) (not (at ?robot ?from)) (increase (total-cost) (distance ?from ?to)))\n  )\n')
        f.write(';pickup a pallet if robot is at the location of the pallet and it\'s capacity\n;is allowing\n')
        f.write('(:action load\n')
        f.write('    :parameters (?robot - agent ?unit - pallet ?loc - location)\n')
        f.write('    :precondition (and (avail ?robot) (avail ?unit)\n')
        f.write('                       (at ?robot ?loc) (at ?unit ?loc ) )\n')
        f.write('    :effect (and (not (avail ?unit)) (not (avail ?robot))\n')
        f.write('                 (on ?unit ?robot) (not (at ?unit ?loc ))\n')
        f.write('                 (increase (total-cost) 1))\n  )\n\n')
        f.write('(:action unload\n')
        f.write('    :parameters   (?robot - agent ?unit - pallet ?loc - location)\n')
        f.write('    :precondition (and (at ?robot ?loc) (on ?unit ?robot) )\n')
        f.write('    :effect       (and (not (on ?unit ?robot)) (at ?unit ?loc) (avail ?robot)\n')
        f.write('                  (increase (total-cost) 1))\n  )\n')
        f.write(')\n')
        f.write('\n')
            
def create_domain_file4():
    with open(d_filename, 'w+') as f:
        f.write('; Guy - ECE final project v%s\n' %formalism.upper() )
        f.write('; minimizes total length of all the robots based on the length of\n')
        f.write('; each action. this means that we need to encode the path length\n')
        f.write('; of each combination (loc(i)->loc(j), loc(j)->loc(i) for all connected i,j) in the task file.\n')
        f.write('; it does not take into any account the reactive nature which might elongate the path.\n')
        f.write('; encode unconnected two points with a ridiculously large cost.\n\n')
        f.write('(define (domain auto_warehouse)\n\n')
        f.write(';; Defining options for the planning system\n')
        f.write('(:requirements :adl :typing :action-costs)\n\n')
        f.write(';; Defining types\n')
        f.write('(:types\n')
        f.write('  forklift_a forklift_b - agent\n')
        f.write('  nodes - location\n')
        f.write('  pallet_a pallet_b - pallet\n')
        f.write('  pallet agent - physobj\n')
        f.write('  physobj operation location - object\n  )\n\n')
        f.write('; just dummy for stopping\n')
        f.write('(:constants\n')
        f.write('      stop - operation\n  )\n')
        f.write('(:functions\n')
        f.write('    (distance ?from ?to)\n')
        f.write('    (total-cost)\n  )\n')
        f.write('(:predicates\n')
        f.write('    ;location of a robot or package. Either initial, pickup or dropoff\n')
        f.write('    (at ?obj - physobj ?loc - location)\n')
        f.write('    ;is a certain pallet on a certain robot?\n')
        f.write('    (on ?pkg - pallet ?robot - agent)\n')
        f.write('    ;can we use this forklift or this package\n')
        f.write('    (avail ?obj - physobj )\n')
        f.write('    ;the essentially creates the graph of the roadmap\n')
        f.write('    (connected ?x - location ?y - location)\n  )\n\n')
        f.write(';just moves the robot between places\n')
        f.write('(:action move\n')
        f.write('    :parameters (?robot - agent ?from - location ?to - location)\n')
        f.write('    :precondition (and (at ?robot ?from) (connected ?from ?to) )\n')
        f.write('    :effect (and (at ?robot ?to) (not (at ?robot ?from)) (increase (total-cost) (distance ?from ?to)))\n  )\n')
        f.write(';pickup a pallet if robot is at the location of the pallet and it\'s capacity\n;is allowing\n')
        f.write('(:action load\n')
        f.write('    :parameters (?robot - agent ?unit - pallet ?loc - location)\n')
        f.write('    :precondition (and (avail ?robot) (avail ?unit)\n')
        f.write('                       (at ?robot ?loc) (at ?unit ?loc ) )\n')
        f.write('    :effect (and (not (avail ?unit)) (not (avail ?robot))\n')
        f.write('                 (on ?unit ?robot) (not (at ?unit ?loc ))\n')
        f.write('                 (increase (total-cost) 1))\n  )\n\n')
        f.write('(:action unload\n')
        f.write('    :parameters   (?robot - agent ?unit - pallet ?loc - location)\n')
        f.write('    :precondition (and (at ?robot ?loc) (on ?unit ?robot) )\n')
        f.write('    :effect       (and (not (on ?unit ?robot)) (at ?unit ?loc) (avail ?robot)\n')
        f.write('                  (increase (total-cost) 1))\n  )\n')
        f.write(')\n')
        f.write('\n')
   
def create_domain_file5():
    with open(d_filename, 'w+') as f:
        f.write('; Guy - ECE final project v%s\n' %formalism.upper() )
        f.write('; minimizes total length of all the robots based on the length of\n')
        f.write('; each action. this means that we need to encode the path length\n')
        f.write('; of each combination (loc(i)->loc(j), loc(j)->loc(i) for all connected i,j) in the task file.\n')
        f.write('; it does not take into any account the reactive nature which might elongate the path.\n')
        f.write('; encode unconnected two points with a ridiculously large cost.\n')
        f.write('; added feature: allow blocking.\n\n')
        f.write('(define (domain auto_warehouse)\n\n')
        f.write(';; Defining options for the planning system\n')
        f.write('(:requirements :adl :typing :action-costs)\n\n')
        f.write(';; Defining types\n')
        f.write('(:types\n')
        f.write('  forklift_a forklift_b - agent\n')
        f.write('  nodes - location\n')
        f.write('  pallet_a pallet_b - pallet\n')
        f.write('  pallet agent - physobj\n')
        f.write('  physobj operation location - object\n  )\n\n')
        f.write('; just dummy for stopping\n')
        f.write('(:constants\n')
        f.write('      stop - operation\n  )\n\n')
        f.write('(:functions\n')
        f.write('    (distance ?from ?to)\n')
        f.write('    (total-cost)\n  )\n\n')
        f.write('(:predicates\n')
        f.write('    ;location of a robot or package. Either initial, pickup or dropoff\n')
        f.write('    (at ?obj - physobj ?loc - location)\n')
        f.write('    ;is a certain pallet on a certain robot?\n')
        f.write('    (on ?pkg - pallet ?robot - agent)\n')
        f.write('    ;can we use this forklift or this package\n')
        f.write('    (avail ?obj - physobj )\n')
        f.write('    ;the essentially creates the graph of the roadmap\n')
        f.write('    (connected ?x - location ?y - location)\n  )\n\n')
        f.write(';just moves the robot between places\n')
        f.write('(:action move\n')
        f.write('    :parameters (?robot - agent ?from - location ?to - location)\n')
        f.write('    :precondition (and (at ?robot ?from) (connected ?from ?to) )\n')
        f.write('    :effect (and (at ?robot ?to) (not (at ?robot ?from)) (increase (total-cost) (distance ?from ?to)))\n  )\n\n')
        f.write(';pickup a pallet if robot is at the location of the pallet and it\'s capacity\n;is allowing\n')
        f.write('(:action load\n')
        f.write('    :parameters (?robot - agent ?unit - pallet ?loc - location)\n')
        f.write('    :precondition (and (avail ?robot) (avail ?unit)\n')
        f.write('                       (at ?robot ?loc) (at ?unit ?loc ) )\n')
        f.write('    :effect (and (not (avail ?unit)) (not (avail ?robot))\n')
        f.write('                 (on ?unit ?robot) (not (at ?unit ?loc ))\n')
        f.write('                 (increase (total-cost) 1))\n  )\n\n')
        f.write('(:action unload\n')
        f.write('    :parameters   (?robot - agent ?unit - pallet ?loc - location)\n')
        f.write('    :precondition (and (at ?robot ?loc) (on ?unit ?robot) )\n')
        f.write('    :effect       (and (not (on ?unit ?robot)) (at ?unit ?loc) (avail ?robot)\n')
        f.write('                  (increase (total-cost) 1))\n  )\n')
        f.write(')\n')
        f.write('\n')
        
def create_domain_file6():
    with open(d_filename, 'w+') as f:
        f.write('; Guy - ECE final project v%s\n' %formalism.upper() )
        f.write('; minimizes total length of all the robots based on the length of\n')
        f.write('; each action. this means that we need to encode the path length\n')
        f.write('; of each combination (loc(i)->loc(j), loc(j)->loc(i) for all connected i,j) in the task file.\n')
        f.write('; it does not take into any account the reactive nature which might elongate the path.\n')
        f.write('; encode unconnected two points with a ridiculously large cost.\n')
        f.write('; added feature: allow blocking with timed operations.\n\n')
        f.write('(define (domain auto_warehouse)\n\n')
        f.write(';; Defining options for the planning system\n')
        f.write('(:requirements :strips :equality :typing :durative-actions)\n\n')
        f.write(';; Defining types\n')
        f.write('(:types\n')
        f.write('  forklift_a forklift_b - agent\n')
        f.write('  nodes - location\n')
        f.write('  pallet_a pallet_b - pallet\n')
        f.write('  pallet agent - physobj\n')
        f.write('  physobj operation location - object\n  )\n\n')
        f.write(';(:functions\n')
        f.write(';    (distance ?from ?to)\n')
        f.write(';    (total-cost)\n  ;)\n\n')
        f.write('(:predicates\n')
        f.write('    ;location of a robot or package. Either initial, pickup or dropoff\n')
        f.write('    (is_at ?obj - physobj ?loc - location)\n')
        f.write('    ;is a certain pallet on a certain robot?\n')
        f.write('    (on ?pkg - pallet ?robot - agent)\n')
        f.write('    ;can we use this forklift or this package\n')
        f.write('    (avail ?obj - physobj )\n')
        f.write('    ;can we stack up more on this forklift \n')
        f.write('    (full ?obj - agent )\n')
        f.write('    ;is this node available or not\n')
        f.write('    (occupied ?loc - location )\n')
        f.write('    ;the essentially creates the graph of the roadmap\n')
        f.write('    (connected ?x - location ?y - location)\n  )\n\n')
        f.write(';just moves the robot between places\n')
        f.write('(:durative-action move\n')
        f.write('    :parameters (?robot - agent ?from - location ?to - location)\n')
        f.write('    :duration (= ?duration 1)\n');
        f.write('    :condition (and\n')
        f.write('                  (at start (avail ?robot) )\n')
        f.write('                  (at start (is_at ?robot ?from) )\n')
        f.write('                  (at start (connected ?from ?to) )\n')
        f.write('                  (over all (not (occupied ?to)) )\n')
        f.write('               )\n')
        f.write('    :effect (and \n')
        f.write('               (at start (not (avail ?robot)) )\n')
        f.write('               (at end (avail ?robot) )\n')
        f.write('               (at end (is_at ?robot ?to) )\n')
        f.write('               (at end (not (is_at ?robot ?from)) )\n')
        f.write('               (at end (not (occupied ?from)) )\n')
        f.write('               (at end (occupied ?to) )\n')
        f.write('            )\n  )\n\n')
        f.write(';pickup a pallet if robot is at the location of the pallet and it\'s capacity\n;is allowing\n')
        f.write('(:durative-action load\n')
        f.write('    :parameters (?robot - agent ?unit - pallet ?loc - location)\n')
        f.write('    :duration (= ?duration 1)\n');
        f.write('    :condition (and\n')
        f.write('                  (at start (avail ?robot) )\n')
        f.write('                  (at start (not (full ?robot)) )\n')
        f.write('                  (at start (avail ?unit) )\n')
        f.write('                  (at start (is_at ?unit ?loc) )\n')
        f.write('                  (over all (is_at ?robot ?loc) )\n')
        f.write('               )\n')
        f.write('    :effect (and \n')
        f.write('               (at start (not (avail ?unit)) )\n')
        f.write('               (at start (not (avail ?robot)) )\n')
        f.write('               (at end (avail ?robot) )\n')
        f.write('               (at end (on ?unit ?robot) )\n')
        f.write('               (at end (full ?robot) )\n')
        f.write('               (at end (not (is_at ?unit ?loc )) )\n')
        f.write('            )\n  )\n\n')
        f.write('(:durative-action unload\n')
        f.write('    :parameters (?robot - agent ?unit - pallet ?loc - location)\n')
        f.write('    :duration (= ?duration 1)\n');
        f.write('    :condition (and\n')
        f.write('                  (at start (avail ?robot) )\n')
        f.write('                  (at start (on ?unit ?robot) )\n')
        f.write('                  (over all (is_at ?robot ?loc) )\n')
        f.write('               )\n')
        f.write('    :effect (and \n')
        f.write('               (at start (not (avail ?robot)) )\n')
        f.write('               (at end (avail ?unit) )\n')
        f.write('               (at end (avail ?robot) )\n')
        f.write('               (at end (not (on ?unit ?robot)) )\n')
        f.write('               (at end (not (full ?robot)) )\n')
        f.write('               (at end (is_at ?unit ?loc) )\n')
        f.write('            )\n  )\n\n')
        f.write(')\n')
        f.write('\n')
        
def create_task_file3(robots, pallets, roadmap):
    # fff=open('B2_nodes.json', 'wt')
    
    with open(t_filename, 'w+') as f:
        f.write('(define (problem auto_warehouse_easy)\n' )
        f.write('  (:domain auto_warehouse)\n')
        f.write('  (:objects\n')
        pallets_str = ' '.join(p.name for p in pallets)
        f.write('    %s - pallet\n' %pallets_str)
        robots_str = ' '.join(p.name for p in robots)
        f.write('    %s - agent\n' %robots_str)
        locations_str = ''
        idx = 0
        
        locations = []
        for r in robots:
            locations.append(r.location)
        for p in pallets:
            locations.append(p.pick)
            locations.append(p.drop)
        # print(len(locations))
        locations = unique(locations)
        # print(len(locations))
        for parent in locations:
            if( idx % 12 == 11):
                locations_str += '\n    '
                #locations_str += '- location\n    '
            locations_str += parent + ' '
            idx += 1
        f.write('    %s- location\n  )\n' %locations_str)
        #f.write('    %s\n  )\n' %locations_str)
        f.write('\n')
        
        f.write('  (:init (= (total-cost) 0)\n')
        tmp_str = '         '
        for r in robots:
            tmp_str += '(at %s %s) ' %(r.name, r.location)
        f.write(tmp_str + '\n')
        tmp_str = '         '
        for r in robots:
            tmp_str += '(avail %s) ' %(r.name)
        f.write(tmp_str + '\n')
        tmp_str = '         '
        for p in pallets:
            tmp_str += '(at %s %s) ' %(p.name, p.pick)
        f.write(tmp_str + '\n')
        tmp_str = '         '
        for p in pallets:
            tmp_str += '(avail %s) ' %(p.name)
        f.write(tmp_str + '\n')

        #import pdb; pdb.set_trace()
        # here iterate through all the known locations and write the connections

        # Get all permutations of length 2 
        perm = combinations_with_replacement(locations, 2)
        tmp_str = ''
        for i in list(perm):  
            if(i[0] == i[1]):
                distance = 0
            else:
                try:
                    path = nx.dijkstra_path(roadmap, source=i[0], target=i[1], weight='weight1')
                    distance = len(path) - 1
                except:
                    distance = 10000
            tmp_str += '         (= (distance %s %s) %d)\n' %(i[0], i[1], distance)
            if(i[0] != i[1]):
                try:
                    path = nx.dijkstra_path(roadmap, source=i[1], target=i[0], weight='weight1')
                    distance = len(path) - 1
                except:
                    distance = 10000
                tmp_str += '         (= (distance %s %s) %d)\n' %(i[1], i[0], distance)
            
        f.write('%s  )\n' %tmp_str)
        # end
        tmp_str = '  (:goal (and '
        for p in pallets:
            tmp_str += '(at %s %s) ' %(p.name, p.drop)
        f.write(tmp_str + ')\n    )\n')
        f.write('  (:metric minimize (total-cost))\n)\n')
    # fff.close()

def create_task_file4(robots, pallets, roadmap):
    with open(t_filename, 'w+') as f:
        f.write('(define (problem auto_warehouse_easy)\n' )
        f.write('  (:domain auto_warehouse)\n')
        f.write('  (:objects\n')
        pallets_str = ' '.join(p.name for p in pallets)
        f.write('    %s - pallet\n' %pallets_str)
        robots_str = ' '.join(p.name for p in robots)
        f.write('    %s - agent\n' %robots_str)
        locations_str = ''
        idx = 0
        for parent in roadmap:
            if( idx % 12 == 11):
                locations_str += '\n    '
                #locations_str += '- location\n    '
            locations_str += parent + ' '
            idx += 1
        f.write('    %s- location\n  )\n' %locations_str)
        #f.write('    %s\n  )\n' %locations_str)
        f.write('\n')
        
        f.write('  (:init (= (total-cost) 0)\n')
        tmp_str = '         '
        for r in robots:
            tmp_str += '(at %s %s) ' %(r.name, r.location)
        f.write(tmp_str + '\n')
        tmp_str = '         '
        for r in robots:
            tmp_str += '(avail %s) ' %(r.name)
        f.write(tmp_str + '\n')
        tmp_str = '         '
        for p in pallets:
            tmp_str += '(at %s %s) ' %(p.name, p.pick)
        f.write(tmp_str + '\n')
        tmp_str = '         '
        for p in pallets:
            tmp_str += '(avail %s) ' %(p.name)
        f.write(tmp_str + '\n')

        #import pdb; pdb.set_trace()
        # here iterate through the whole roadmap and write the connections
        for parent in roadmap:
            children = roadmap.neighbors(parent)
            tmp_str = '         (connected %s %s) (= (distance %s %s) 0)\n' %(parent, parent, parent, parent)
            for child in children:
                motion = roadmap[parent][child]['motion']
                distance = cost[motion]
                tmp_str += '         (connected %s %s) (= (distance %s %s) %d)\n' %(parent, child, parent, child, distance)
            # need to also set the lengths of all other nodes
            #for all_else in know:
            #    tmp_str += '(= (distance %s %s) 10000)\n' %(parent, child)
            f.write(tmp_str)
        f.write('  )\n')
        # end
        tmp_str = '  (:goal (and '
        for p in pallets:
            tmp_str += '(at %s %s) ' %(p.name, p.drop)
        f.write(tmp_str + ')\n    )\n')
        f.write('  (:metric minimize (total-cost))\n)\n')

def create_task_file5(robots, pallets, roadmap):
    with open(t_filename, 'w+') as f:
        f.write('(define (problem auto_warehouse_easy)\n' )
        f.write('  (:domain auto_warehouse)\n')
        f.write('  (:objects\n')
        pallets_str = ' '.join(p.name for p in pallets)
        f.write('    %s - pallet\n' %pallets_str)
        robots_str = ' '.join(p.name for p in robots)
        f.write('    %s - agent\n' %robots_str)
        locations_str = ''
        
        # first, add only the nodes that play in the beginning or end
        locations = []
        for r in robots:
            locations.append(r.location)
        for p in pallets:
            locations.append(p.pick)
            locations.append(p.drop)
        #print(len(locations))
        
        init_str = '  (:init (= (total-cost) 0)\n         '
        for r in robots:
            init_str += '(at %s %s) ' %(r.name, r.location)
        init_str += '\n'
        init_str += '         '
        for r in robots:
            init_str += '(avail %s) ' %(r.name)
        init_str += '\n'
        init_str += '         '
        for p in pallets:
            init_str += '(at %s %s) ' %(p.name, p.pick)
        init_str += '\n'
        init_str += '         '
        for p in pallets:
            init_str += '(avail %s) ' %(p.name)
        init_str += '\n'

        # here iterate through all the known locations and write the connections
        # Get all permutations of length 2 
        # only include each node once        
        locations = unique(locations)
        perm = combinations_with_replacement(locations, 2)
        connect_str = ''
        #import pdb; pdb.set_trace()
        for i in list(perm):  
            if(i[0] == i[1]):
                distance = 0
                parent, child  = i[0], i[1]
                connect_str += '         (connected %s %s) (= (distance %s %s) %d)\n' %(parent, child, parent, child, distance)            
            else:
                try:
                    # import pdb; pdb.set_trace()
                    path = nx.dijkstra_path(roadmap, source=i[0], target=i[1], weight='weight1')
                    for j in range(len(path)-1):
                        # keep track of all locations
                        if(path[j+1] not in locations):
                            locations.append(path[j+1])
                        parent, child = path[j], path[j+1]
                        motion = roadmap[parent][child]['motion']
                        distance = cost[motion]
                        connect_str += '         (connected %s %s) (= (distance %s %s) %d)\n' %(parent, child, parent, child, distance)            
                except:
                    distance = 10000
                    parent, child  = i[0], i[1]
                    connect_str += '         (connected %s %s) (= (distance %s %s) %d)\n' %(parent, child, parent, child, distance)            
                    print('%s->%s do not have a path associated with them in the roadmap' %(parent, child))
            # now, check the reverse motion, to get all possible motions
            if(i[0] != i[1]):
                try:
                    path = nx.dijkstra_path(roadmap, source=i[1], target=i[0], weight='weight1')
                    for j in range(len(path)-1):
                        # keep track of all locations
                        if(path[j+1] not in locations):
                            locations.append(path[j+1])
                        parent, child = path[j], path[j+1]
                        motion = roadmap[parent][child]['motion']
                        distance = cost[motion]
                        connect_str += '         (connected %s %s) (= (distance %s %s) %d)\n' %(parent, child, parent, child, distance)            
                except:
                    distance = 10000
                    parent, child  = i[0], i[1]
                    connect_str += '         (connected %s %s) (= (distance %s %s) %d)\n' %(parent, child, parent, child, distance)            
                    print('%s->%s do not have a path associated with them in the roadmap' %(parent, child))

        # only include each node once        
        locations = unique(locations)
        idx = 0
        #print(len(locations))
        for parent in locations:
            if( idx % 12 == 11):
                locations_str += '\n    '
                #locations_str += '- location\n    '
            locations_str += parent + ' '
            idx += 1
        f.write('    %s- location\n  )\n' %locations_str)
        f.write('\n')
        
        f.write(init_str)

        f.write('%s  )\n' %connect_str)
        
        # end
        tmp_str = '  (:goal (and '
        for p in pallets:
            tmp_str += '(at %s %s) ' %(p.name, p.drop)
        f.write(tmp_str + ')\n    )\n')
        f.write('  (:metric minimize (total-cost))\n)\n')

def create_task_file6(robots, pallets, roadmap):
    with open(t_filename, 'w+') as f:
        f.write('(define (problem auto_warehouse_timed)\n' )
        f.write('  (:domain auto_warehouse)\n')
        f.write('  (:objects\n')
        pallets_str = ' '.join(p.name for p in pallets)
        f.write('    %s - pallet\n' %pallets_str)
        robots_str = ' '.join(p.name for p in robots)
        f.write('    %s - agent\n' %robots_str)
        locations_str = ''
        
        # first, add only the nodes that play in the beginning or end
        locations = []
        init_locations = []
        for r in robots:
            locations.append(r.location)
        for p in pallets:
            locations.append(p.pick)
            locations.append(p.drop)
        #print(len(locations))
        
        init_str = '  (:init \n         '
        for r in robots:
            init_str += '(is_at %s %s) (occupied %s) ' %(r.name, r.location, r.location)
        init_str += '\n'
        init_str += '         '
        for r in robots:
            init_str += '(avail %s) ' %(r.name)
        init_str += '\n'
        init_str += '         '
        for p in pallets:
            init_str += '(is_at %s %s) ' %(p.name, p.pick)
        init_str += '\n'
        init_str += '         '
        for p in pallets:
            init_str += '(avail %s) ' %(p.name)
        init_str += '\n'

        # here iterate through all the known locations and write the connections
        # Get all permutations of length 2 
        # only include each node once        
        locations = unique(locations)    
        perm = combinations_with_replacement(locations, 2)
        connect_str = ''
        #import pdb; pdb.set_trace()
        for i in list(perm):  
            if(i[0] == i[1]):
                distance = 0
                parent, child  = i[0], i[1]
                connect_str += '         (connected %s %s)\n' %(parent, child)            
            else:
                try:
                    path = nx.dijkstra_path(roadmap, source=i[0], target=i[1], weight='weight1')
                    connect_str += '         '
                    for j in range(len(path)-1):
                        if(j % 3 == 2):
                            connect_str += '\n         '
                        # keep track of all locations
                        if(path[j+1] not in locations):
                            locations.append(path[j+1])
                        parent, child = path[j], path[j+1]
                        motion = roadmap[parent][child]['motion']
                        distance = cost[motion]
                        connect_str += '(connected %s %s) ' %(parent, child)            
                    connect_str += '\n'
                except:
                    distance = 10000
                    parent, child  = i[0], i[1]
                    #connect_str += '         (connected %s %s)\n' %(parent, child, parent, child, distance)            
                    print('%s->%s do not have a path associated with them in the roadmap' %(parent, child))
            # now, check the reverse motion, to get all possible motions
            if(i[0] != i[1]):
                try:
                    connect_str += '         '
                    path = nx.dijkstra_path(roadmap, source=i[1], target=i[0], weight='weight1')
                    for j in range(len(path)-1):
                        if(j % 3 == 2):
                            connect_str += '\n         '
                        # keep track of all locations
                        if(path[j+1] not in locations):
                            locations.append(path[j+1])
                        parent, child = path[j], path[j+1]
                        motion = roadmap[parent][child]['motion']
                        distance = cost[motion]
                        connect_str += '(connected %s %s) ' %(parent, child)            
                    connect_str += '\n'
                except:
                    distance = 10000
                    parent, child  = i[0], i[1]
                    #connect_str += '         (connected %s %s)\n' %(parent, child, parent, child, distance)            
                    print('%s->%s do not have a path associated with them in the roadmap' %(parent, child))

        # only include each node once        
        locations = unique(locations)
        idx = 0
        #print(len(locations))
        for parent in locations:
            if( idx % 12 == 11):
                locations_str += '\n    '
                #locations_str += '- location\n    '
            locations_str += parent + ' '
            idx += 1
        f.write('    %s- location\n  )\n' %locations_str)
        f.write('\n')
        
        f.write(init_str)

        f.write('%s  )\n' %connect_str)
        
        # end
        tmp_str = '  (:goal (and '
        for p in pallets:
            tmp_str += '(is_at %s %s) ' %(p.name, p.drop)
        f.write(tmp_str + ')\n    )\n')
        f.write('  (:metric minimize (total-time))\n)\n')
        
def LoadParameters(map_kind, cell=0.4):
    try:
        with open(specification_path + map_kind + '.specification', 'r') as spec_file:
            spec = json.load(spec_file)
    except:
        print('Specification %s file has syntax error.' %(map_kind))
        raise
    workspace = spec['workspace']
    #W_Height = workspace[2] - workspace[0]  # [m]
    W_Width  = workspace[3] - workspace[1] # [m]
    pix2m  = W_Width/(workspace[3]-workspace[1])
    X = np.arange(workspace[0]+cell/2.0, workspace[2]-cell/2.0, cell)
    W_xgrid = X.copy()
    Y = np.arange(workspace[1]+cell/2.0, workspace[3]-cell/2.0, cell)
    W_ygrid = Y.copy()
    
    return W_xgrid, W_ygrid, pix2m
    
# utility function to find the closest grid point
def find_nearest(arr, value):
    arr = np.asarray(arr)
    idx = (np.abs(arr - value)).argmin()
    return idx

# conversion from arbitrary location on map to the closest funnel (location & orientation)
def GetNodeLabel(pose, W_xgrid, W_ygrid, pix2m):
    orient = int(np.round( pose[2] / (np.pi/2.0) ) % 4)  # what quadrant you're closest to
    label = 'H' + str(orient) + 'X' + str(find_nearest(W_xgrid, pix2m*pose[0])) + \
                                'Y' + str(find_nearest(W_ygrid, pix2m*pose[1]))
    
    return label

if __name__ == '__main__':
    
    parser = argparse.ArgumentParser()
    parser.add_argument("--robots", type=int, default=4, help="Number of robots to use")
    args = parser.parse_args()
    N = args.robots
    
    roadmap = LoadRoadMap(env_name)
    #print(nx.info(roadmap))
    
    W_xgrid, W_ygrid, pix2m = LoadParameters(env_name, cell=cell_size)
    
    robots = []
    # pose is [x,y,theta]   where x \in R, y \in R, theta \in (0, 1.57, 3.14, -1.57)
    # robot_ic = [[ 0.8, -0.30,  0.00], [-0.60,  0.00, -1.57]]
    robot_ic = [[ 0.8, -0.30,  0.00], [-0.60,  0.00, -1.57], [0.50, 2.50, 1.57], [-1.50, -2.50, 0.00]]
    for i in range(N):
        robots.append( Robot('robot%d'%(i), GetNodeLabel(robot_ic[i], W_xgrid, W_ygrid, pix2m)) )
    
    # hardcoded for now, full list of goals, number of items indicate number of pallets
    pickups  = [[-0.60,  0.35, -1.57], [1.10, -0.30, 0.00], [1.10, -0.30, 0.00], [-1.50,  2.50, -1.57]]
    dropoffs = [[-1.50, -1.60, -1.57], [1.10, -2.00, 3.14], [1.10,  2.30, 0.00], [-0.30, -2.20,  0.00]]
    pallets = []
    for i in range(len(pickups)):
        #pallets.append( Pallet('p%d'%i, pickups[i], dropoffs[i]) )
        pallets.append( Pallet('p%d'%i, \
                        GetNodeLabel(pickups[i], W_xgrid, W_ygrid, pix2m), \
                        GetNodeLabel(dropoffs[i], W_xgrid, W_ygrid, pix2m) ) )
    if(formalism.upper() == 'B2'):
        create_domain_file3()
        create_task_file3(robots, pallets, roadmap)
    elif(formalism.upper() == 'C'):
        create_domain_file4()
        create_task_file4(robots, pallets, roadmap)
    elif(formalism.upper() == 'B1'):
        create_domain_file5()
        create_task_file5(robots, pallets, roadmap)
    elif(formalism.upper() == 'D'):
        create_domain_file6()
        create_task_file6(robots, pallets, roadmap)
    else:
        print('don\'t know what to do :(')

    # Copy the content 
    source = d_filename 
    destination = copy_to_folder + 'domain.pddl'
    dest = shutil.copyfile(source, destination) 
    
    source = t_filename 
    destination = copy_to_folder + 'problem.pddl'
    dest = shutil.copyfile(source, destination) 
    
    print(f'also copied the files to the {copy_to_folder} folder')
    # run with:
    # singularity run -C -H $RUNDIR planner.img $DOMAIN $PROBLEM $PLANFIL

#%%
# #for the ploting of the "graph" object
# import matplotlib.pyplot as plt
# pos = nx.layout.spring_layout(roadmap, k=0.8)
# #pos = nx.layout.random_layout(roadmap)
# #pos = nx.layout.spiral_layout(roadmap)

# ec = nx.draw_networkx_edges(roadmap, pos, alpha=0.2)
# nc = nx.draw_networkx_nodes(roadmap, pos, \
#                             with_labels=False, node_size=12, cmap=plt.cm.Blues)
# # C
# colors = [(0.9,0.0,0.0)]*len(pos)
# nc = nx.draw_networkx_nodes(roadmap, pos, node_color=colors, \
#                             with_labels=False, node_size=12, cmap=plt.cm.jet)

# # nodes = ['H2X7Y5', 'H3X2Y4', 'H1X4Y15', 'H0X12Y17', \
#                     # 'H3X1Y12', 'H2X7Y20', 'H2X7Y5', 'H3X2Y4', \
#                     # 'H1X9Y5', 'H1X4Y11']
# # locations = unique(['H2X7Y5', 'H3X2Y4', 'H1X4Y15', 'H0X12Y17', \
#                     # 'H3X1Y12', 'H2X7Y20', 'H2X7Y5', 'H3X2Y4', \
#                     # 'H1X9Y5', 'H1X4Y11'])    
# starting_points = unique(['H0X9Y10', 'H3X5Y11'])
# goal_points = (['H3X5Y12', 'H0X10Y10', 'H3X2Y20', 'H3X2Y6', 'H2X10Y5', 'H0X10Y19', 'H0X6Y4'])
# locations = starting_points + goal_points
# nodes = []
# # b2
# nodes = locations.copy()
# # b1
# # perm = combinations_with_replacement(locations, 2)
# # for i in list(perm):  
# #     if(i[0] == i[1]):
# #         nodes.append(i[0])
# #     else:
# #         path = nx.dijkstra_path(roadmap, source=i[0], target=i[1], weight='weight1')
# #         for j in range(len(path)-1):
# #             if(path[j+1] not in nodes):
# #                 nodes.append(path[j+1])
# #         path = nx.dijkstra_path(roadmap, source=i[1], target=i[0], weight='weight1')
# #         for j in range(len(path)-1):
# #             if(path[j+1] not in nodes):
# #                 nodes.append(path[j+1])
# # nodes = unique(nodes)

# for i in starting_points:
#     nodes.remove(i)
# for i in goal_points:
#     nodes.remove(i)
# colors = [(0.9,0.0,0.0)]*len(nodes)
# nc = nx.draw_networkx_nodes(roadmap, pos, nodelist=nodes, node_color=colors, \
#                             with_labels=False, node_size=20, cmap=plt.cm.jet)
# colors = [(1., 0.85, 0.)]*len(starting_points)
# nc = nx.draw_networkx_nodes(roadmap, pos, nodelist=starting_points, node_color=colors, \
#                             with_labels=False, node_size=20, cmap=plt.cm.jet)
# colors = [(0.4, 0.85, 0.4)]*len(goal_points)
# nc = nx.draw_networkx_nodes(roadmap, pos, nodelist=goal_points, node_color=colors, \
#                             with_labels=False, node_size=20, cmap=plt.cm.jet)
# # colors = [(0.0,0.8,0.0)]*len(locations)
# # nc = nx.draw_networkx_nodes(roadmap, pos, nodelist=locations, node_color=colors, \
# #                             with_labels=False, node_size=20, cmap=plt.cm.jet)
# plt.title("Roadmap and meaningful points")
# plt.show()
