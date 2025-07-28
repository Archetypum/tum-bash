#!/bin/bash
#
# `t/test_package_manager/test_pamac.sh`
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
	echo -e "\n[<==] Starting tests for 'pamac'...\n"

	/usr/bin/tum pamac
	/usr/bin/tum pamac_version
	/usr/bin/tum pamac_help
	/usr/bin/tum pamac_search
	/usr/bin/tum pamac_list
	/usr/bin/tum pamac_info
	/usr/bin/tum pamac_install
	/usr/bin/tum pamac_reinstall
	/usr/bin/tum pamac_remove
	/usr/bin/tum pamac_checkupdates
	/usr/bin/tum pamac_upgrade
	/usr/bin/tum pamac_update
	/usr/bin/tum pamac_clone
	/usr/bin/tum pamac_build
	/usr/bin/tum pamac_clean

	echo -e "\n${GREEN}[*] All tests passed.${RESET}"
}

main