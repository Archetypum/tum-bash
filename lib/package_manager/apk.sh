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
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>

declare -r RED="\033[0;31m"
declare -r GREEN="\033[0;32m"
declare -r RESET="\033[0m"

function execute()
{
    local CMD=("$@")
    echo -e "${GREEN}[<==] Executing '${CMD[*]}'...${RESET}"
    if "${CMD[@]}"; then
        echo -e "${GREEN}[*] Success!${RESET}"
        return 0
    else
        echo -e "${RED}[!] Error: Failed to execute: '${CMD[*]}'.${RESET}"
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

