#!/usr/local/bin/perl
# hunter_killer
# remove whole dir trees fast

use File::Find qw(finddepth);
die "usage: $0 dir ..\n" unless @ARGV;
*name = *File::Find::name;
finddepth \&hunt_kill, @ARGV;
sub hunt_kill {
    if (!-l && -d _) {
        print "rmdir $name\n";
        rmdir($name)  or warn "couldn't rmdir $name: $!";
    } else {
        print "unlink $name";
        unlink($name) or warn "couldn't unlink $name: $!";
    }
}