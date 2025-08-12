#!/usr/bin/env bash
#
# `lib/init_system/launchd.sh`
#
# Copyright (C) 2025 Archetypum
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

#
# Disable Unicode for speed:
#
LC_ALL=C
LANG=C

declare -r RED="\033[0;31m"
declare -r GREEN="\033[0;32m"
declare -r RESET="\033[0m"

_run_launchctl()
{
    local action="$1"
    local service="$2"

    launchctl "$action" "$service" >/dev/null 2>&1 &&
        { printf "${GREEN}[*] Success!${RESET}\n"; return 0; } ||
        { printf "${RED}[!] Error: 'launchctl $action $service' failed.${RESET}\n"; return 1; }
}

bootstrap_launchctl()      { _run_launchctl "bootstrap"      "$1"; }
bootout_launchctl()        { _run_launchctl "bootout"        "$1"; }
enable_launchctl()         { _run_launchctl "enable"         "$1"; }
disable_launchctl()        { _run_launchctl "disable"        "$1"; }
uncache_launchctl()        { _run_launchctl "uncache"        "$1"; }
kickstart_launchctl()      { _run_launchctl "kickstart"      "$1"; }
attach_launchctl()         { _run_launchctl "attach"         "$1"; }
debug_launchctl()          { _run_launchctl "debug"          "$1"; }
kill_launchctl()           { _run_launchctl "kill"           "$1"; }
blame_launchctl()          { _run_launchctl "blame"          "$1"; }
print_launchctl()          { _run_launchctl "print"          "$1"; }
print_cache_launchctl()    { _run_launchctl "print-cache"    "$1"; }
print_disabled_launchctl() { _run_launchctl "print-disabled" "$1"; }
plist_launchctl()          { _run_launchctl "plist"          "$1"; }
procinfo_launchctl()       { _run_launchctl "procinfo"       "$1"; }
hostinfo_launchctl()       { _run_launchctl "hostinfo"       "$1"; }
resolveport_launchctl()    { _run_launchctl "resolveport"    "$1"; }
examine_launchctl()        { _run_launchctl "examine"        "$1"; }
reboot_launchctl()         { _run_launchctl "reboot"         "$1"; }
error_launchctl()          { _run_launchctl "error"          "$1"; }
variant_launchctl()        { _run_launchctl "variant"        "$1"; }
version_launchctl()        { _run_launchctl "version"        "$1"; }
load_launchctl()           { _run_launchctl "load"           "$1"; }
unload_launchctl()         { _run_launchctl "unload"         "$1"; }
submit_launchctl()         { _run_launchctl "submit"         "$1"; }
remove_launchctl()         { _run_launchctl "remove"         "$1"; }
start_launchctl()          { _run_launchctl "start"          "$1"; }
stop_launchctl()           { _run_launchctl "stop"           "$1"; }
list_launchctl()           { _run_launchctl "list"           "$1"; }
setenv_launchctl()         { _run_launchctl "setenv"         "$1"; }
unsetenv_launchctl()       { _run_launchctl "unsetenv"       "$1"; }
getenv_launchctl()         { _run_launchctl "getenv"         "$1"; }
export_launchctl()         { _run_launchctl "export"         "$1"; }
limit_launchctl()          { _run_launchctl "limit"          "$1"; }
bsexec_launchctl()         { _run_launchctl "bsexec"         "$1"; }
asuser_launchctl()         { _run_launchctl "asuser"         "$1"; }
managerpid_launchctl()     { _run_launchctl "managerpid"     "$1"; }
manageruid_launchctl()     { _run_launchctl "manageruid"     "$1"; }
managername_launchctl()    { _run_launchctl "managername"    "$1"; }
help_launchctl()           { _run_launchctl "help"           "$1"; }

execute_launchctl()
{
    local command="$1"
    local service="$2"

    case "$command" in
        "bootstrap" | "bootout" | "enable" | "disable" | "uncache" | "kickstart" | "attach" | "debug" | \
        "kill" | "blame" | "print" | "print-cache" | "print-disabled" | "plist" | "procinfo" | "hostinfo" | \
        "resolveport" | "examine" | "reboot" | "error" | "variant" | "version" | "load" | "unload" | "submit" | \
        "remove" | "start" | "stop" | "list" | "setenv" | "unsetenv" | "getenv" | "export" | "limit" | "bsexec" | \
        "asuser" | "managerpid" | "manageruid" | "managername" | "help")
        	;;

        *)
            printf "${RED}[!] Error: Unsupported command: '$command'.${RESET}"
            return 1
            ;;
    esac

    local func_name="${command//-/_}_launchctl"
    "$func_name" "$service"
}
