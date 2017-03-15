
ifort -O0  mt_stream/mt_kind_defs.F90 mt_stream/mt_stream.F90 mt_stream/gf2xe.F90 mt_stream/f_get_coeff.F90 speed_box_muller.F90 -o a.out.O0
rm *.mod

ifort -O2  mt_stream/mt_kind_defs.F90 mt_stream/mt_stream.F90 mt_stream/gf2xe.F90 mt_stream/f_get_coeff.F90 speed_box_muller.F90 -o a.out.O2
rm *.mod

ifort -O3  mt_stream/mt_kind_defs.F90 mt_stream/mt_stream.F90 mt_stream/gf2xe.F90 mt_stream/f_get_coeff.F90 speed_box_muller.F90 -o a.out.O3
rm *.mod

ifort -O2 -xHost  mt_stream/mt_kind_defs.F90 mt_stream/mt_stream.F90 mt_stream/gf2xe.F90 mt_stream/f_get_coeff.F90 speed_box_muller.F90 -o a.out.O2.xHost
rm *.mod

ifort -O3 -xHost  mt_stream/mt_kind_defs.F90 mt_stream/mt_stream.F90 mt_stream/gf2xe.F90 mt_stream/f_get_coeff.F90 speed_box_muller.F90 -o a.out.O3.xHost
rm *.mod


module switch intel gnu

gfortran -fno-range-check  mt_stream/mt_kind_defs.F90 mt_stream/mt_stream.F90 mt_stream/gf2xe.F90 mt_stream/f_get_coeff.F90 speed_box_muller.F90 -o a.out.g
rm *.mod

gfortran -O2 -fno-range-check  mt_stream/mt_kind_defs.F90 mt_stream/mt_stream.F90 mt_stream/gf2xe.F90 mt_stream/f_get_coeff.F90 speed_box_muller.F90 -o a.out.gO2
rm *.mod

gfortran -Ofast -fno-range-check  mt_stream/mt_kind_defs.F90 mt_stream/mt_stream.F90 mt_stream/gf2xe.F90 mt_stream/f_get_coeff.F90 speed_box_muller.F90 -o a.out.gOfast
rm *.mod

#gfortran -O2 -march=sandybridge -fno-range-check  mt_stream/mt_kind_defs.F90 mt_stream/mt_stream.F90 mt_stream/gf2xe.F90 mt_stream/f_get_coeff.F90 speed_box_muller.F90 -o a.out.gO2.sandy
#rm *.mod
#
#gfortran -Ofast -march=sandybridge -fno-range-check  mt_stream/mt_kind_defs.F90 mt_stream/mt_stream.F90 mt_stream/gf2xe.F90 mt_stream/f_get_coeff.F90 speed_box_muller.F90 -o a.out.gOfast.sandy
#rm *.mod
#

gfortran -O2 -march=native -fno-range-check  mt_stream/mt_kind_defs.F90 mt_stream/mt_stream.F90 mt_stream/gf2xe.F90 mt_stream/f_get_coeff.F90 speed_box_muller.F90 -o a.out.gO2.nat
rm *.mod

gfortran -Ofast -march=native -fno-range-check  mt_stream/mt_kind_defs.F90 mt_stream/mt_stream.F90 mt_stream/gf2xe.F90 mt_stream/f_get_coeff.F90 speed_box_muller.F90 -o a.out.gOfast.nat
rm *.mod

gfortran -O2 -march=broadwell -fno-range-check  mt_stream/mt_kind_defs.F90 mt_stream/mt_stream.F90 mt_stream/gf2xe.F90 mt_stream/f_get_coeff.F90 speed_box_muller.F90 -o a.out.gO2.broad
rm *.mod

gfortran -Ofast -march=broadwell -fno-range-check  mt_stream/mt_kind_defs.F90 mt_stream/mt_stream.F90 mt_stream/gf2xe.F90 mt_stream/f_get_coeff.F90 speed_box_muller.F90 -o a.out.gOfast.broad
rm *.mod


module switch gnu intel
