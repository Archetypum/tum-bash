#!/usr/bin/env bash
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

apt_cache()           { execute apt-cache           "$@"; }
apt_cache_add()       { execute apt-cache add       "$@"; }
apt_cache_depends()   { execute apt-cache depends   "$@"; }
apt_cache_dotty()     { execute apt-cache dotty     "$@"; }
apt_cache_dump()      { execute apt-cache dump      "$@"; }
apt_cache_dumpavail() { execute apt-cache dumpavail "$@"; }
apt_cache_gencaches() { execute apt-cache gencaches "$@"; }
apt_cache_madison()   { execute apt-cache madison   "$@"; }
apt_cache_pkgnames()  { execute apt-cache pkgnames  "$@"; }
apt_cache_policy()    { execute apt-cache policy    "$@"; }
apt_cache_rdepends()  { execute apt-cache rdepends  "$@"; }
apt_cache_search()    { execute apt-cache search    "$@"; }
apt_cache_show()      { execute apt-cache show      "$@"; }
apt_cache_showpkg()   { execute apt-cache showpkg   "$@"; }
apt_cache_showsrc()   { execute apt-cache showsrc   "$@"; }
apt_cache_stats()     { execute apt-cache stats     "$@"; }
apt_cache_unmet()     { execute apt-cache unmet     "$@"; }
apt_cache_xvcg()      { execute apt-cache xvcg      "$@"; }
