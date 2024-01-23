#!/usr/bin/perl 

use strict;
use warnings;

#print"5\n" 
my $sudo_sessions = `journalctl | grep "sudo" | wc -l`;
chomp $sudo_sessions; 
print $sudo_sessions;
#testsave
#test

