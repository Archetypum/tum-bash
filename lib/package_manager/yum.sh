#!/bin/bash
#
# `lib/package_manager/yum.sh`
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

function yum()                    { execute yum                    "$@"; }
function yum_advisory()           { execute yum advisory           "$@"; }
function yum_autoremove()         { execute yum autoremove         "$@"; }
function yum_check()              { execute yum check              "$@"; }
function yum_check_upgrade()      { execute yum check-upgrade      "$@"; }
function yum_clean()              { execute yum clean              "$@"; }
function yum_distro_sync()        { execute yum distro-sync        "$@"; }
function yum_downgrade()          { execute yum downgrade          "$@"; }
function yum_download()           { execute yum download           "$@"; }
function yum_environment()        { execute yum environment        "$@"; }
function yum_group()              { execute yum group              "$@"; }
function yum_history()            { execute yum history            "$@"; }
function yum_info()               { execute yum info               "$@"; }
function yum_install()            { execute yum install            "$@"; }
function yum_leaves()             { execute yum leaves             "$@"; }
function yum_list()               { execute yum list               "$@"; }
function yum_makecache()          { execute yum makecache          "$@"; }
function yum_mark()               { execute yum mark               "$@"; }
function yum_module()             { execute yum module             "$@"; }
function yum_offline()            { execute yum offline            "$@"; }
function yum_provides()           { execute yum provides           "$@"; }
function yum_reinstall()          { execute yum reinstall          "$@"; }
function yum_remove()             { execute yum remove             "$@"; }
function yum_replay()             { execute yum replay             "$@"; }
function yum_repo()               { execute yum repo               "$@"; }
function yum_repoquery()          { execute yum repoquery          "$@"; }
function yum_search()             { execute yum search             "$@"; }
function yum_swap()               { execute yum swap               "$@"; }
function yum_system_upgrade()     { execute yum system-upgrade     "$@"; }
function yum_upgrade()            { execute yum upgrade            "$@"; }
function yum_versionlock()        { execute yum versionlock        "$@"; }
function yum_debuginfo_install()  { execute yum debuginfo-install  "$@"; }
function yum_offline_distrosync() { execute yum offline-distrosync "$@"; }
function yum_offline_upgrade()    { execute yum offline-upgrade    "$@"; }
function yum_config_manager()     { execute yum config-manager     "$@"; }
function yum_builddep()           { execute yum builddep           "$@"; }
function yum_changelog()          { execute yum changelog          "$@"; }
function yum_copr()               { execute yum copr               "$@"; }
function yum_needs_restarting()   { execute yum needs-restarting   "$@"; }
function yum_repoclosure()        { execute yum repoclosure        "$@"; }
function yum_reposync()           { execute yum reposync           "$@"; }

