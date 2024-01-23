#!/usr/bin/perl 

use strict;
use warnings;

#print"5\n" 
my $sudo_sessions = `journalctl _COMM=sudo | grep -c "COMMAND=sh"`;
print $sudosessions; 
#testsave


