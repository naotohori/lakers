#!/usr/bin/perl -w

$node_i = 1 ;
$node_f = 24 ;
$node_digit = 2 ;
$node_name = 'melvin' ;

$ptcl = 'rsh' ;
$cmd  = 'ps aux' ;

for ($i = $node_i; $i <= $node_f; ++$i)
{
   $remote = $node_name . substr($i+10**$node_digit,1,$node_digit) ;

   print STDOUT "--------------------------------------\n" ;
   print STDOUT "## $remote ##\n\n" ;

   @top = `$ptcl $remote $cmd` ;
   foreach $line (@top)
   {
      if ($line =~ /python/)
      {
         print $line ; 
      }
   }
   print STDOUT "\n\n" ;
}

exit ;
