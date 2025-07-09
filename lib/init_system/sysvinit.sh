#!/bin/bash
#
# `lib/init_system/sysvinit.sh`
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

function _run_service()
{
    local ACTION="$1"
    local SERVICE="$2"

    if service "$SERVICE" "$ACTION" >/dev/null 2>&1; then
        echo -e "${GREEN}[*] Success!${RESET}"
        return 0
    else
        echo -e "${RED}[!] Error: service $SERVICE $ACTION failed.${RESET}"
        return 1
    fi
}

function start_service()        { _run_service "start"        "$1"; }
function stop_service()         { _run_service "stop"         "$1"; }
function force_reload_service() { _run_service "force-reload" "$1"; }
function restart_service()      { _run_service "restart"      "$1"; }
function status_service()       { _run_service "status"       "$1"; }

function execute_service()
{
    local COMMAND="$1"
    local SERVICE="$2"

    case "$COMMAND" in
        "start" | "stop" | "restart" | "force-reload" | "status")
        	;;

        *)
            echo -e "${RED}[!] Error: Unsupported command: $COMMAND${RESET}"
            return 1
            ;;
    esac

    local FUNC_NAME="${COMMAND//-/_}_service"
    "$FUNC_NAME" "$SERVICE"
}
