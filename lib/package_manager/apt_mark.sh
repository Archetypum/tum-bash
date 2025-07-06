#!/bin/bash
#
# `lib/package_manager/apt_mark.sh`
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

function apt_mark()                 { execute apt-mark                 "$@"; }
function apt_mark_auto()            { execute apt-mark auto            "$@"; }
function apt_mark_manual()          { execute apt-mark manual          "$@"; }
function apt_mark_minimize_manual() { execute apt-mark minimize-manual "$@"; }
function apt_mark_showauto()        { execute apt-mark showauto        "$@"; }
function apt_mark_showmanual()      { execute apt-mark showmanual      "$@"; }
function apt_mark_hold()            { execute apt-mark hold            "$@"; }
function apt_mark_unhold()          { execute apt-mark unhold          "$@"; }
function apt_mark_showhold()        { execute apt-mark showhold        "$@"; }

