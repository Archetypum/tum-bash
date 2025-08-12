#!/usr/bin/env bash
#
# `t/test_package_manager/test_apt_cache.sh`
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
	echo -e "\n[<==] Starting tests for 'apt-cache'...\n"

	/usr/bin/tum apt_cache
	/usr/bin/tum apt_cache_add
	/usr/bin/tum apt_cache_depends
	/usr/bin/tum apt_cache_dotty
	/usr/bin/tum apt_cache_dump
	/usr/bin/tum apt_cache_dumpavail
	/usr/bin/tum apt_cache_gencaches
	/usr/bin/tum apt_cache_madison
	/usr/bin/tum apt_cache_pkgnames
	/usr/bin/tum apt_cache_policy
	/usr/bin/tum apt_cache_rdepends
	/usr/bin/tum apt_cache_search
	/usr/bin/tum apt_cache_show
	/usr/bin/tum apt_cache_showpkg
	/usr/bin/tum apt_cache_showsrc
	/usr/bin/tum apt_cache_stats
	/usr/bin/tum apt_cache_unmet
	/usr/bin/tum apt_cache_xvcg

	echo -e "\n${GREEN}[*] All tests passed.${RESET}"
}

main
