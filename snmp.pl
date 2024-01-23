#!/usr/bin/perl 

use strict;
use warnings;

#print"5\n" 
my $sudo_sessions = `journalctl | grep "sudo" | wc -l`;
print $sudo_sessions; 
#testsave


