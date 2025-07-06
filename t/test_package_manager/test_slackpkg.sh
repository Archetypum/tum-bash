#!/bin/bash
#
# `t/test_package_manager/test_slackpkg.sh`
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

declare -r GREEN="\033[0;32m"
declare -r RESET="\033[0m"

function main
{
    echo -e "\n[<==] Starting tests for 'slackpkg'...\n"

    /usr/bin/tum slackpkg
    /usr/bin/tum slackpkg_search
    /usr/bin/tum slackpkg_install
    /usr/bin/tum slackpkg_upgrade
    /usr/bin/tum slackpkg_reinstall
    /usr/bin/tum slackpkg_remove
    /usr/bin/tum slackpkg_blacklist
    /usr/bin/tum slackpkg_download
    /usr/bin/tum slackpkg_info
    /usr/bin/tum slackpkg_clean_system
    /usr/bin/tum slackpkg_upgrade_all
    /usr/bin/tum slackpkg_install_new
    /usr/bin/tum slackpkg_check_updates
    /usr/bin/tum slackpkg_update

    echo -e "\n${GREEN}[*] All tests passed.${RESET}"
}

main
