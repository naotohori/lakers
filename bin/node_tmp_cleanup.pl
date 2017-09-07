#!/usr/bin/perl -w

$node_i = 1 ;
$node_f = 48 ;
$node_digit = 3 ;
$node_name = 'n' ;

$ptcl = 'ssh' ;
$cmd  = '"rm -rf /tmp/*"' ;
#$cmd  = '"rm -rf /tmp/K50_???"' ;

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
