set term postscript color 20 solid
set out 'times_summary.ps'

set boxwidth 1
set style fill solid 0.5 border

set yl 'time / sec'
unset xl

set yr [0:25]
set ytics 0,5
set xr [-0.5:40.5]
unset key

#set xtics ('i O0' 3, 'i O2' 7, 'i O3' 11, 'i O2x' 15, 'i O3x' 19,\
#           'g' 23, 'g O2' 27, 'g Of' 31,\
#           'g san' 35, 'g O2 san' 39, 'g Of san' 43,\
#           'g bro' 47, 'g O2 bro' 51, 'g Of bro' 55)  rotate by 45 right

set xtics ('i O0' 3, 'i O2' 7, 'i O3' 11,\
           'i O2 xH' 15, 'i O3 xH' 19,\
           'g' 23, 'g O2' 27, 'g Of' 31,\
           'g O2 nat' 35, 'g Of nat' 39) rotate by 45 right
#           'g O2 nat' 35, 'g Of nat' 39,\
#           'g O2 bro' 43, 'g Of bro' 47 ) rotate by 45 right

p 'times_summary.out' u ($0*4+1):2:3 w boxerror lw 2\
, 'times_summary.out' u ($0*4+2):4:5 w boxerror lw 2\
, 'times_summary.out' u ($0*4+3):6:7 w boxerror lw 2
