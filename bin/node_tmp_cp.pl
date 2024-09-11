#!/usr/bin/perl -w

$node_i = 1 ;
$node_f = 48 ;
$node_digit = 3 ;
$node_name = 'n' ;

$ptcl = 'ssh' ;
#$cmd  = '"cp /tmp/NHM_Allen150*/* /home/hori/meo/TISDNA/MDcode/MEO/output/"' ;
#$cmd  = '"cp /tmp/NH_chp_NaCl*_6_omp_T*/* /home/hori/chempot/chp_NaCl_6_omp"' ;
#$cmd  = '"cp /tmp/NH_*_ND7_*/* /home/hori/chempot/chp_NaCl_ND7_omp"' ;
#$cmd  = '"cp /tmp/NH_*_ND8_*/* /home/hori/chempot/chp_NaCl_ND8_omp"' ;
#$cmd = '"cp /tmp/NH_vpk15_Mg5K50_repT/* /home/hori/L10/vpk15_Mg5K50_repT/"' ;
#$cmd  = '"rm -r /tmp/NH_vpk15_Mg5K50_repT"' ;
#$cmd = '"cp /tmp/NH_htr15_NN_K200_repT/* /home/hori/L10/htr15_NN_K200_repT/"' ;
#$cmd = '"rm -r /tmp/NH_htr15_NN_K200_repT"' ;
#$cmd = '"cp /tmp/NH_vpk15_NN1s_Mg5K50_repT/* /home/hori/L10/vpk15_NN1s_Mg5K50_repT/"' ;
$cmd  = '"rm -r /tmp/NH_vpk15_NN1s_Mg5K50_repT"' ;

for ($i = $node_i; $i <= $node_f; ++$i)
{
   $remote = $node_name . substr($i+10**$node_digit,1,$node_digit) ;

   print STDOUT "--------------------------------------\n" ;
   print STDOUT "## $remote ##\n\n" ;

   @top = `$ptcl $remote $cmd` ;
   foreach $line (@top)
   {
      print $line ; 
   }
   print STDOUT "\n\n" ;
}

exit ;
