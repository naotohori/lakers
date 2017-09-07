#!/usr/bin/perl -w

if (@ARGV != 1)
{
   print STDOUT 'usage: %SCRIPT [word]'."\n" ;
   exit ;
}

$node_i = 1 ;
$node_f = 48 ;
$node_digit = 3 ;
$node_name = 'n' ;

$ptcl = 'ssh' ;
$cmd  = "ps aux | grep $ARGV[0]" ;

for ($i = $node_i; $i <= $node_f; ++$i)
{
   $remote = $node_name . substr($i+10**$node_digit,1,$node_digit) ;

   print STDOUT "--------------------------------------\n" ;
   print STDOUT "## $remote ##\n\n" ;

   system("$ptcl $remote $cmd") ;
   #@top = `$ptcl $remote $cmd` ;
   #foreach $line (@top)
   #{
   #   print STDOUT $line ;
   #}
   print STDOUT "\n\n" ;
}

exit ;
