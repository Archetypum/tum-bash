#!/bin/bash
#
# `lib/init_system/s6.sh`
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

function _run_s6_rc()
{
    local ACTION="$1"
    local SERVICE="$2"

    if s6-rc "$ACTION" "$SERVICE" >/dev/null 2>&1; then
        echo -e "${GREEN}[*] Success!${RESET}"
        return 0
    else
        echo -e "${RED}[!] Error: s6-rc $ACTION $SERVICE failed.${RESET}"
        return 1
    fi
}

function help_s6_rc()     { _run_s6_rc "help"     "$1"; }
function list_s6_rc()     { _run_s6_rc "list"     "$1"; }
function listall_s6_rc()  { _run_s6_rc "listall"  "$1"; }
function diff_s6_rc()     { _run_s6_rc "diff"     "$1"; }
function start_s6_rc()    { _run_s6_rc "start"    "$1"; }
function stop_s6_rc()     { _run_s6_rc "stop"     "$1"; }
function change_s6_rc()   { _run_s6_rc "change"   "$1"; }

function execute_s6_rc()
{
    local COMMAND="$1"
    local SERVICE="$2"
    local FUNC_NAME="${COMMAND//-/_}_s6_rc"

    if declare -f "$FUNC_NAME" >/dev/null 2>&1; then
        $FUNC_NAME "$SERVICE"
        return $?
    else
        echo -e "${RED}[!] Error: Unknown command: $COMMAND${RESET}"
        return 1
    fi
}

