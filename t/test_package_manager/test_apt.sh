#!/usr/bin/env bash
#
# `t/test_package_manager/test_apt.sh`
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
	echo -e "\n[<==] Starting tests for 'apt'...\n"

	/usr/bin/tum apt
	/usr/bin/tum apt_autoclean
	/usr/bin/tum apt_autoremove
	/usr/bin/tum apt_changelog
	/usr/bin/tum apt_depends
	/usr/bin/tum apt_download
	/usr/bin/tum apt_full_upgrade
	/usr/bin/tum apt_install
	/usr/bin/tum apt_moo
	/usr/bin/tum apt_purge
	/usr/bin/tum apt_reinstall
	/usr/bin/tum apt_search
	/usr/bin/tum apt_showsrc
	/usr/bin/tum apt_update
	/usr/bin/tum apt_autopurge
	/usr/bin/tum apt_build_dep
	/usr/bin/tum apt_clean
	/usr/bin/tum apt_dist_upgrade
	/usr/bin/tum apt_edit_sources
	/usr/bin/tum apt_help
	/usr/bin/tum apt_list
	/usr/bin/tum apt_policy
	/usr/bin/tum apt_rdepends
	/usr/bin/tum apt_remove
	/usr/bin/tum apt_show
	/usr/bin/tum apt_source
	/usr/bin/tum apt_upgrade

	echo -e "\n${GREEN}[*] All tests passed.${RESET}"
}

main
