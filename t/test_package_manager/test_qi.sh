#!/bin/bash
#
# `t/test_package_manager/test_qi.sh`
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

declare -r GREEN="\033[0;32m"
declare -r RESET="\033[0m"

function main
{
    echo -e "\n[<==] Starting tests for 'qi'...\n"

    /usr/bin/tum qi
    /usr/bin/tum qi_warn
    /usr/bin/tum qi_install
    /usr/bin/tum qi_remove
    /usr/bin/tum qi_upgrade
    /usr/bin/tum qi_extract
    /usr/bin/tum qi_create
    /usr/bin/tum qi_build
    /usr/bin/tum qi_order

    echo -e "\n${GREEN}[*] All tests passed.${RESET}"
}

main
