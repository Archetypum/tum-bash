#!/bin/bash
#
# `t/test_package_manager/test_zypper.sh`
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

#!/bin/bash

declare -r GREEN="\033[0;32m"
declare -r RESET="\033[0m"

function main
{
    echo -e "\n[<==] Starting tests for 'zypper'...\n"

    /usr/bin/tum zypper
    /usr/bin/tum zypper_addlocale
    /usr/bin/tum zypper_addlock
    /usr/bin/tum zypper_addrepo
    /usr/bin/tum zypper_addservice
    /usr/bin/tum zypper_appsteam_cache
    /usr/bin/tum zypper_clean
    /usr/bin/tum zypper_cleanlocks
    /usr/bin/tum zypper_dist_upgrade
    /usr/bin/tum zypper_download
    /usr/bin/tum zypper_help
    /usr/bin/tum zypper_info
    /usr/bin/tum zypper_install
    /usr/bin/tum zypper_install_new_recommends
    /usr/bin/tum zypper_licenses
    /usr/bin/tum zypper_list_patches
    /usr/bin/tum zypper_list_updates
    /usr/bin/tum zypper_locales
    /usr/bin/tum zypper_locks
    /usr/bin/tum zypper_modifyrepo
    /usr/bin/tum zypper_modifyservice
    /usr/bin/tum zypper_needs_rebooting
    /usr/bin/tum zypper_packages
    /usr/bin/tum zypper_patch
    /usr/bin/tum zypper_patch_check
    /usr/bin/tum zypper_patches
    /usr/bin/tum zypper_patch_info
    /usr/bin/tum zypper_patterns
    /usr/bin/tum zypper_product_info
    /usr/bin/tum zypper_products
    /usr/bin/tum zypper_purge_kernels
    /usr/bin/tum zypper_ps
    /usr/bin/tum zypper_refresh
    /usr/bin/tum zypper_refresh_services
    /usr/bin/tum zypper_remove
    /usr/bin/tum zypper_removelocale
    /usr/bin/tum zypper_removelock
    /usr/bin/tum zypper_removeptf
    /usr/bin/tum zypper_removerepo
    /usr/bin/tum zypper_removeservice
    /usr/bin/tum zypper_renamerepo
    /usr/bin/tum zypper_repos
    /usr/bin/tum zypper_search
    /usr/bin/tum zypper_services
    /usr/bin/tum zypper_shell
    /usr/bin/tum zypper_source_download
    /usr/bin/tum zypper_source_install
    /usr/bin/tum zypper_subcommand
    /usr/bin/tum zypper_system_architecture
    /usr/bin/tum zypper_targetos
    /usr/bin/tum zypper_update
    /usr/bin/tum zypper_versioncmp
    /usr/bin/tum zypper_verify
    /usr/bin/tum zypper_what_provides

    echo -e "\n${GREEN}[*] All tests passed.${RESET}"
}

main
