#!/bin/bash
#
# `t/test_package_manager/test_xbps_query.sh`
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

#!/bin/bash

declare -r GREEN="\033[0;32m"
declare -r RESET="\033[0m"

function main
{
    echo -e "\n[<==] Starting tests for 'xbps-query'...\n"

    /usr/bin/tum xbps_query
    /usr/bin/tum xbps_query_list_pkgs
    /usr/bin/tum xbps_query_list_hold_pkgs
    /usr/bin/tum xbps_query_list_repos
    /usr/bin/tum xbps_query_list_manual_pkgs
    /usr/bin/tum xbps_query_list_orphans
    /usr/bin/tum xbps_query_ownedby
    /usr/bin/tum xbps_query_show
    /usr/bin/tum xbps_query_search
    /usr/bin/tum xbps_query_files
    /usr/bin/tum xbps_query_deps
    /usr/bin/tum xbps_query_revdeps
    /usr/bin/tum xbps_query_cat

    echo -e "\n${GREEN}[*] All tests passed.${RESET}"
}

main
