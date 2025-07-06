#!/bin/bash
#
# `lib/package_manager/apt_cache.sh`
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

function apt_cache()           { execute apt-cache           "$@"; }
function apt_cache_add()       { execute apt-cache add       "$@"; }
function apt_cache_depends()   { execute apt-cache depends   "$@"; }
function apt_cache_dotty()     { execute apt-cache dotty     "$@"; }
function apt_cache_dump()      { execute apt-cache dump      "$@"; }
function apt_cache_dumpavail() { execute apt-cache dumpavail "$@"; }
function apt_cache_gencaches() { execute apt-cache gencaches "$@"; }
function apt_cache_madison()   { execute apt-cache madison   "$@"; }
function apt_cache_pkgnames()  { execute apt-cache pkgnames  "$@"; }
function apt_cache_policy()    { execute apt-cache policy    "$@"; }
function apt_cache_rdepends()  { execute apt-cache rdepends  "$@"; }
function apt_cache_search()    { execute apt-cache search    "$@"; }
function apt_cache_show()      { execute apt-cache show      "$@"; }
function apt_cache_showpkg()   { execute apt-cache showpkg   "$@"; }
function apt_cache_showsrc()   { execute apt-cache showsrc   "$@"; }
function apt_cache_stats()     { execute apt-cache stats     "$@"; }
function apt_cache_unmet()     { execute apt-cache unmet     "$@"; }
function apt_cache_xvcg()      { execute apt-cache xvcg      "$@"; }

