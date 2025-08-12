#!/usr/bin/env bash
#
# `lib/init_system/runit.sh`
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

_run_sv()
{
    local action="$1"
    local service="$2"

    sv "$action" "$service" >/dev/null 2>&1 &&
        { printf "${GREEN}[*] Success!${RESET}\n"; return 0; } ||
        { printf "${RED}[!] Error: 'sv $action $service' failed.${RESET}\n"; return 1; }
}

status_sv()           { _run_sv "status"           "$1"; }
up_sv()               { _run_sv "up"               "$1"; }
down_sv()             { _run_sv "down"             "$1"; }
once_sv()             { _run_sv "once"             "$1"; }
pause_sv()            { _run_sv "pause"            "$1"; }
cont_sv()             { _run_sv "cont"             "$1"; }
hup_sv()              { _run_sv "hup"              "$1"; }
alarm_sv()            { _run_sv "alarm"            "$1"; }
interrupt_sv()        { _run_sv "interrupt"        "$1"; }
quit_sv()             { _run_sv "quit"             "$1"; }
one_sv()              { _run_sv "1"                "$1"; }
two_sv()              { _run_sv "2"                "$1"; }
term_sv()             { _run_sv "term"             "$1"; }
kill_sv()             { _run_sv "kill"             "$1"; }
exit_sv()             { _run_sv "exit"             "$1"; }
start_sv()            { _run_sv "start"            "$1"; }
stop_sv()             { _run_sv "stop"             "$1"; }
reload_sv()           { _run_sv "reload"           "$1"; }
restart_sv()          { _run_sv "restart"          "$1"; }
shutdown_sv()         { _run_sv "shutdown"         "$1"; }
force_stop_sv()       { _run_sv "force-stop"       "$1"; }
force_restart_sv()    { _run_sv "force-restart"    "$1"; }
force_shutdown_sv()   { _run_sv "force-shutdown"   "$1"; }
try_restart_sv()      { _run_sv "try-restart"      "$1"; }
check_sv()            { _run_sv "check"            "$1"; }

execute_sv()
{
    local command="$1"
    local service="$2"

    case "$command" in
        "status" | "up" | "down" | "once" | "pause" | "cont" | "hup" | "alarm" | "interrupt" | \
        "quit" | "1" | "2" | "term" | "kill" | "exit" | "start" | "stop" | "reload" | "restart" | \
        "shutdown" | "force-stop" | "force-restart" | "force-shutdown" | "try-restart" | "check")
        	;;

        *)
            printf "${RED}[!] Error: Unsupported command: '$command'.${RESET}\n"
            return 1
            ;;
    esac

    local func_name="${command//-/_}_sv"
    "$func_name" "$service"
}
