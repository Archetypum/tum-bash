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
