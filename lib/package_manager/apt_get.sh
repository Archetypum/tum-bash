#!/usr/bin/env bash
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

apt_get()                 { execute apt-get                 "$@"; }
apt_get_autoclean()       { execute apt-get autoclean       "$@"; }
apt_get_build_dep()       { execute apt-get build-dep       "$@"; }
apt_get_check()           { execute apt-get check           "$@"; }
apt_get_dist_upgrade()    { execute apt-get dist-upgrade    "$@"; }
apt_get_dselect_upgrade() { execute apt-get dselect-upgrade "$@"; }
apt_get_install()         { execute apt-get install         "$@"; }
apt_get_remove()          { execute apt-get remove          "$@"; }
apt_get_update()          { execute apt-get update          "$@"; }
apt_get_autoremove()      { execute apt-get autoremove      "$@"; }
apt_get_changelog()       { execute apt-get changelog       "$@"; }
apt_get_clean()           { execute apt-get clean           "$@"; }
apt_get_download()        { execute apt-get download        "$@"; }
apt_get_indextargets()    { execute apt-get indextargets    "$@"; }
apt_get_purge()           { execute apt-get purge           "$@"; }
apt_get_source()          { execute apt-get source          "$@"; }
apt_get_upgrade()         { execute apt-get upgrade         "$@"; }
