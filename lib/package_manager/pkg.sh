#!/usr/bin/env bash
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

pkg()                     { execute pkg                  "$@"; }
pkg_add()                 { execute pkg add              "$@"; }
pkg_alias()               { execute pkg alias            "$@"; }
pkg_all_depends()         { execute pkg all-depends      "$@"; }
pkg_annotate()            { execute pkg annotate         "$@"; }
pkg_annotations()         { execute pkg annotations      "$@"; }
pkg_audit()               { execute pkg audit            "$@"; }
pkg_autoremove()          { execute pkg autoremove       "$@"; }
pkg_backup()              { execute pkg backup           "$@"; }
pkg_bootstrap()           { execute pkg bootstrap        "$@"; }
pkg_build_depends()       { execute pkg build-depends    "$@"; }
pkg_check()               { execute pkg check            "$@"; }
pkg_cinfo()               { execute pkg cinfo            "$@"; }
pkg_clean()               { execute pkg clean            "$@"; }
pkg_comment()             { execute pkg comment          "$@"; }
pkg_convert()             { execute pkg convert          "$@"; }
pkg_create()              { execute pkg create           "$@"; }
pkg_csearch()             { execute pkg csearch          "$@"; }
pkg_delete()              { execute pkg delete           "$@"; }
pkg_desc()                { execute pkg desc             "$@"; }
pkg_download()            { execute pkg download         "$@"; }
pkg_fetch()               { execute pkg fetch            "$@"; }
pkg_help()                { execute pkg help             "$@"; }
pkg_iinfo()               { execute pkg iinfo            "$@"; }
pkg_info()                { execute pkg info             "$@"; }
pkg_install()             { execute pkg install          "$@"; }
pkg_isearch()             { execute pkg isearch          "$@"; }
pkg_leaf()                { execute pkg leaf             "$@"; }
pkg_list()                { execute pkg list             "$@"; }
pkg_lock()                { execute pkg lock             "$@"; }
pkg_noauto()              { execute pkg noauto           "$@"; }
pkg_options()             { execute pkg options          "$@"; }
pkg_origin()              { execute pkg options          "$@"; }
pkg_orphans()             { execute pkg orphans          "$@"; }
pkg_plugins()             { execute pkg plugins          "$@"; }
pkg_prime_list()          { execute pkg prime-list       "$@"; }
pkg_prime_origins()       { execute pkg prime-origins    "$@"; }
pkg_provided_depends()    { execute pkg provided-depends "$@"; }
pkg_query()               { execute pkg query            "$@"; }
pkg_rall_depends()        { execute pkg rall-depends     "$@"; }
pkg_raw()                 { execute pkg raw              "$@"; }
pkg_rcomment()            { execute pkg rcomment         "$@"; }
pkg_rdesc()               { execute pkg rdesc            "$@"; }
pkg_register()            { execute pkg register         "$@"; }
pkg_remove()              { execute pkg remove           "$@"; }
pkg_repo()                { execute pkg repo             "$@"; }
pkg_required_depends()    { execute pkg required-depends "$@"; }
pkg_roptions()            { execute pkg roptions         "$@"; }
pkg_rquery()              { execute pkg rquery           "$@"; }
pkg_runmaintained()       { execute pkg runmaintained    "$@"; }
pkg_search()              { execute pkg search           "$@"; }
pkg_set()                 { execute pkg set              "$@"; }
pkg_shared_depends()      { execute pkg shared-depends   "$@"; }
pkg_shell()               { execute pkg shell            "$@"; }
pkg_shlib()               { execute pkg shlib            "$@"; }
pkg_show()                { execute pkg show             "$@"; }
pkg_size()                { execute pkg size             "$@"; }
pkg_stats()               { execute pkg stats            "$@"; }
pkg_unlock()              { execute pkg unlock           "$@"; }
pkg_unmaintained()        { execute pkg unmaintained     "$@"; }
pkg_update()              { execute pkg update           "$@"; }
pkg_updating()            { execute pkg updating         "$@"; }
pkg_upgrade()             { execute pkg upgrade          "$@"; }
pkg_version()             { execute pkg version          "$@"; }
pkg_which()               { execute pkg which            "$@"; }

