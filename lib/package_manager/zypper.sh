#!/usr/bin/env bash
#
# `lib/package_manager/zypper.sh`
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

zypper()                             { execute zypper                        "$@"; }
zypper_addlocale()                   { execute zypper addlocale              "$@"; }
zypper_addlock()                     { execute zypper addlock                "$@"; }
zypper_addrepo()                     { execute zypper addrepo                "$@"; }
zypper_addservice()                  { execute zypper addservice             "$@"; }
zypper_appsteam_cache()              { execute zypper appstream-cache        "$@"; }
zypper_clean()                       { execute zypper clean                  "$@"; }
zypper_cleanlocks()                  { execute zypper cleanlocks             "$@"; }
zypper_dist_upgrade()                { execute zypper dist-upgrade           "$@"; }
zypper_download()                    { execute zypper download               "$@"; }
zypper_help()                        { execute zypper help                   "$@"; }
zypper_info()                        { execute zypper info                   "$@"; }
zypper_install()                     { execute zypper install                "$@"; }
zypper_install_new_recommends()      { execute zypper install-new-recommends "$@"; }
zypper_licenses()                    { execute zypper licenses               "$@"; }
zypper_list_patches()                { execute zypper list-patches           "$@"; }
zypper_list_updates()                { execute zypper list-updates           "$@"; }
zypper_locales()                     { execute zypper locales                "$@"; }
zypper_locks()                       { execute zypper locks                  "$@"; }
zypper_modifyrepo()                  { execute zypper modifyrepo             "$@"; }
zypper_modifyservice()               { execute zypper modifyservice          "$@"; }
zypper_needs_rebooting()             { execute zypper needs-rebooting        "$@"; }
zypper_packages()                    { execute zypper packages               "$@"; }
zypper_patch()                       { execute zypper patch                  "$@"; }
zypper_patch_check()                 { execute zypper patch-check            "$@"; }
zypper_patches()                     { execute zypper patches                "$@"; }
zypper_patch_info()                  { execute zypper patch-info             "$@"; }
zypper_patterns()                    { execute zypper patterns               "$@"; }
zypper_product_info()                { execute zypper product-info           "$@"; }
zypper_products()                    { execute zypper products               "$@"; }
zypper_purge_kernels()               { execute zypper purge-kernels          "$@"; }
zypper_ps()                          { execute zypper ps                     "$@"; }
zypper_refresh()                     { execute zypper refresh                "$@"; }
zypper_refresh_services()            { execute zypper refresh-services       "$@"; }
zypper_remove()                      { execute zypper remove                 "$@"; }
zypper_removelocale()                { execute zypper removelocale           "$@"; }
zypper_removelock()                  { execute zypper removelock             "$@"; }
zypper_removeptf()                   { execute zypper removeptf              "$@"; }
zypper_removerepo()                  { execute zypper removerepo             "$@"; }
zypper_removeservice()               { execute zypper removeservice          "$@"; }
zypper_renamerepo()                  { execute zypper renamerepo             "$@"; }
zypper_repos()                       { execute zypper repos                  "$@"; }
zypper_search()                      { execute zypper search                 "$@"; }
zypper_services()                    { execute zypper services               "$@"; }
zypper_shell()                       { execute zypper shell                  "$@"; }
zypper_source_download()             { execute zypper source-download        "$@"; }
zypper_source_install()              { execute zypper source-install         "$@"; }
zypper_subcommand()                  { execute zypper subcommand             "$@"; }
zypper_system_architecture()         { execute zypper system-architecture    "$@"; }
zypper_targetos()                    { execute zypper targetos               "$@"; }
zypper_update()                      { execute zypper update                 "$@"; }
zypper_versioncmp()                  { execute zypper versioncmp             "$@"; }
zypper_verify()                      { execute zypper verify                 "$@"; }
zypper_what_provides()               { execute zypper what-provides          "$@"; }

