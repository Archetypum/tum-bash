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

function zypper()                             { execute zypper                        "$@"; }
function zypper_addlocale()                   { execute zypper addlocale              "$@"; }
function zypper_addlock()                     { execute zypper addlock                "$@"; }
function zypper_addrepo()                     { execute zypper addrepo                "$@"; }
function zypper_addservice()                  { execute zypper addservice             "$@"; }
function zypper_appsteam_cache()              { execute zypper appstream-cache        "$@"; }
function zypper_clean()                       { execute zypper clean                  "$@"; }
function zypper_cleanlocks()                  { execute zypper cleanlocks             "$@"; }
function zypper_dist_upgrade()                { execute zypper dist-upgrade           "$@"; }
function zypper_download()                    { execute zypper download               "$@"; }
function zypper_help()                        { execute zypper help                   "$@"; }
function zypper_info()                        { execute zypper info                   "$@"; }
function zypper_install()                     { execute zypper install                "$@"; }
function zypper_install_new_recommends()      { execute zypper install-new-recommends "$@"; }
function zypper_licenses()                    { execute zypper licenses               "$@"; }
function zypper_list_patches()                { execute zypper list-patches           "$@"; }
function zypper_list_updates()                { execute zypper list-updates           "$@"; }
function zypper_locales()                     { execute zypper locales                "$@"; }
function zypper_locks()                       { execute zypper locks                  "$@"; }
function zypper_modifyrepo()                  { execute zypper modifyrepo             "$@"; }
function zypper_modifyservice()               { execute zypper modifyservice          "$@"; }
function zypper_needs_rebooting()             { execute zypper needs-rebooting        "$@"; }
function zypper_packages()                    { execute zypper packages               "$@"; }
function zypper_patch()                       { execute zypper patch                  "$@"; }
function zypper_patch_check()                 { execute zypper patch-check            "$@"; }
function zypper_patches()                     { execute zypper patches                "$@"; }
function zypper_patch_info()                  { execute zypper patch-info             "$@"; }
function zypper_patterns()                    { execute zypper patterns               "$@"; }
function zypper_product_info()                { execute zypper product-info           "$@"; }
function zypper_products()                    { execute zypper products               "$@"; }
function zypper_purge_kernels()               { execute zypper purge-kernels          "$@"; }
function zypper_ps()                          { execute zypper ps                     "$@"; }
function zypper_refresh()                     { execute zypper refresh                "$@"; }
function zypper_refresh_services()            { execute zypper refresh-services       "$@"; }
function zypper_remove()                      { execute zypper remove                 "$@"; }
function zypper_removelocale()                { execute zypper removelocale           "$@"; }
function zypper_removelock()                  { execute zypper removelock             "$@"; }
function zypper_removeptf()                   { execute zypper removeptf              "$@"; }
function zypper_removerepo()                  { execute zypper removerepo             "$@"; }
function zypper_removeservice()               { execute zypper removeservice          "$@"; }
function zypper_renamerepo()                  { execute zypper renamerepo             "$@"; }
function zypper_repos()                       { execute zypper repos                  "$@"; }
function zypper_search()                      { execute zypper search                 "$@"; }
function zypper_services()                    { execute zypper services               "$@"; }
function zypper_shell()                       { execute zypper shell                  "$@"; }
function zypper_source_download()             { execute zypper source-download        "$@"; }
function zypper_source_install()              { execute zypper source-install         "$@"; }
function zypper_subcommand()                  { execute zypper subcommand             "$@"; }
function zypper_system_architecture()         { execute zypper system-architecture    "$@"; }
function zypper_targetos()                    { execute zypper targetos               "$@"; }
function zypper_update()                      { execute zypper update                 "$@"; }
function zypper_versioncmp()                  { execute zypper versioncmp             "$@"; }
function zypper_verify()                      { execute zypper verify                 "$@"; }
function zypper_what_provides()               { execute zypper what-provides          "$@"; }

