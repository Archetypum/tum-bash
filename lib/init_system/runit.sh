#!/bin/bash
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
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>

declare -r RED="\033[0;31m"
declare -r GREEN="\033[0;32m"
declare -r RESET="\033[0m"

function _run_sv()
{
    local ACTION="$1"
    local SERVICE="$2"

    if sv "$ACTION" "$SERVICE" >/dev/null 2>&1; then
        echo -e "${GREEN}[*] Success!${RESET}"
        return 0
    else
        echo -e "${RED}[!] Error: sv $ACTION $SERVICE failed.${RESET}"
        return 1
    fi
}

function status_sv()           { _run_sv "status"           "$1"; }
function up_sv()               { _run_sv "up"               "$1"; }
function down_sv()             { _run_sv "down"             "$1"; }
function once_sv()             { _run_sv "once"             "$1"; }
function pause_sv()            { _run_sv "pause"            "$1"; }
function cont_sv()             { _run_sv "cont"             "$1"; }
function hup_sv()              { _run_sv "hup"              "$1"; }
function alarm_sv()            { _run_sv "alarm"            "$1"; }
function interrupt_sv()        { _run_sv "interrupt"        "$1"; }
function quit_sv()             { _run_sv "quit"             "$1"; }
function one_sv()              { _run_sv "1"                "$1"; }
function two_sv()              { _run_sv "2"                "$1"; }
function term_sv()             { _run_sv "term"             "$1"; }
function kill_sv()             { _run_sv "kill"             "$1"; }
function exit_sv()             { _run_sv "exit"             "$1"; }
function start_sv()            { _run_sv "start"            "$1"; }
function stop_sv()             { _run_sv "stop"             "$1"; }
function reload_sv()           { _run_sv "reload"           "$1"; }
function restart_sv()          { _run_sv "restart"          "$1"; }
function shutdown_sv()         { _run_sv "shutdown"         "$1"; }
function force_stop_sv()       { _run_sv "force-stop"       "$1"; }
function force_restart_sv()    { _run_sv "force-restart"    "$1"; }
function force_shutdown_sv()   { _run_sv "force-shutdown"   "$1"; }
function try_restart_sv()      { _run_sv "try-restart"      "$1"; }
function check_sv()            { _run_sv "check"            "$1"; }

function execute_sv()
{
    local COMMAND="$1"
    local SERVICE="$2"

    case "$COMMAND" in
        "status" | "up" | "down" | "once" | "pause" | "cont" | "hup" | "alarm" | "interrupt" | \
        "quit" | "1" | "2" | "term" | "kill" | "exit" | "start" | "stop" | "reload" | "restart" | \
        "shutdown" | "force-stop" | "force-restart" | "force-shutdown" | "try-restart" | "check")
        	;;

        *)
            echo -e "${RED}[!] Error: Unsupported command: $COMMAND${RESET}"
            return 1
            ;;
    esac

    local FUNC_NAME="${COMMAND//-/_}_sv"
    "$FUNC_NAME" "$SERVICE"
}
