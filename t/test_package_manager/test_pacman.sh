#!/bin/bash
#
# `t/test_package_manager/test_pacman.sh`
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
	echo -e "\n[<==] Starting tests for 'pacman'...\n"

	/usr/bin/tum pacman_help
	/usr/bin/tum pacman_version
	/usr/bin/tum pacman_database
	/usr/bin/tum pacman_files
	/usr/bin/tum pacman_query
	/usr/bin/tum pacman_remove
	/usr/bin/tum pacman_sync
	/usr/bin/tum pacman_deptest
	/usr/bin/tum pacman_upgrade

	echo -e "\n${GREEN}[*] All tests passed.${RESET}"
}

main
