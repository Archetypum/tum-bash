#!/usr/bin/env bash
#
# `lib/package_manager/xbps_query.sh`
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

readonly SAFE_ARG_PATTERN="^[a-zA-Z0-9@._/:+=-]+$"

is_safe_argument()
{
    arg="$1"

    [[ "$arg" =~ $SAFE_ARG_PATTERN ]] && return 0 || return 1
}

validate_command()
{
    arg=

    (( $# == 0 )) && { printf "${RED}[!] Error: Empty command.${RESET}\n" >&2; return 1; }

    for arg in "$@"; do
        ! is_safe_argument "$arg" &&
            { printf "${RED}[!] Error: Unsafe or invalid argument detected: '$arg'${RESET}" >&2; return 1; }
    done

    return 0
}

execute()
{
    cmd=("$@")

    ! validate_command "${cmd[@]}" && return 1

    printf "${GREEN}[<==] Executing '${cmd[*]}'...${RESET}\n"
    command "${cmd[@]}" && 
        { printf "${GREEN}[*] Success!${RESET}\n"; return 0; } ||
        { printf "${RED}[!] Error: Failed to execute: '${cmd[*]}'.${RESET}\n" >&2 return 1; }
}

xbps_query()                  { execute xbps-query                    "$@"; }
xbps_query_list_pkgs()        { execute xbps-query --list-pkgs        "$@"; }
xbps_query_list_hold_pkgs()   { execute xbps-query --list-hold-pkgs   "$@"; }
xbps_query_list_repos()       { execute xbps-query --list-repos       "$@"; }
xbps_query_list_manual_pkgs() { execute xbps-query --list-manual-pkgs "$@"; }
xbps_query_list_orphans()     { execute xbps-query --list-orphans     "$@"; }
xbps_query_ownedby()          { execute xbps-query --ownedby          "$@"; }
xbps_query_show()             { execute xbps-query --show             "$@"; }
xbps_query_search()           { execute xbps-query --search           "$@"; }
xbps_query_files()            { execute xbps-query --files            "$@"; }
xbps_query_deps()             { execute xbps-query --deps             "$@"; }
xbps_query_revdeps()          { execute xbps-query --revdeps          "$@"; }
xbps_query_cat()              { execute xbps-query cat                "$@"; }

