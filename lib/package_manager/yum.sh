#!/usr/bin/env bash
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

yum()                    { execute yum                    "$@"; }
yum_advisory()           { execute yum advisory           "$@"; }
yum_autoremove()         { execute yum autoremove         "$@"; }
yum_check()              { execute yum check              "$@"; }
yum_check_upgrade()      { execute yum check-upgrade      "$@"; }
yum_clean()              { execute yum clean              "$@"; }
yum_distro_sync()        { execute yum distro-sync        "$@"; }
yum_downgrade()          { execute yum downgrade          "$@"; }
yum_download()           { execute yum download           "$@"; }
yum_environment()        { execute yum environment        "$@"; }
yum_group()              { execute yum group              "$@"; }
yum_history()            { execute yum history            "$@"; }
yum_info()               { execute yum info               "$@"; }
yum_install()            { execute yum install            "$@"; }
yum_leaves()             { execute yum leaves             "$@"; }
yum_list()               { execute yum list               "$@"; }
yum_makecache()          { execute yum makecache          "$@"; }
yum_mark()               { execute yum mark               "$@"; }
yum_module()             { execute yum module             "$@"; }
yum_offline()            { execute yum offline            "$@"; }
yum_provides()           { execute yum provides           "$@"; }
yum_reinstall()          { execute yum reinstall          "$@"; }
yum_remove()             { execute yum remove             "$@"; }
yum_replay()             { execute yum replay             "$@"; }
yum_repo()               { execute yum repo               "$@"; }
yum_repoquery()          { execute yum repoquery          "$@"; }
yum_search()             { execute yum search             "$@"; }
yum_swap()               { execute yum swap               "$@"; }
yum_system_upgrade()     { execute yum system-upgrade     "$@"; }
yum_upgrade()            { execute yum upgrade            "$@"; }
yum_versionlock()        { execute yum versionlock        "$@"; }
yum_debuginfo_install()  { execute yum debuginfo-install  "$@"; }
yum_offline_distrosync() { execute yum offline-distrosync "$@"; }
yum_offline_upgrade()    { execute yum offline-upgrade    "$@"; }
yum_config_manager()     { execute yum config-manager     "$@"; }
yum_builddep()           { execute yum builddep           "$@"; }
yum_changelog()          { execute yum changelog          "$@"; }
yum_copr()               { execute yum copr               "$@"; }
yum_needs_restarting()   { execute yum needs-restarting   "$@"; }
yum_repoclosure()        { execute yum repoclosure        "$@"; }
yum_reposync()           { execute yum reposync           "$@"; }

