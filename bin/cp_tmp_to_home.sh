#!/bin/bash
set -eu

n_node_i=1
n_node_f=48

datetime=`date +%Y%m%d%H%M%S`
copy_to="$HOME/tmp_$datetime"
mkdir $copy_to

for (( i=$n_node_i ; i<=$n_node_f ; ++i )) do
   printf -v node "n%03i" $i
   ssh $node "find /tmp -maxdepth 1 -user $USER -exec cp -r {} $copy_to \;"
done
