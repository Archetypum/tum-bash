#!/bin/bash
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

declare -r RED="\033[0;31m"
declare -r GREEN="\033[0;32m"
declare -r RESET="\033[0m"

readonly SAFE_ARG_PATTERN="^[a-zA-Z0-9@._/:+=-]+$"

function is_safe_argument()
{
    local ARG="$1"

    if [[ "$ARG" =~ $SAFE_ARG_PATTERN ]]; then
        return 0
    else
        return 1
    fi
}

function validate_command()
{
    local ARG

    if (( $# == 0 )); then
        echo -e "${RED}[!] Error: Empty command${RESET}" >&2
        return 1
    fi

    for ARG in "$@"; do
        if ! is_safe_argument "$ARG"; then
            echo -e "${RED}[!] Error: Unsafe or invalid argument detected: '$ARG'${RESET}" >&2
            return 1
        fi
    done

    return 0
}

function execute()
{
    local CMD=("$@")

    if ! validate_command "${CMD[@]}"; then
        return 1
    fi

    echo -e "${GREEN}[<==] Executing '${CMD[*]}'...${RESET}"

    if command "${CMD[@]}"; then
        echo -e "${GREEN}[*] Success!${RESET}"
        return 0
    else
        echo -e "${RED}[!] Error: Failed to execute: '${CMD[*]}'.${RESET}" >&2
        return 1
    fi
}

function dpkg()                             { execute dpkg                               "$@"; }
function dpkg_abort_after()                 { execute dpkg --abort-after                 "$@"; }
function dpkg_add_architecture()            { execute dpkg --add-architecture            "$@"; }
function dpkg_audit()                       { execute dpkg --audit                       "$@"; }
function dpkg_auto_deconfigure()            { execute dpkg --auto-deconfigure            "$@"; }
function dpkg_clear_avail()                 { execute dpkg --clear-avail                 "$@"; }
function dpkg_clear_selection()             { execute dpkg --clear-selections            "$@"; }
function dpkg_compare_versions()            { execute dpkg --compare-versions            "$@"; }
function dpkg_configure()                   { execute dpkg --configure                   "$@"; }
function dpkg_field()                       { execute dpkg --field                       "$@"; }
function dpkg_forget_old_unavail()          { execute dpkg --forget-old-unavail          "$@"; }
function dpkg_get_selections()              { execute dpkg --get-selections              "$@"; }
function dpkg_help()                        { execute dpkg --help                        "$@"; }
function dpkg_install()                     { execute dpkg --install                     "$@"; }
function dpkg_list()                        { execute dpkg --list                        "$@"; }
function dpkg_listfiles()                   { execute dpkg --listfiles                   "$@"; }
function dpkg_merge_avail()                 { execute dpkg --merge-avail                 "$@"; }
function dpkg_predep_package()              { execute dpkg --predep-package              "$@"; }
function dpkg_print_architecture()          { execute dpkg --print-architecture          "$@"; }
function dpkg_print_avail()                 { execute dpkg --print-avail                 "$@"; }
function dpkg_print_foreign_architectures() { execute dpkg --print-foreign-architectures "$@"; }
function dpkg_purge()                       { execute dpkg --purge                       "$@"; }
function dpkg_record_avail()                { execute dpkg --record-avail                "$@"; }
function dpkg_remove()                      { execute dpkg --remove                      "$@"; }
function dpkg_remove_architecture()         { execute dpkg --remove-architecture         "$@"; }
function dpkg_search()                      { execute dpkg --search                      "$@"; }
function dpkg_set_selections()              { execute dpkg --set-selections              "$@"; }
function dpkg_status()                      { execute dpkg --status                      "$@"; }
function dpkg_unpack()                      { execute dpkg --unpack                      "$@"; }
function dpkg_update_avail()                { execute dpkg --update-avail                "$@"; }
function dpkg_verify()                      { execute dpkg --verify                      "$@"; }
function dpkg_version()                     { execute dpkg --version                     "$@"; }

