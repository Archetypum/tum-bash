#!/bin/bash
#
# `t/test_package_manager/test_trizen.sh`
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
    echo -e "\n[<==] Starting tests for 'trizen'...\n"

    /usr/bin/tum trizen
    /usr/bin/tum trizen_sync
    /usr/bin/tum trizen_comments
    /usr/bin/tum trizen_get
    /usr/bin/tum trizen_remove
    /usr/bin/tum trizen_query
    /usr/bin/tum trizen_files
    /usr/bin/tum trizen_database
    /usr/bin/tum trizen_deptest
    /usr/bin/tum trizen_upgrade

    echo -e "\n${GREEN}[*] All tests passed.${RESET}"
}

main
