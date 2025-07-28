#!/bin/bash
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

function apk()            { execute apk             "$@"; }
function apk_help()       { execute apk --help      "$@"; }
function apk_add()        { execute apk add         "$@"; }
function apk_del()        { execute apk del         "$@"; }
function apk_fix()        { execute apk fix         "$@"; }
function apk_update()     { execute apk update      "$@"; }
function apk_upgrade()    { execute apk upgrade     "$@"; }
function apk_cache()      { execute apk cache       "$@"; }
function apk_info()       { execute apk info        "$@"; }
function apk_list()       { execute apk list        "$@"; }
function apk_dot()        { execute apk dot         "$@"; }
function apk_policy()     { execute apk policy      "$@"; }
function apk_search()     { execute apk search      "$@"; }
function apk_index()      { execute apk index       "$@"; }
function apk_fetch()      { execute apk fetch       "$@"; }
function apk_manifest()   { execute apk manifest    "$@"; }
function apk_verify()     { execute apk verify      "$@"; }
function apk_audit()      { execute apk audit       "$@"; }
function apk_stats()      { execute apk stats       "$@"; }
function apk_version()    { execute apk version     "$@"; }

