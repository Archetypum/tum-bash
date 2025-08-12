#!/usr/bin/env bash
#
# `lib/init_system.dinit.sh`
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

_run_dinitctl()
{
    local action="$1"
    local service="$2"

    dinitctl "$action" "$service" >/dev/null 2>&1 &&
        { printf "${GREEN}[*] Success!${RESET}\n"; return 0; } ||
        { printf "${RED}[!] Error: 'dinitctl $action $service' failed.${RESET}\n"; return 1; }
}

start_dinitctl()      { _run_dinitctl "start"      "$1"; }
stop_dinitctl()       { _run_dinitctl "stop"       "$1"; }
status_dinitctl()     { _run_dinitctl "status"     "$1"; }
is_started_dinitctl() { _run_dinitctl "is-started" "$1"; }
is_failed_dinitctl()  { _run_dinitctl "is-failed"  "$1"; }
restart_dinitctl()    { _run_dinitctl "restart"    "$1"; }
wake_dinitctl()       { _run_dinitctl "wake"       "$1"; }
release_dinitctl()    { _run_dinitctl "release"    "$1"; }
unpin_dinitctl()      { _run_dinitctl "unpin"      "$1"; }
unload_dinitctl()     { _run_dinitctl "unload"     "$1"; }
reload_dinitctl()     { _run_dinitctl "reload"     "$1"; }
list_dinitctl()       { _run_dinitctl "list"       "$1"; }
shutdown_dinitctl()   { _run_dinitctl "shutdown"   "$1"; }
add_dep_dinitctl()    { _run_dinitctl "add-dep"    "$1"; }
rm_dep_dinitctl()     { _run_dinitctl "rm-dep"     "$1"; }
enable_dinitctl()     { _run_dinitctl "enable"     "$1"; }
disable_dinitctl()    { _run_dinitctl "disable"    "$1"; }
trigger_dinitctl()    { _run_dinitctl "trigger"    "$1"; }
untrigger_dinitctl()  { _run_dinitctl "untrigger"  "$1"; }
setenv_dinitctl()     { _run_dinitctl "setenv"     "$1"; }
unsetenv_dinitctl()   { _run_dinitctl "unsetenv"   "$1"; }
catalog_dinitctl()    { _run_dinitctl "catalog"    "$1"; }
signal_dinitctl()     { _run_dinitctl "signal"     "$1"; }

execute_dinitctl()
{
    local command="$1"
    local service="$2"

    case "$command" in
        "start" | "stop" | "status" | "is-started" | "is-failed" | "restart" | "wake" | "release" | \
        "unpin" | "unload" | "reload" | "list" | "shutdown" | "add-dep" | "rm-dep" | "enable" | "disable" | \
        "trigger" | "untrigger" | "setenv" | "unsetenv" | "catalog" | "signal")
        	;;

        *)
            printf "${RED}[!] Error: Unsupported command: '$command'.${RESET}\n"
            return 1
            ;;
    esac

    local func_name="${command//-/_}_dinitctl"
    "$func_name" "$service"
}
