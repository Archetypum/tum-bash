#!/usr/bin/env bash
#
# `t/test_package_manager/test_apk.sh`
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
	echo -e "\n[<==] Starting tests for 'apk'...\n"

	/usr/bin/tum apk
	/usr/bin/tum apk_help
	/usr/bin/tum apk_add
	/usr/bin/tum apk_del
	/usr/bin/tum apk_fix
	/usr/bin/tum apk_update
	/usr/bin/tum apk_upgrade
	/usr/bin/tum apk_cache
	/usr/bin/tum apk_info
	/usr/bin/tum apk_list
	/usr/bin/tum apk_dot
	/usr/bin/tum apk_policy
	/usr/bin/tum apk_search
	/usr/bin/tum apk_index
	/usr/bin/tum apk_fetch
	/usr/bin/tum apk_manifest
	/usr/bin/tum apk_verify
	/usr/bin/tum apk_audit
	/usr/bin/tum apk_stats
	/usr/bin/tum apk_version

	echo -e "\n${GREEN}[*] All tests passed.${RESET}"
}

main
