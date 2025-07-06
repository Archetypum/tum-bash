#!/bin/bash
#
# `t/test_package_manager/test_yum.sh`
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
    echo -e "\n[<==] Starting tests for 'yum'...\n"

    /usr/bin/tum yum
    /usr/bin/tum yum_advisory
    /usr/bin/tum yum_autoremove
    /usr/bin/tum yum_check
    /usr/bin/tum yum_check_upgrade
    /usr/bin/tum yum_clean
    /usr/bin/tum yum_distro_sync
    /usr/bin/tum yum_downgrade
    /usr/bin/tum yum_download
    /usr/bin/tum yum_environment
    /usr/bin/tum yum_group
    /usr/bin/tum yum_history
    /usr/bin/tum yum_info
    /usr/bin/tum yum_install
    /usr/bin/tum yum_leaves
    /usr/bin/tum yum_list
    /usr/bin/tum yum_makecache
    /usr/bin/tum yum_mark
    /usr/bin/tum yum_module
    /usr/bin/tum yum_offline
    /usr/bin/tum yum_provides
    /usr/bin/tum yum_reinstall
    /usr/bin/tum yum_remove
    /usr/bin/tum yum_replay
    /usr/bin/tum yum_repo
    /usr/bin/tum yum_repoquery
    /usr/bin/tum yum_search
    /usr/bin/tum yum_swap
    /usr/bin/tum yum_system_upgrade
    /usr/bin/tum yum_upgrade
    /usr/bin/tum yum_versionlock
    /usr/bin/tum yum_debuginfo_install
    /usr/bin/tum yum_offline_distrosync
    /usr/bin/tum yum_offline_upgrade
    /usr/bin/tum yum_config_manager
    /usr/bin/tum yum_builddep
    /usr/bin/tum yum_changelog
    /usr/bin/tum yum_copr
    /usr/bin/tum yum_needs_restarting
    /usr/bin/tum yum_repoclosure
    /usr/bin/tum yum_reposync

    echo -e "\n${GREEN}[*] All tests passed.${RESET}"
}

main
