#!/usr/bin/env bash
#
# `lib/init_system/openrc.sh`
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
LC_ALL="C"
LANG="C"

readonly RED="\033[0;31m"
readonly GREEN="\033[0;32m"
readonly RESET="\033[0m"

_run_rc_service()
{
    action="$1"
    service="$2"

    rc-service "$service" "$action" >/dev/null 2>&1 &&
        { printf "${GREEN}[*] Success!${RESET}\n"; return 0; } ||
        { printf "${RED}[!] Error: 'rc-service $service $action' failed.${RESET}\n"; return 1; }
}

start_rc_service()        { _run_rc_service "start"        "$1"; }
stop_rc_service()         { _run_rc_service "stop"         "$1"; }
reload_rc_service()       { _run_rc_service "reload"       "$1"; }
force_reload_rc_service() { _run_rc_service "force-reload" "$1"; }
restart_rc_service()      { _run_rc_service "restart"      "$1"; }
try_restart_rc_service()  { _run_rc_service "try-restart"  "$1"; }
status_rc_service()       { _run_rc_service "status"       "$1"; }

execute_rc_service()
{
    command="$1"
    service="$2"

    case "$command" in
        "start" | "stop" | "restart" | "reload" | "force-reload" | "try-restart" | "status")
        	;;

        *)
            printf "${RED}[!] Error: Unsupported command: '$command'.${RESET}\n"
            return 1
            ;;
    esac

    func_name="${command//-/_}_rc_service"
    "$func_name" "$service"
}
