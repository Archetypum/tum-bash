#!/usr/bin/env bash
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

_run_service()
{
    local action="$1"
    local service="$2"

    service "$service" "$action" >/dev/null 2>&1 &&
        { printf "${GREEN}[*] Success!${RESET}\n"; return 0; } ||
        { printf "${RED}[!] Error: 'service $service $action' failed.${RESET}\n"; return 1; }
}

start_service()        { _run_service "start"        "$1"; }
stop_service()         { _run_service "stop"         "$1"; }
force_reload_service() { _run_service "force-reload" "$1"; }
restart_service()      { _run_service "restart"      "$1"; }
status_service()       { _run_service "status"       "$1"; }

execute_service()
{
    local command="$1"
    local service="$2"

    case "$command" in
        "start" | "stop" | "restart" | "force-reload" | "status")
        	;;

        *)
            printf "${RED}[!] Error: Unsupported command: '$command'.${RESET}\n"
            return 1
            ;;
    esac

    local func_name="${command//-/_}_service"
    "$func_name" "$service"
}
