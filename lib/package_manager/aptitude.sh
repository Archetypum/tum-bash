#!/bin/bash
#
# `lib/package_manager/aptitude.sh`
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

function aptitude()                 { execute aptitude                 "$@"; }
function aptitude_add_user_tag()    { execute aptitude add-user-tag    "$@"; }
function aptitude_clean()           { execute aptitude clean           "$@"; }
function aptitude_forget_new()      { execute aptitude forget-new      "$@"; }
function aptitude_keep()            { execute aptitude keep            "$@"; }
function aptitude_reinstall()       { execute aptitude reinstall       "$@"; }
function aptitude_search()          { execute aptitude search          "$@"; }
function aptitude_update()          { execute aptitude update          "$@"; }
function aptitude_why_not()         { execute aptitude why-not         "$@"; }
function aptitude_autoclean()       { execute aptitude autoclean       "$@"; }
function aptitude_dist_upgrade()    { execute aptitude dist-upgrade    "$@"; }
function aptitude_full_upgrade()    { execute aptitude full-upgrade    "$@"; }
function aptitude_keep_all()        { execute aptitude keep-all        "$@"; }
function aptitude_remove()          { execute aptitude remove          "$@"; }
function aptitude_show()            { execute aptitude show            "$@"; }
function aptitude_upgrade()         { execute aptitude upgrade         "$@"; }
function aptitude_build_dep()       { execute aptitude build-dep       "$@"; }
function aptitude_download()        { execute aptitude download        "$@"; }
function aptitude_hold()            { execute aptitude hold            "$@"; }
function aptitude_markauto()        { execute aptitude markauto        "$@"; }
function aptitude_remove_user_tag() { execute aptitude remove-user-tag "$@"; }
function aptitude_unhold()          { execute aptitude unhold          "$@"; }
function aptitude_versions()        { execute aptitude versions        "$@"; }
function aptitude_changelog()       { execute aptitude changelog       "$@"; }
function aptitude_forbid_version()  { execute aptitude forbid_version  "$@"; }
function aptitude_install()         { execute aptitude install         "$@"; }
function aptitude_purge()           { execute aptitude purge           "$@"; }
function aptitude_safe_upgrade()    { execute aptitude safe-upgrade    "$@"; }
function aptitude_unmarkauto()      { execute aptitude unmarkauto      "$@"; }
function aptitude_why()             { execute aptitude why             "$@"; }

