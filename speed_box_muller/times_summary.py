#!/usr/bin/env python

import numpy as np

Niter = 10

types_intel = ['O0','O2','O3','O2.xHost', 'O3.xHost']
#types_gnu = ['g', 'gO2', 'gOfast',
#             'g.sandy', 'gO2.sandy', 'gOfast.sandy', 
#             'g.broad', 'gO2.broad', 'gOfast.broad']
types_gnu = ['g', 'gO2', 'gOfast', 'gO2.nat', 'gOfast.nat',
             'gO2.broad', 'gOfast.broad']


times = dict.fromkeys(types_intel+types_gnu)

for x in times.keys():
    method1_times = []
    method2_times = []
    method3_times = []

    for i in range(Niter):
        f = open('testout.%s.%i' % (x,i))
        method1_times.append( float(f.readline().split()[2]) )
        method2_times.append( float(f.readline().split()[2]) )
        method3_times.append( float(f.readline().split()[2]) )
        f.close()

    times[ x ] = ( (np.mean(method1_times), np.std(method1_times)), 
                   (np.mean(method2_times), np.std(method2_times)), 
                   (np.mean(method3_times), np.std(method3_times)) )


#################

f_out = open('times_summary.out','w')

for x in types_intel:
    f_out.write('%12s' % x)
    for i in range(3):
        f_out.write('  %6.3f %6.3f' % times[x][i])
    f_out.write('\n')

for x in types_gnu:
    f_out.write('%12s' % x)
    for i in range(3):
        f_out.write('  %6.3f %6.3f' % times[x][i])
    f_out.write('\n')
