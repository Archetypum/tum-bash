#!/usr/bin/env bash
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

_run_s6_rc()
{
    local action="$1"
    local service="$2"

    s6-rc "$action" "$service" >/dev/null 2>&1 &&
        { printf "${GREEN}[*] Success!${RESET}\n"; return 0; } ||
        { printf "${RED}[!] Error: 's6-rc $action $service' failed.${RESET}\n"; return 1; }
}

help_s6_rc()     { _run_s6_rc "help"     "$1"; }
list_s6_rc()     { _run_s6_rc "list"     "$1"; }
listall_s6_rc()  { _run_s6_rc "listall"  "$1"; }
diff_s6_rc()     { _run_s6_rc "diff"     "$1"; }
start_s6_rc()    { _run_s6_rc "start"    "$1"; }
stop_s6_rc()     { _run_s6_rc "stop"     "$1"; }
change_s6_rc()   { _run_s6_rc "change"   "$1"; }

execute_s6_rc()
{
    local command="$1"
    local service="$2"

    case "$command" in
    	"help" | "list" | "listall" | "diff" | "start" | "stop" | "change")
    		;;

        *)
            printf "${RED}[!] Error: Unsupported command: '$command'.${RESET}\n"
            return 1
            ;;
    esac

    local func_name="${command//-/_}_s6_rc"
    "$func_name" "$service"
}
