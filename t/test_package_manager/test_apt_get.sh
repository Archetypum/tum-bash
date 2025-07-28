#!/bin/bash
#
# `t/test_package_manager/test_apt_get.sh`
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
	echo -e "\n[<==] Starting tests for 'apt-get'...\n"

	/usr/bin/tum apt_get
	/usr/bin/tum apt_get_autoclean
	/usr/bin/tum apt_get_build_dep
	/usr/bin/tum apt_get_check
	/usr/bin/tum apt_get_dist_upgrade
	/usr/bin/tum apt_get_dselect_upgrade
	/usr/bin/tum apt_get_install
	/usr/bin/tum apt_get_remove
	/usr/bin/tum apt_get_update
	/usr/bin/tum apt_get_autoremove
	/usr/bin/tum apt_get_changelog
	/usr/bin/tum apt_get_clean
	/usr/bin/tum apt_get_download
	/usr/bin/tum apt_get_indextargets
	/usr/bin/tum apt_get_purge
	/usr/bin/tum apt_get_source
	/usr/bin/tum apt_get_upgrade

	echo -e "\n${GREEN}[*] All tests passed.${RESET}"
}

main
