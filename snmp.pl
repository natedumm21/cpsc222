#!/usr/bin/perl 

#use strict;
#use warnings;

#print"5\n" 
#my $sudo_sessions = `journalctl | grep -c "pam_unix(sudo:session): session opened"`;
#chomp $sudo_sessions; 
#print "$sudo_sessions";

#testsave

#use strict;
#use warnings;

# Full path to journalctl command
#my $journalctl_path = '/usr/bin/journalctl';

# Run journalctl command and capture output and errors
#my $sudo_sessions = `$journalctl_path | grep -c "pam_unix(sudo:session): session opened" 2>&1`;
#chomp $sudo_sessions;

# Check for errors
#if ($?) {
#    print "Error running journalctl: $sudo_sessions\n";
#    exit 1;
#}

# Print SNMP-compatible output
#print ".1.3.6.1.2.1.1 = \"$sudo_sessions\"\n";
#!/usr/bin/perl

use strict;
use warnings;

my $auth_logs = '/var/log/auth.log';  # Adjust the path if needed

open my $fh, '<', $auth_logs or die "Cannot open $auth_logs: $!";
my $sudo_sessions = 0;

while (<$fh>) {
    $sudo_sessions++ if /pam_unix\(sudo:session\): session opened/;
}

close $fh;
chomp $sudo_sessions;
print "$sudo_sessions";
