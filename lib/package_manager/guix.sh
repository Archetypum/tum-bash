#!/usr/bin/env bash
#
# `lib/package_manager/guix.sh`
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

guix()                  { execute guix              "$@"; }
guix_archive()          { execute guix archive      "$@"; }
guix_build()            { execute guix build        "$@"; }
guix_challenge()        { execute guix challenge    "$@"; }
guix_container()        { execute guix container    "$@"; }
guix_copy()             { execute guix copy         "$@"; }
guix_deploy()           { execute guix deploy       "$@"; }
guix_describe()         { execute guix describe     "$@"; }
guix_download()         { execute guix download     "$@"; }
guix_edit()             { execute guix edit         "$@"; }
guix_environment()      { execute guix environment  "$@"; }
guix_gc()               { execute guix gc           "$@"; }
guix_git()              { execute guix git          "$@"; }
guix_graph()            { execute guix graph        "$@"; }
guix_hash()             { execute guix hash         "$@"; }
guix_help()             { execute guix --help       "$@"; }
guix_home()             { execute guix home         "$@"; }
guix_import()           { execute guix import       "$@"; }
guix_install()          { execute guix install      "$@"; }
guix_lint()             { execute guix lint         "$@"; }
guix_offload()          { execute guix offload      "$@"; }
guix_pack()             { execute guix pack         "$@"; }
guix_package()          { execute guix package      "$@"; }
guix_processes()        { execute guix processes    "$@"; }
guix_publish()          { execute guix publish      "$@"; }
guix_pull()             { execute guix pull         "$@"; }
guix_refresh()          { execute guix refresh      "$@"; }
guix_remove()           { execute guix remove       "$@"; }
guix_repl()             { execute guix repl         "$@"; }
guix_search()           { execute guix search       "$@"; }
guix_shell()            { execute guix shell        "$@"; }
guix_show()             { execute guix show         "$@"; }
guix_size()             { execute guix size         "$@"; }
guix_style()            { execute guix style        "$@"; }
guix_system()           { execute guix system       "$@"; }
guix_time_machine()     { execute guix time-machine "$@"; }
guix_upgrade()          { execute guix upgrade      "$@"; }
guix_weather()          { execute guix weather      "$@"; }

