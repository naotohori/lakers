#!/usr/bin/perl -w

$node_i = 1 ;
$node_f = 24 ;
$node_digit = 2 ;
$node_name = 'node' ;

$ptcl = 'rsh' ;
$cmd  = 'pkill python' ;

for ($i = $node_i; $i <= $node_f; ++$i)
{
   $remote = $node_name . substr($i+10**$node_digit,1,$node_digit) ;

   print STDOUT "--------------------------------------\n" ;
   print STDOUT "## $remote ##\n\n" ;

   system("$ptcl $remote $cmd") ;
   system("$ptcl $remote ps aux | grep python") ;
   print STDOUT "\n\n" ;
}

exit ;
