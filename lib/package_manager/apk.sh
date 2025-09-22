#!/usr/bin/env bash
#
# `lib/package_manager/apk.sh`
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

##
## `apk`:
##
apk()            { execute apk             "$@"; }
apk_help()       { execute apk --help      "$@"; }
apk_add()        { execute apk add         "$@"; }
apk_del()        { execute apk del         "$@"; }
apk_fix()        { execute apk fix         "$@"; }
apk_update()     { execute apk update      "$@"; }
apk_upgrade()    { execute apk upgrade     "$@"; }
apk_cache()      { execute apk cache       "$@"; }
apk_info()       { execute apk info        "$@"; }
apk_list()       { execute apk list        "$@"; }
apk_dot()        { execute apk dot         "$@"; }
apk_policy()     { execute apk policy      "$@"; }
apk_search()     { execute apk search      "$@"; }
apk_index()      { execute apk index       "$@"; }
apk_fetch()      { execute apk fetch       "$@"; }
apk_manifest()   { execute apk manifest    "$@"; }
apk_verify()     { execute apk verify      "$@"; }
apk_audit()      { execute apk audit       "$@"; }
apk_stats()      { execute apk stats       "$@"; }
apk_version()    { execute apk version     "$@"; }
