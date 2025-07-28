#!/bin/bash
#
# `t/test_package_manager/test_guix.sh`
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
	echo -e "\n[<==] Starting tests for 'guix'...\n"

	/usr/bin/tum guix
	/usr/bin/tum guix_archive
	/usr/bin/tum guix_build
	/usr/bin/tum guix_challenge
	/usr/bin/tum guix_container
	/usr/bin/tum guix_copy
	/usr/bin/tum guix_deploy
	/usr/bin/tum guix_describe
	/usr/bin/tum guix_download
	/usr/bin/tum guix_edit
	/usr/bin/tum guix_environment
	/usr/bin/tum guix_gc
	/usr/bin/tum guix_git
	/usr/bin/tum guix_graph
	/usr/bin/tum guix_hash
	/usr/bin/tum guix_help
	/usr/bin/tum guix_home
	/usr/bin/tum guix_import
	/usr/bin/tum guix_install
	/usr/bin/tum guix_lint
	/usr/bin/tum guix_offload
	/usr/bin/tum guix_pack
	/usr/bin/tum guix_package
	/usr/bin/tum guix_processes
	/usr/bin/tum guix_publish
	/usr/bin/tum guix_pull
	/usr/bin/tum guix_refresh
	/usr/bin/tum guix_remove
	/usr/bin/tum guix_repl
	/usr/bin/tum guix_search
	/usr/bin/tum guix_shell
	/usr/bin/tum guix_show
	/usr/bin/tum guix_size
	/usr/bin/tum guix_style
	/usr/bin/tum guix_system
	/usr/bin/tum guix_time_machine
	/usr/bin/tum guix_upgrade
	/usr/bin/tum guix_weather

	echo -e "\n${GREEN}[*] All tests passed.${RESET}"
}

main
