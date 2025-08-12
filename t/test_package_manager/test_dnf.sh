#!/usr/bin/env bash
#
# `t/test_package_manager/test_dnf.sh`
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
	echo -e "\n[<==] Starting tests for 'dnf'...\n"

	/usr/bin/tum dnf
	/usr/bin/tum dnf_advisory
	/usr/bin/tum dnf_autoremove
	/usr/bin/tum dnf_check
	/usr/bin/tum dnf_check_upgrade
	/usr/bin/tum dnf_clean
	/usr/bin/tum dnf_distro_sync
	/usr/bin/tum dnf_downgrade
	/usr/bin/tum dnf_download
	/usr/bin/tum dnf_environment
	/usr/bin/tum dnf_group
	/usr/bin/tum dnf_history
	/usr/bin/tum dnf_info
	/usr/bin/tum dnf_install
	/usr/bin/tum dnf_leaves
	/usr/bin/tum dnf_list
	/usr/bin/tum dnf_makecache
	/usr/bin/tum dnf_mark
	/usr/bin/tum dnf_module
	/usr/bin/tum dnf_offline
	/usr/bin/tum dnf_provides
	/usr/bin/tum dnf_reinstall
	/usr/bin/tum dnf_remove
	/usr/bin/tum dnf_replay
	/usr/bin/tum dnf_repo
	/usr/bin/tum dnf_repoquery
	/usr/bin/tum dnf_search
	/usr/bin/tum dnf_swap
	/usr/bin/tum dnf_system_upgrade
	/usr/bin/tum dnf_upgrade
	/usr/bin/tum dnf_versionlock
	/usr/bin/tum dnf_debuginfo_install
	/usr/bin/tum dnf_offline_distrosync
	/usr/bin/tum dnf_offline_upgrade
	/usr/bin/tum dnf_config_manager
	/usr/bin/tum dnf_builddep
	/usr/bin/tum dnf_changelog
	/usr/bin/tum dnf_copr
	/usr/bin/tum dnf_needs_restarting
	/usr/bin/tum dnf_repoclosure
	/usr/bin/tum dnf_reposync

	echo -e "\n${GREEN}[*] All tests passed.${RESET}"
}

main
