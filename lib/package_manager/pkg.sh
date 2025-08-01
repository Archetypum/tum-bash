#!/bin/bash
#
# `lib/package_manager/pkg.sh`
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

function pkg()                     { execute pkg                  "$@"; }
function pkg_add()                 { execute pkg add              "$@"; }
function pkg_alias()               { execute pkg alias            "$@"; }
function pkg_all_depends()         { execute pkg all-depends      "$@"; }
function pkg_annotate()            { execute pkg annotate         "$@"; }
function pkg_annotations()         { execute pkg annotations      "$@"; }
function pkg_audit()               { execute pkg audit            "$@"; }
function pkg_autoremove()          { execute pkg autoremove       "$@"; }
function pkg_backup()              { execute pkg backup           "$@"; }
function pkg_bootstrap()           { execute pkg bootstrap        "$@"; }
function pkg_build_depends()       { execute pkg build-depends    "$@"; }
function pkg_check()               { execute pkg check            "$@"; }
function pkg_cinfo()               { execute pkg cinfo            "$@"; }
function pkg_clean()               { execute pkg clean            "$@"; }
function pkg_comment()             { execute pkg comment          "$@"; }
function pkg_convert()             { execute pkg convert          "$@"; }
function pkg_create()              { execute pkg create           "$@"; }
function pkg_csearch()             { execute pkg csearch          "$@"; }
function pkg_delete()              { execute pkg delete           "$@"; }
function pkg_desc()                { execute pkg desc             "$@"; }
function pkg_download()            { execute pkg download         "$@"; }
function pkg_fetch()               { execute pkg fetch            "$@"; }
function pkg_help()                { execute pkg help             "$@"; }
function pkg_iinfo()               { execute pkg iinfo            "$@"; }
function pkg_info()                { execute pkg info             "$@"; }
function pkg_install()             { execute pkg install          "$@"; }
function pkg_isearch()             { execute pkg isearch          "$@"; }
function pkg_leaf()                { execute pkg leaf             "$@"; }
function pkg_list()                { execute pkg list             "$@"; }
function pkg_lock()                { execute pkg lock             "$@"; }
function pkg_noauto()              { execute pkg noauto           "$@"; }
function pkg_options()             { execute pkg options          "$@"; }
function pkg_origin()              { execute pkg options          "$@"; }
function pkg_orphans()             { execute pkg orphans          "$@"; }
function pkg_plugins()             { execute pkg plugins          "$@"; }
function pkg_prime_list()          { execute pkg prime-list       "$@"; }
function pkg_prime_origins()       { execute pkg prime-origins    "$@"; }
function pkg_provided_depends()    { execute pkg provided-depends "$@"; }
function pkg_query()               { execute pkg query            "$@"; }
function pkg_rall_depends()        { execute pkg rall-depends     "$@"; }
function pkg_raw()                 { execute pkg raw              "$@"; }
function pkg_rcomment()            { execute pkg rcomment         "$@"; }
function pkg_rdesc()               { execute pkg rdesc            "$@"; }
function pkg_register()            { execute pkg register         "$@"; }
function pkg_remove()              { execute pkg remove           "$@"; }
function pkg_repo()                { execute pkg repo             "$@"; }
function pkg_required_depends()    { execute pkg required-depends "$@"; }
function pkg_roptions()            { execute pkg roptions         "$@"; }
function pkg_rquery()              { execute pkg rquery           "$@"; }
function pkg_runmaintained()       { execute pkg runmaintained    "$@"; }
function pkg_search()              { execute pkg search           "$@"; }
function pkg_set()                 { execute pkg set              "$@"; }
function pkg_shared_depends()      { execute pkg shared-depends   "$@"; }
function pkg_shell()               { execute pkg shell            "$@"; }
function pkg_shlib()               { execute pkg shlib            "$@"; }
function pkg_show()                { execute pkg show             "$@"; }
function pkg_size()                { execute pkg size             "$@"; }
function pkg_stats()               { execute pkg stats            "$@"; }
function pkg_unlock()              { execute pkg unlock           "$@"; }
function pkg_unmaintained()        { execute pkg unmaintained     "$@"; }
function pkg_update()              { execute pkg update           "$@"; }
function pkg_updating()            { execute pkg updating         "$@"; }
function pkg_upgrade()             { execute pkg upgrade          "$@"; }
function pkg_version()             { execute pkg version          "$@"; }
function pkg_which()               { execute pkg which            "$@"; }

