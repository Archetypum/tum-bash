#!/usr/bin/env bash
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

aptitude()                 { execute aptitude                 "$@"; }
aptitude_add_user_tag()    { execute aptitude add-user-tag    "$@"; }
aptitude_clean()           { execute aptitude clean           "$@"; }
aptitude_forget_new()      { execute aptitude forget-new      "$@"; }
aptitude_keep()            { execute aptitude keep            "$@"; }
aptitude_reinstall()       { execute aptitude reinstall       "$@"; }
aptitude_search()          { execute aptitude search          "$@"; }
aptitude_update()          { execute aptitude update          "$@"; }
aptitude_why_not()         { execute aptitude why-not         "$@"; }
aptitude_autoclean()       { execute aptitude autoclean       "$@"; }
aptitude_dist_upgrade()    { execute aptitude dist-upgrade    "$@"; }
aptitude_full_upgrade()    { execute aptitude full-upgrade    "$@"; }
aptitude_keep_all()        { execute aptitude keep-all        "$@"; }
aptitude_remove()          { execute aptitude remove          "$@"; }
aptitude_show()            { execute aptitude show            "$@"; }
aptitude_upgrade()         { execute aptitude upgrade         "$@"; }
aptitude_build_dep()       { execute aptitude build-dep       "$@"; }
aptitude_download()        { execute aptitude download        "$@"; }
aptitude_hold()            { execute aptitude hold            "$@"; }
aptitude_markauto()        { execute aptitude markauto        "$@"; }
aptitude_remove_user_tag() { execute aptitude remove-user-tag "$@"; }
aptitude_unhold()          { execute aptitude unhold          "$@"; }
aptitude_versions()        { execute aptitude versions        "$@"; }
aptitude_changelog()       { execute aptitude changelog       "$@"; }
aptitude_forbid_version()  { execute aptitude forbid_version  "$@"; }
aptitude_install()         { execute aptitude install         "$@"; }
aptitude_purge()           { execute aptitude purge           "$@"; }
aptitude_safe_upgrade()    { execute aptitude safe-upgrade    "$@"; }
aptitude_unmarkauto()      { execute aptitude unmarkauto      "$@"; }
aptitude_why()             { execute aptitude why             "$@"; }

