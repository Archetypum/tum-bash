#!/usr/bin/env bash
#
# `lib/package_manager/apt.sh`
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

apt()                 { execute apt              "$@"; }
apt_autoclean()       { execute apt autoclean    "$@"; }
apt_autoremove()      { execute apt autoremove   "$@"; }
apt_changelog()       { execute apt changelog    "$@"; }
apt_depends()         { execute apt depends      "$@"; }
apt_download()        { execute apt download     "$@"; }
apt_full_upgrade()    { execute apt full-upgrade "$@"; }
apt_install()         { execute apt install      "$@"; }
apt_moo()             { execute apt moo          "$@"; }
apt_purge()           { execute apt purge        "$@"; }
apt_reinstall()       { execute apt reinstall    "$@"; }
apt_search()          { execute apt search       "$@"; }
apt_showsrc()         { execute apt showsrc      "$@"; }
apt_update()          { execute apt update       "$@"; }
apt_autopurge()       { execute apt autopurge    "$@"; }
apt_build_dep()       { execute apt build-dep    "$@"; }
apt_clean()           { execute apt clean        "$@"; }
apt_dist_upgrade()    { execute apt dist-upgrade "$@"; }
apt_edit_sources()    { execute apt edit-sources "$@"; }
apt_help()            { execute apt help         "$@"; }
apt_list()            { execute apt list         "$@"; }
apt_policy()          { execute apt policy       "$@"; }
apt_rdepends()        { execute apt rdepends     "$@"; }
apt_remove()          { execute apt remove       "$@"; }
apt_show()            { execute apt show         "$@"; } 
apt_source()          { execute apt source       "$@"; }
apt_upgrade()         { execute apt upgrade      "$@"; }

