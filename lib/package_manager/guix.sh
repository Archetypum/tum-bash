#!/bin/bash
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

declare -r RED="\033[0;31m"
declare -r GREEN="\033[0;32m"
declare -r RESET="\033[0m"

readonly SAFE_ARG_PATTERN="^[a-zA-Z0-9@._/:+=-]+$"

function is_safe_argument()
{
    local ARG="$1"

    if [[ "$ARG" =~ $SAFE_ARG_PATTERN ]]; then
        return 0
    else
        return 1
    fi
}

function validate_command()
{
    local ARG

    if (( $# == 0 )); then
        echo -e "${RED}[!] Error: Empty command${RESET}" >&2
        return 1
    fi

    for ARG in "$@"; do
        if ! is_safe_argument "$ARG"; then
            echo -e "${RED}[!] Error: Unsafe or invalid argument detected: '$ARG'${RESET}" >&2
            return 1
        fi
    done

    return 0
}

function execute()
{
    local CMD=("$@")

    if ! validate_command "${CMD[@]}"; then
        return 1
    fi

    echo -e "${GREEN}[<==] Executing '${CMD[*]}'...${RESET}"

    if command "${CMD[@]}"; then
        echo -e "${GREEN}[*] Success!${RESET}"
        return 0
    else
        echo -e "${RED}[!] Error: Failed to execute: '${CMD[*]}'.${RESET}" >&2
        return 1
    fi
}

function guix()                  { execute guix              "$@"; }
function guix_archive()          { execute guix archive      "$@"; }
function guix_build()            { execute guix build        "$@"; }
function guix_challenge()        { execute guix challenge    "$@"; }
function guix_container()        { execute guix container    "$@"; }
function guix_copy()             { execute guix copy         "$@"; }
function guix_deploy()           { execute guix deploy       "$@"; }
function guix_describe()         { execute guix describe     "$@"; }
function guix_download()         { execute guix download     "$@"; }
function guix_edit()             { execute guix edit         "$@"; }
function guix_environment()      { execute guix environment  "$@"; }
function guix_gc()               { execute guix gc           "$@"; }
function guix_git()              { execute guix git          "$@"; }
function guix_graph()            { execute guix graph        "$@"; }
function guix_hash()             { execute guix hash         "$@"; }
function guix_help()             { execute guix --help       "$@"; }
function guix_home()             { execute guix home         "$@"; }
function guix_import()           { execute guix import       "$@"; }
function guix_install()          { execute guix install      "$@"; }
function guix_lint()             { execute guix lint         "$@"; }
function guix_offload()          { execute guix offload      "$@"; }
function guix_pack()             { execute guix pack         "$@"; }
function guix_package()          { execute guix package      "$@"; }
function guix_processes()        { execute guix processes    "$@"; }
function guix_publish()          { execute guix publish      "$@"; }
function guix_pull()             { execute guix pull         "$@"; }
function guix_refresh()          { execute guix refresh      "$@"; }
function guix_remove()           { execute guix remove       "$@"; }
function guix_repl()             { execute guix repl         "$@"; }
function guix_search()           { execute guix search       "$@"; }
function guix_shell()            { execute guix shell        "$@"; }
function guix_show()             { execute guix show         "$@"; }
function guix_size()             { execute guix size         "$@"; }
function guix_style()            { execute guix style        "$@"; }
function guix_system()           { execute guix system       "$@"; }
function guix_time_machine()     { execute guix time-machine "$@"; }
function guix_upgrade()          { execute guix upgrade      "$@"; }
function guix_weather()          { execute guix weather      "$@"; }

