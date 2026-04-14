#!/usr/bin/env perl
#
# `tum.pl`
#
# A universal utility for UNIX-like operating systems created by Archetypum,
# designed to simplify interactions with UNIX-like operating systems and
# streamline the development of system-related Perl scripts (Experimental).
#
# Copyright (C) 2026 Archetypum
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>

use strict;
use warnings;

our $VERSION = "2.2.4-stable";
our @SUPPORTED_PMS = (
    "apt", "apt-get", "apt-cache", "apt-cdrom", "apt-config", "apt-extracttemplates", "apt-listchanges", 
    "apt-mark", "apt-sortpkgs", "aptitude", "aptitude-create-state-bundle", "aptitude-run-state-bundle", "apk",
    "dnf", "dpkg", "guix", "homebrew", "pkgman", "pkg", "pkgin", "pkg_add", "pkg_delete", "pkg_create", "pkg_info",
    "pacman", "yay", "pamac", "trizen", "portage", "qi", "slackpkg", "xbps-install", "xbps-remove", "xbps-query",
    "yum", "zypper", "zypper-log"
);
our @SUPPORTED_INITS = (
    "sysvinit", "openrc", "s6", "runit", "systemd", "dinit", "launchd", "launch_roster"
);

sub get_distro
{

}

sub get_init
{
    sub return_pid_comm
    {
        my ($pid) = @_;

        my $comm;

        if (-e "/bin/busybox") {
            $comm = `cat /proc/$pid/comm`;
            chomp $comm;
        } else {
            $comm = `ps -p $pid -o comm= 2>/dev/null`;
            chomp $comm;
        }

        if (not defined $comm or $comm eq "") {
            return undef;
        } else {
            return $comm;
        }
    }

    my $init_comm = return_pid_comm(1);

    if ($init_comm eq "systemd") {
        print "systemd\n";
        return;
    }

    if (-d "/etc/rc.d") {
        print "rc\n";
        return;
    }

    if ($init_comm eq "init") {
        if (-e "/sbin/openrc") {
            print "openrc\n";
            return;
        } else {
            print "sysvinit\n";
            return;
        }

        my $os = get_distro();
        if ($os eq "Minix") {
            print "MINIX init\n";
            return;
        }
    }

    if ($init_comm eq "s6-svscan") {
        print "s6\n";
        return;
    }

    if ($init_comm eq "runit") {
        print "runit\n";
        return;
    }

    if ($init_comm eq "dinit") {
        print "dinit\n";
        return;
    }

    if ($init_comm eq "shepherd") {
        print "shepherd\n";
        return;
    }

    if ($init_comm eq "launchd") {
        print "launchd\n";
        return;
    }

    if (has("launch_roster")) {
        print "launch_roster\n";
        return;
    }

    print "unknown\n";
    return;
}

sub get_pid_comm
{
    my ($pid) = @_;

    my $comm;

    if (-e "/bin/busybox") {
        $comm = `cat /proc/$pid/comm`;
        chomp $comm;
    } else {
        $comm = `ps -p $pid -o comm= 2>/dev/null`;
        chomp $comm;
    }

    if (not defined $comm or $comm eq "") {
        print "[!] No such process.\n";
    } else {
        print "$comm\n";
    }
}

sub get_package_manager
{
    for my $manager (@SUPPORTED_PMS) {
        if (has($manager)) {
            print "$manager\n";
            return 1;
        }
    }

    return "unknown\n"; 
}

sub prompt_user
{

}

sub check_privileges
{
    if ($> != 0) {
        print "[*] Not running as root.\n";
        return 0;
    } else {
        print "[*] Running as root.\n";
        return 1;
    }
}

sub has 
{
    my ($cmd) = @_;
    return 0 unless defined $cmd;

    for my $dir (split /:/, $ENV{PATH} // "") {
        return 1 if -x "$dir/$cmd";
    }
    return 0;
}

sub main
{
    my ($cmd, @args) = @ARGV;

    return unless defined $cmd;

    if ($cmd eq "h" || $cmd eq "-h" || $cmd eq "--help") {
        print "==== Archetypum TheUnixManager (Perl) ====\n";
        print "[*] Usage: tum <command> [arguments]\n\n";
        print "[...] Options:\n";
        print "  h, -h, --help       Show this help message.\n";
        print "  c, -c, --commands   List all available commands.\n";
        print "  v, -v, --version    Show tum version.\n\n";
        print "Check 'man tum' for more info.\n";
        exit 0;

    } elsif ($cmd eq "c" || $cmd eq "-c" || $cmd eq "--commands") {
        print "[...] Available commands:\n";

        no strict "refs";
        for my $symbol (sort keys %main::) {
            next if $symbol eq "main";
            next unless defined &{$symbol};
            print " - $symbol\n";
        }

        exit 0;

    } elsif ($cmd eq "v" || $cmd eq "-v" || $cmd eq "--version") {
        print "$VERSION\n";
        exit 0;

    } else {
        no strict "refs";

        if (defined &{$cmd}) {
            &{$cmd}(@args);
        } else {
            print "[!] Error invoking '$cmd' or unknown command '$cmd'.\n";
            print "Check '--help'.\n";
            exit 1;
        }
    }
}

main() unless caller;

