#!/usr/bin/env bash
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

dnf()                    { execute dnf                    "$@"; }
dnf_advisory()           { execute dnf advisory           "$@"; }
dnf_autoremove()         { execute dnf autoremove         "$@"; }
dnf_check()              { execute dnf check              "$@"; }
dnf_check_upgrade()      { execute dnf check-upgrade      "$@"; }
dnf_clean()              { execute dnf clean              "$@"; }
dnf_distro_sync()        { execute dnf distro-sync        "$@"; }
dnf_downgrade()          { execute dnf downgrade          "$@"; }
dnf_download()           { execute dnf download           "$@"; }
dnf_environment()        { execute dnf environment        "$@"; }
dnf_group()              { execute dnf group              "$@"; }
dnf_history()            { execute dnf history            "$@"; }
dnf_info()               { execute dnf info               "$@"; }
dnf_install()            { execute dnf install            "$@"; }
dnf_leaves()             { execute dnf leaves             "$@"; }
dnf_list()               { execute dnf list               "$@"; }
dnf_makecache()          { execute dnf makecache          "$@"; }
dnf_mark()               { execute dnf mark               "$@"; }
dnf_module()             { execute dnf module             "$@"; }
dnf_offline()            { execute dnf offline            "$@"; }
dnf_provides()           { execute dnf provides           "$@"; }
dnf_reinstall()          { execute dnf reinstall          "$@"; }
dnf_remove()             { execute dnf remove             "$@"; }
dnf_replay()             { execute dnf replay             "$@"; }
dnf_repo()               { execute dnf repo               "$@"; }
dnf_repoquery()          { execute dnf repoquery          "$@"; }
dnf_search()             { execute dnf search             "$@"; }
dnf_swap()               { execute dnf swap               "$@"; }
dnf_system_upgrade()     { execute dnf system-upgrade     "$@"; }
dnf_upgrade()            { execute dnf upgrade            "$@"; }
dnf_versionlock()        { execute dnf versionlock        "$@"; }
dnf_debuginfo_install()  { execute dnf debuginfo-install  "$@"; }
dnf_offline_distrosync() { execute dnf offline-distrosync "$@"; }
dnf_offline_upgrade()    { execute dnf offline-upgrade    "$@"; }
dnf_config_manager()     { execute dnf config-manager     "$@"; }
dnf_builddep()           { execute dnf builddep           "$@"; }
dnf_changelog()          { execute dnf changelog          "$@"; }
dnf_copr()               { execute dnf copr               "$@"; }
dnf_needs_restarting()   { execute dnf needs-restarting   "$@"; }
dnf_repoclosure()        { execute dnf repoclosure        "$@"; }
dnf_reposync()           { execute dnf reposync           "$@"; }

