#!/usr/bin/env bash
#
# `lib/package_manager/slackpkg.sh`
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

slackpkg()                     { execute slackpkg               "$@"; }
slackpkg_search()              { execute slackpkg search        "$@"; }
slackpkg_install()             { execute slackpkg install       "$@"; }
slackpkg_upgrade()             { execute slackpkg upgrade       "$@"; }
slackpkg_reinstall()           { execute slackpkg reinstall     "$@"; }
slackpkg_remove()              { execute slackpkg remove        "$@"; }
slackpkg_blacklist()           { execute slackpkg blacklist     "$@"; }
slackpkg_download()            { execute slackpkg download      "$@"; }
slackpkg_info()                { execute slackpkg info          "$@"; }
slackpkg_clean_system()        { execute slackpkg clean-system  "$@"; }
slackpkg_upgrade_all()         { execute slackpkg upgrade-all   "$@"; }
slackpkg_install_new()         { execute slackpkg install-new   "$@"; }
slackpkg_check_updates()       { execute slackpkg check-updates "$@"; }
slackpkg_update()              { execute slackpkg update        "$@"; }

