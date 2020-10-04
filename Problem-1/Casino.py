# -*- coding: utf-8 -*-
"""
Created on Wed Sep  4 14:58:08 2019

@author: vkaus
"""
from gurobipy import *

oh_mach={'NB':200,'DR':150,'DOR':100,'GP':250,'HDD':125,'ML':100,'BJ':250}

area_req={'NB':2,'DR':2.5,'DOR':6,'GP':2.75,'HDD':3.5,'ML':4,'BJ':2.75}

exp_rev={'NB':2000,'DR':3500,'DOR':4500,'GP':750,'HDD':3000,'ML':2500,'BJ':3000}

op_cost={'NB':800,'DR':400,'DOR':1500,'GP':200,'HDD':1000,'ML':500,'BJ':500}

main_eff={'NB':0.67,'DR':1,'DOR':2,'GP':1.1,'HDD':0.67,'ML':0.5,'BJ':0.75}




#Creating a Model
casino=Model()
casino.modelSense=GRB.MAXIMIZE
casino.update()

#creating Indecies
slot_mach=['NB','DR','DOR','GP','HDD','ML','BJ']
floors={'F1':750,'F2':1000,'F3':550,'F4':700}

#Decision Variables

no_of_mach={}
for fl in floors:
    for sl in slot_mach:
        no_of_mach[fl,sl]=casino.addVar(obj=exp_rev[sl] - op_cost[sl],vtype=GRB.INTEGER,name= f'x{fl}_{sl}')

#Constraints

my_const={}

my_const['hrs_month']=casino.addConstr(quicksum(no_of_mach[fl,sl]*main_eff[sl] for sl in slot_mach for fl in floors) <= 835, name='hrs_month')

for sl in slot_mach:
    cname=f'onhand_{sl}'
    my_const[cname]=casino.addConstr(quicksum(no_of_mach[fl,sl] for fl in floors) <= oh_mach[sl], name=cname)
    
for fl in floors:
    cname=f'{fl}'
    my_const[cname]=casino.addConstr(quicksum(area_req[sl]*no_of_mach[fl,sl] for sl in slot_mach) <= floors[fl], name=cname)


casino.update()
casino.write('casino.lp')
casino.optimize()
casino.write('casino.sol')

#saving results in csv file

import csv

with open('casino.csv', mode='w', newline='') as csv_file:
    writer = csv.DictWriter(csv_file, fieldnames=['fl', 'slot_mach', 'no_of_mach'])
    writer.writeheader()

    for item, value in no_of_mach.items():
        writer.writerow({'fl':item[0], 'slot_mach':item[1], 'no_of_mach':value.X})


#saving results in database
import sqlite3

if casino.Status == GRB.OPTIMAL:
    conn = sqlite3.connect('casino.db')
    cursor=conn.cursor()
    casino_sol=[]
    for v in no_of_mach:
        if no_of_mach[v].x > 0:
            a=(v[0],v[1], no_of_mach[v].x)
            casino_sol.append(a)
            

cursor.execute('CREATE TABLE IF NOT EXISTS tblcasino(Floors text, Slot_Machine_Types text, No_of_Machines integer)')
cursor.executemany('INSERT INTO tblcasino VALUES(?,?,?)', casino_sol)
cursor.execute('SELECT * FROM tblcasino')
rows = cursor.fetchall() 
print(rows)
conn.commit()
conn.close()

##################################################################################################################################################################################


    