#!/usr/bin/perl 

use strict;
use warnings;

#print"5\n" 
my $sudo_sessions = `journalctl | grep -c "pam_unix(sudo:session): session opened"`;
chomp $sudo_sessions; 
print ".1.3.6.1.2.1.1 = \ "$sudo_sessions\"";
print "5555555555555555555555"; 
#testsave
