#!/usr/bin/env bash
#
# `t/test_package_manager/test_yay.sh`
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
    echo -e "\n[<==] Starting tests for 'yay'...\n"

    /usr/bin/tum yay
    /usr/bin/tum yay_build
    /usr/bin/tum yay_show
    /usr/bin/tum yay_getpkgbuild
    /usr/bin/tum yay_web

    echo -e "\n${GREEN}[*] All tests passed.${RESET}"
}

main
