#!/usr/bin/env bash
#
# `lib/package_manager/pamac.sh`
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

function pamac()              { execute pamac                  "$@"; }
function pamac_version()      { execute pamac --version        "$@"; }
function pamac_help()         { execute pamac --help           "$@"; }
function pamac_search()       { execute pamac search           "$@"; }
function pamac_list()         { execute pamac list             "$@"; }
function pamac_info()         { execute pamac info             "$@"; }
function pamac_install()      { execute pamac install          "$@"; }
function pamac_reinstall()    { execute pamac reinstall        "$@"; }
function pamac_remove()       { execute pamac remove           "$@"; }
function pamac_checkupdates() { execute pamac checkupdates     "$@"; }
function pamac_upgrade()      { execute pamac upgrade          "$@"; }
function pamac_update()       { execute pamac update           "$@"; }
function pamac_clone()        { execute pamac clone            "$@"; }
function pamac_build()        { execute pamac build            "$@"; }
function pamac_clean()        { execute pamac clean            "$@"; }

