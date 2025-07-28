#!/bin/bash
#
# `t/test_package_manager/test_aptitude.sh`
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
	echo -e "\n[<==] Starting tests for 'aptitude'...\n"

	/usr/bin/tum aptitude
	/usr/bin/tum aptitude_add_user_tag
	/usr/bin/tum aptitude_clean
	/usr/bin/tum aptitude_forget_new
	/usr/bin/tum aptitude_keep
	/usr/bin/tum aptitude_reinstall
	/usr/bin/tum aptitude_search
	/usr/bin/tum aptitude_update
	/usr/bin/tum aptitude_why_not
	/usr/bin/tum aptitude_autoclean
	/usr/bin/tum aptitude_dist_upgrade
	/usr/bin/tum aptitude_full_upgrade
	/usr/bin/tum aptitude_keep_all
	/usr/bin/tum aptitude_remove
	/usr/bin/tum aptitude_show
	/usr/bin/tum aptitude_upgrade
	/usr/bin/tum aptitude_build_dep
	/usr/bin/tum aptitude_download
	/usr/bin/tum aptitude_hold
	/usr/bin/tum aptitude_markauto
	/usr/bin/tum aptitude_remove_user_tag
	/usr/bin/tum aptitude_unhold
	/usr/bin/tum aptitude_versions
	/usr/bin/tum aptitude_changelog
	/usr/bin/tum aptitude_forbid_version
	/usr/bin/tum aptitude_install
	/usr/bin/tum aptitude_purge
	/usr/bin/tum aptitude_safe_upgrade
	/usr/bin/tum aptitude_unmarkauto
	/usr/bin/tum aptitude_why

	echo -e "\n${GREEN}[*] All tests passed.${RESET}"
}

main
