#!/bin/bash
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
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>

declare -r RED="\033[0;31m"
declare -r GREEN="\033[0;32m"
declare -r RESET="\033[0m"

function _run_dinitctl()
{
    local ACTION="$1"
    local SERVICE="$2"

    if dinitctl "$ACTION" "$SERVICE" >/dev/null 2>&1; then
        echo -e "${GREEN}[*] Success!${RESET}"
        return 0
    else
        echo -e "${RED}[!] Error: dinitctl $ACTION $SERVICE failed.${RESET}"
        return 1
    fi
}

function start_dinitctl()      { _run_dinitctl "start"      "$1"; }
function stop_dinitctl()       { _run_dinitctl "stop"       "$1"; }
function status_dinitctl()     { _run_dinitctl "status"     "$1"; }
function is_started_dinitctl() { _run_dinitctl "is-started" "$1"; }
function is_failed_dinitctl()  { _run_dinitctl "is-failed"  "$1"; }
function restart_dinitctl()    { _run_dinitctl "restart"    "$1"; }
function wake_dinitctl()       { _run_dinitctl "wake"       "$1"; }
function release_dinitctl()    { _run_dinitctl "release"    "$1"; }
function unpin_dinitctl()      { _run_dinitctl "unpin"      "$1"; }
function unload_dinitctl()     { _run_dinitctl "unload"     "$1"; }
function reload_dinitctl()     { _run_dinitctl "reload"     "$1"; }
function list_dinitctl()       { _run_dinitctl "list"       "$1"; }
function shutdown_dinitctl()   { _run_dinitctl "shutdown"   "$1"; }
function add_dep_dinitctl()    { _run_dinitctl "add-dep"    "$1"; }
function rm_dep_dinitctl()     { _run_dinitctl "rm-dep"     "$1"; }
function enable_dinitctl()     { _run_dinitctl "enable"     "$1"; }
function disable_dinitctl()    { _run_dinitctl "disable"    "$1"; }
function trigger_dinitctl()    { _run_dinitctl "trigger"    "$1"; }
function untrigger_dinitctl()  { _run_dinitctl "untrigger"  "$1"; }
function setenv_dinitctl()     { _run_dinitctl "setenv"     "$1"; }
function unsetenv_dinitctl()   { _run_dinitctl "unsetenv"   "$1"; }
function catalog_dinitctl()    { _run_dinitctl "catalog"    "$1"; }
function signal_dinitctl()     { _run_dinitctl "signal"     "$1"; }

function execute_dinitctl()
{
    local COMMAND="$1"
    local SERVICE="$2"
    local FUNC_NAME="${COMMAND//-/_}_dinitctl"

    if declare -f "$FUNC_NAME" >/dev/null 2>&1; then
        $FUNC_NAME "$SERVICE"
        return $?
    else
        echo -e "${RED}[!] Error: Unknown command: $COMMAND${RESET}"
        return 1
    fi
}

