#!/usr/bin/env python

#!/bin/bash
#h=`squeue -u hori -h | wc -l`
#t=`squeue -u tienhung -h | wc -l`
#k=`squeue -u mk37256 -h | wc -l`
#m=`squeue -u maurolm -h | wc -l`
#echo 'Hori ' $h
#echo 'Hung ' $t
#echo 'Marina ' $k
#echo 'Mauro ' $m
#let total='48*16'
#let avail="$total-$h-$t"
#echo 'AVAIL' $avail
#echo 'TOTAL' $total

import subprocess

exe='squeue --noheader --format="%.8u %.2t %.6D %.6C"'

proc = subprocess.Popen(exe, shell=True, stdout=subprocess.PIPE)

user_usage = {}

squeue = []
for l in iter(proc.stdout.readline, ''):
    if l[0] == '#':
        continue

    squeue.append(l.rstrip('\n'))
    lsp = l.split()

    user = lsp[0]
    stat = lsp[1]
    node = int(lsp[2])
    core = int(lsp[3])

    if user in user_usage:
        if stat == 'R':
            user_usage[user][0] += node
            user_usage[user][1] += core
        else:
            user_usage[user][2] += node
            user_usage[user][3] += core
    else:
        if stat == 'R':
            user_usage[user] = [node, core,    0,    0]
        else:
            user_usage[user] = [    0,   0, node, core]

print ('#             Running       Pending       Total')
print ('#   User    Node   Core   Node   Core   Node   Core')
total_R_node = 0
total_R_core = 0
total_P_node = 0
total_P_core = 0
total_node = 0
total_core = 0
for user, usage in user_usage.iteritems():
    total_R_node += usage[0]
    total_R_core += usage[1]
    total_P_node += usage[2]
    total_P_core += usage[3]
    print ("%8s %6i %6i %6i %6i %6i %6i" % (user, usage[0], usage[1], usage[2], usage[3], usage[0]+usage[2], usage[1]+usage[3]))

print ("%8s %6i %6i %6i %6i %6i %6i" % ('Total' , total_R_node, total_R_core,
                                                   total_P_node, total_P_core, total_node, total_core,))
