#!/usr/bin/perl 

use strict;
use warnings;

#print"5\n" 
my $sudo_sessions = `journalctl | grep -c "pam_unix(sudo:session)"`;
chomp $sudo_sessions; 
print $sudo_sessions;
#testsave
