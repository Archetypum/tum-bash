#!/usr/bin/env bash
#
# `lib/package_manager/pkgin.sh`
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

pkgin()                         { execute pkgin                     "$@"; }
pkgin_list()                    { execute pkgin list                "$@"; }
pkgin_avail()                   { execute pkgin avail               "$@"; }
pkgin_search()                  { execute pkgin search              "$@"; }
pkgin_install()                 { execute pkgin install             "$@"; }
pkgin_update()                  { execute pkgin update              "$@"; }
pkgin_upgrade()                 { execute pkgin upgrade             "$@"; }
pkgin_full_upgrade()            { execute pkgin full-upgrade        "$@"; }
pkgin_remove()                  { execute pkgin remove              "$@"; }
pkgin_keep()                    { execute pkgin keep                "$@"; }
pkgin_unkeep()                  { execute pkgin unkeep              "$@"; }
pkgin_export()                  { execute pkgin export              "$@"; }
pkgin_import()                  { execute pkgin import              "$@"; }
pkgin_show_keep()               { execute pkgin show-keep           "$@"; }
pkgin_show_no_keep()            { execute pkgin show-no-keep        "$@"; }
pkgin_autoremove()              { execute pkgin autoremove          "$@"; }
pkgin_clean()                   { execute pkgin clean               "$@"; }
pkgin_show_deps()               { execute pkgin show-deps           "$@"; }
pkgin_show_full_deps()          { execute pkgin show-full-deps      "$@"; }
pkgin_show_rev_deps()           { execute pkgin show-rev-deps       "$@"; }
pkgin_provides()                { execute pkgin provides            "$@"; }
pkgin_requires()                { execute pkgin requires            "$@"; }
pkgin_show_category()           { execute pkgin show-category       "$@"; }
pkgin_show_pkg_category()       { execute pkgin show-pkg-category   "$@"; }
pkgin_show_all_categories()     { execute pkgin show-all-categories "$@"; }
pkgin_pkg_content()             { execute pkgin pkg-content         "$@"; }
pkgin_pkg_descr()               { execute pkgin pkg-descr           "$@"; }
pkgin_pkg_build_defs()          { execute pkgin pkg-build-defs      "$@"; }
pkgin_stats()                   { execute pkgin stats               "$@"; }
