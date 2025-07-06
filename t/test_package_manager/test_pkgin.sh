#!/bin/bash
#
# `t/test_package_manager/test_pkgin.sh`
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
	echo -e "\n[<==] Starting tests for 'pkgin'...\n"

	/usr/bin/tum pkgin
	/usr/bin/tum pkgin_list
	/usr/bin/tum pkgin_avail
	/usr/bin/tum pkgin_search
	/usr/bin/tum pkgin_install
	/usr/bin/tum pkgin_update
	/usr/bin/tum pkgin_upgrade
	/usr/bin/tum pkgin_full_upgrade
	/usr/bin/tum pkgin_remove
	/usr/bin/tum pkgin_keep
	/usr/bin/tum pkgin_unkeep
	/usr/bin/tum pkgin_export
	/usr/bin/tum pkgin_import
	/usr/bin/tum pkgin_show_keep
	/usr/bin/tum pkgin_show_no_keep
	/usr/bin/tum pkgin_autoremove
	/usr/bin/tum pkgin_clean
	/usr/bin/tum pkgin_show_deps
	/usr/bin/tum pkgin_show_full_deps
	/usr/bin/tum pkgin_show_rev_deps
	/usr/bin/tum pkgin_provides
	/usr/bin/tum pkgin_requires
	/usr/bin/tum pkgin_show_category
	/usr/bin/tum pkgin_show_pkg_category
	/usr/bin/tum pkgin_show_all_categories
	/usr/bin/tum pkgin_pkg_content
	/usr/bin/tum pkgin_pkg_descr
	/usr/bin/tum pkgin_pkg_build_defs
	/usr/bin/tum pkgin_stats

	echo -e "\n${GREEN}[*] All tests passed.${RESET}"
}

main
