#!/bin/bash
#
# `lib/package_manager/apt_get.sh`
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

function apt_get()                 { execute apt-get                 "$@"; }
function apt_get_autoclean()       { execute apt-get autoclean       "$@"; }
function apt_get_build_dep()       { execute apt-get build-dep       "$@"; }
function apt_get_check()           { execute apt-get check           "$@"; }
function apt_get_dist_upgrade()    { execute apt-get dist-upgrade    "$@"; }
function apt_get_dselect_upgrade() { execute apt-get dselect-upgrade "$@"; }
function apt_get_install()         { execute apt-get install         "$@"; }
function apt_get_remove()          { execute apt-get remove          "$@"; }
function apt_get_update()          { execute apt-get update          "$@"; }
function apt_get_autoremove()      { execute apt-get autoremove      "$@"; }
function apt_get_changelog()       { execute apt-get changelog       "$@"; }
function apt_get_clean()           { execute apt-get clean           "$@"; }
function apt_get_download()        { execute apt-get download        "$@"; }
function apt_get_indextargets()    { execute apt-get indextargets    "$@"; }
function apt_get_purge()           { execute apt-get purge           "$@"; }
function apt_get_source()          { execute apt-get source          "$@"; }
function apt_get_upgrade()         { execute apt-get upgrade         "$@"; }
