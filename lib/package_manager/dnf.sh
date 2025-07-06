#!/bin/bash
#
# `lib/package_manager/dnf.sh`
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
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>

declare -r RED="\033[0;31m"
declare -r GREEN="\033[0;32m"
declare -r RESET="\033[0m"

function execute()
{
    local CMD=("$@")
    echo -e "${GREEN}[<==] Executing '${CMD[*]}'...${RESET}"
    if "${CMD[@]}"; then
        echo -e "${GREEN}[*] Success!${RESET}"
        return 0
    else
        echo -e "${RED}[!] Error: Failed to execute: '${CMD[*]}'.${RESET}"
        return 1
    fi
}

function dnf()                    { execute dnf                    "$@"; }
function dnf_advisory()           { execute dnf advisory           "$@"; }
function dnf_autoremove()         { execute dnf autoremove         "$@"; }
function dnf_check()              { execute dnf check              "$@"; }
function dnf_check_upgrade()      { execute dnf check-upgrade      "$@"; }
function dnf_clean()              { execute dnf clean              "$@"; }
function dnf_distro_sync()        { execute dnf distro-sync        "$@"; }
function dnf_downgrade()          { execute dnf downgrade          "$@"; }
function dnf_download()           { execute dnf download           "$@"; }
function dnf_environment()        { execute dnf environment        "$@"; }
function dnf_group()              { execute dnf group              "$@"; }
function dnf_history()            { execute dnf history            "$@"; }
function dnf_info()               { execute dnf info               "$@"; }
function dnf_install()            { execute dnf install            "$@"; }
function dnf_leaves()             { execute dnf leaves             "$@"; }
function dnf_list()               { execute dnf list               "$@"; }
function dnf_makecache()          { execute dnf makecache          "$@"; }
function dnf_mark()               { execute dnf mark               "$@"; }
function dnf_module()             { execute dnf module             "$@"; }
function dnf_offline()            { execute dnf offline            "$@"; }
function dnf_provides()           { execute dnf provides           "$@"; }
function dnf_reinstall()          { execute dnf reinstall          "$@"; }
function dnf_remove()             { execute dnf remove             "$@"; }
function dnf_replay()             { execute dnf replay             "$@"; }
function dnf_repo()               { execute dnf repo               "$@"; }
function dnf_repoquery()          { execute dnf repoquery          "$@"; }
function dnf_search()             { execute dnf search             "$@"; }
function dnf_swap()               { execute dnf swap               "$@"; }
function dnf_system_upgrade()     { execute dnf system-upgrade     "$@"; }
function dnf_upgrade()            { execute dnf upgrade            "$@"; }
function dnf_versionlock()        { execute dnf versionlock        "$@"; }
function dnf_debuginfo_install()  { execute dnf debuginfo-install  "$@"; }
function dnf_offline_distrosync() { execute dnf offline-distrosync "$@"; }
function dnf_offline_upgrade()    { execute dnf offline-upgrade    "$@"; }
function dnf_config_manager()     { execute dnf config-manager     "$@"; }
function dnf_builddep()           { execute dnf builddep           "$@"; }
function dnf_changelog()          { execute dnf changelog          "$@"; }
function dnf_copr()               { execute dnf copr               "$@"; }
function dnf_needs_restarting()   { execute dnf needs-restarting   "$@"; }
function dnf_repoclosure()        { execute dnf repoclosure        "$@"; }
function dnf_reposync()           { execute dnf reposync           "$@"; }

