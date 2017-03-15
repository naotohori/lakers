
#for (( i=0 ; i<10 ; ++i )) do
#./a.out.O0 > testout.O0.$i &
#./a.out.O2 > testout.O2.$i &
#./a.out.O3 > testout.O3.$i &
#./a.out.O2.xHost > testout.O2.xHost.$i &
#./a.out.O3.xHost > testout.O3.xHost.$i &
#sleep 60
#done

module switch intel gnu

for (( i=0 ; i<10 ; ++i )) do
./a.out.g > testout.g.$i &
./a.out.gO2 > testout.gO2.$i &
./a.out.gOfast > testout.gOfast.$i &
#./a.out.g.sandy > testout.g.sandy.$i &
#./a.out.gO2.sandy > testout.gO2.sandy.$i &
#./a.out.gOfast.sandy > testout.gOfast.sandy.$i &
./a.out.g.broad > testout.g.broad.$i &
./a.out.gO2.broad > testout.gO2.broad.$i &
./a.out.gOfast.broad > testout.gOfast.broad.$i &
./a.out.gO2.nat > testout.gO2.nat.$i &
./a.out.gOfast.nat > testout.gOfast.nat.$i &
sleep 60
done

module switch gnu intel
