#!/usr/bin/perl -w

$node_i = 1 ;
$node_f = 48 ;
$node_digit = 3 ;
$node_name = 'n' ;

$threshold = 10 ;   # threshold of %CPU to display
$ptcl = 'ssh' ;
$cmd  = 'top -n 1 b' ;
$column_pid = 1 ;
$column_usr = 2 ;
$column_cpu = 9 ;

for ($i = $node_i; $i <= $node_f; ++$i)
{
   $remote = $node_name . substr($i+10**$node_digit,1,$node_digit) ;

   print STDOUT "--------------------------------------\n" ;
   print STDOUT "## $remote ##\n\n" ;

   @top = `$ptcl $remote $cmd` ;
   foreach $line (@top)
   {
      @line_sp = split(" ",$line) ;
      $pid = $line_sp[$column_pid-1] ;
      $usr = $line_sp[$column_usr-1] ;
      $cpu = $line_sp[$column_cpu-1] ;

      unless (defined($pid) && $pid =~ /\d+/) 
      {
         next ;
      }
      
      if ($usr ne 'root' && $cpu >= $threshold)
      {
         print STDOUT $line ;
      }
   }
   print STDOUT "\n\n" ;
}

exit ;
