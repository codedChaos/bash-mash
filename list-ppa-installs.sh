#!/bin/bash

# write command that takes arguments to list ppa repos, installed apps, and available apps in the repos

# lsppa -list-repos -list-installed -list-available


apt-cache policy $(dpkg --get-selections | grep -v deinstall$ | awk '{ print $1 }') | perl -e '@a = <>; $a=join("", @a); $a =~ s/\n(\S)/\n\n$1/g;  @packages = split("\n\n", $a); foreach $p (@packages) { print "$1: $2\n" if $p =~ /^(.*?):.*?500 http:\/\/ppa\.launchpad\.net\/(.*?)\s/s }'