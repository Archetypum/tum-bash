#!/bin/bash
#
# `t/test_package_manager/test_dpkg.sh`
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
	echo -e "\n[<==] Starting tests for 'dpkg'...\n"

	/usr/bin/tum dpkg
	/usr/bin/tum dpkg_abort_after
	/usr/bin/tum dpkg_add_architecture
	/usr/bin/tum dpkg_audit
	/usr/bin/tum dpkg_auto_deconfigure
	/usr/bin/tum dpkg_clear_avail
	/usr/bin/tum dpkg_clear_selection
	/usr/bin/tum dpkg_compare_versions
	/usr/bin/tum dpkg_configure
	/usr/bin/tum dpkg_field
	/usr/bin/tum dpkg_forget_old_unavail
	/usr/bin/tum dpkg_get_selections
	/usr/bin/tum dpkg_help
	/usr/bin/tum dpkg_install
	/usr/bin/tum dpkg_list
	/usr/bin/tum dpkg_listfiles
	/usr/bin/tum dpkg_merge_avail
	/usr/bin/tum dpkg_predep_package
	/usr/bin/tum dpkg_print_architecture
	/usr/bin/tum dpkg_print_avail
	/usr/bin/tum dpkg_print_foreign_architectures
	/usr/bin/tum dpkg_purge
	/usr/bin/tum dpkg_record_avail
	/usr/bin/tum dpkg_remove
	/usr/bin/tum dpkg_remove_architecture
	/usr/bin/tum dpkg_search
	/usr/bin/tum dpkg_set_selections
	/usr/bin/tum dpkg_status
	/usr/bin/tum dpkg_unpack
	/usr/bin/tum dpkg_update_avail
	/usr/bin/tum dpkg_verify
	/usr/bin/tum dpkg_version

	echo -e "\n${GREEN}[*] All tests passed.${RESET}"
}

main
