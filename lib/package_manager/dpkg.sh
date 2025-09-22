#!/usr/bin/env bash
#
# `lib/package_manager/dpkg.sh`
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

dpkg()                             { execute dpkg                               "$@"; }
dpkg_abort_after()                 { execute dpkg --abort-after                 "$@"; }
dpkg_add_architecture()            { execute dpkg --add-architecture            "$@"; }
dpkg_audit()                       { execute dpkg --audit                       "$@"; }
dpkg_auto_deconfigure()            { execute dpkg --auto-deconfigure            "$@"; }
dpkg_clear_avail()                 { execute dpkg --clear-avail                 "$@"; }
dpkg_clear_selection()             { execute dpkg --clear-selections            "$@"; }
dpkg_compare_versions()            { execute dpkg --compare-versions            "$@"; }
dpkg_configure()                   { execute dpkg --configure                   "$@"; }
dpkg_field()                       { execute dpkg --field                       "$@"; }
dpkg_forget_old_unavail()          { execute dpkg --forget-old-unavail          "$@"; }
dpkg_get_selections()              { execute dpkg --get-selections              "$@"; }
dpkg_help()                        { execute dpkg --help                        "$@"; }
dpkg_install()                     { execute dpkg --install                     "$@"; }
dpkg_list()                        { execute dpkg --list                        "$@"; }
dpkg_listfiles()                   { execute dpkg --listfiles                   "$@"; }
dpkg_merge_avail()                 { execute dpkg --merge-avail                 "$@"; }
dpkg_predep_package()              { execute dpkg --predep-package              "$@"; }
dpkg_print_architecture()          { execute dpkg --print-architecture          "$@"; }
dpkg_print_avail()                 { execute dpkg --print-avail                 "$@"; }
dpkg_print_foreign_architectures() { execute dpkg --print-foreign-architectures "$@"; }
dpkg_purge()                       { execute dpkg --purge                       "$@"; }
dpkg_record_avail()                { execute dpkg --record-avail                "$@"; }
dpkg_remove()                      { execute dpkg --remove                      "$@"; }
dpkg_remove_architecture()         { execute dpkg --remove-architecture         "$@"; }
dpkg_search()                      { execute dpkg --search                      "$@"; }
dpkg_set_selections()              { execute dpkg --set-selections              "$@"; }
dpkg_status()                      { execute dpkg --status                      "$@"; }
dpkg_unpack()                      { execute dpkg --unpack                      "$@"; }
dpkg_update_avail()                { execute dpkg --update-avail                "$@"; }
dpkg_verify()                      { execute dpkg --verify                      "$@"; }
dpkg_version()                     { execute dpkg --version                     "$@"; }

