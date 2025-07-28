#!/bin/bash
#
# `t/test_package_manager/test_pkg.sh`
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
	echo -e "\n[<==] Starting tests for 'pkg'...\n"

	/usr/bin/tum pkg
	/usr/bin/tum freebsd_pkg_add
	/usr/bin/tum pkg_alias
	/usr/bin/tum pkg_all_depends
	/usr/bin/tum pkg_annotate
	/usr/bin/tum pkg_annotations
	/usr/bin/tum pkg_audit
	/usr/bin/tum pkg_autoremove
	/usr/bin/tum pkg_backup
	/usr/bin/tum pkg_bootstrap
	/usr/bin/tum pkg_build_depends
	/usr/bin/tum pkg_check
	/usr/bin/tum pkg_cinfo
	/usr/bin/tum pkg_clean
	/usr/bin/tum pkg_comment
	/usr/bin/tum pkg_convert
	/usr/bin/tum freebsd_pkg_create
	/usr/bin/tum pkg_csearch
	/usr/bin/tum freebsd_pkg_delete
	/usr/bin/tum pkg_desc
	/usr/bin/tum pkg_download
	/usr/bin/tum pkg_fetch
	/usr/bin/tum pkg_help
	/usr/bin/tum pkg_iinfo
	/usr/bin/tum freebsd_pkg_info
	/usr/bin/tum pkg_install
	/usr/bin/tum pkg_isearch
	/usr/bin/tum pkg_leaf
	/usr/bin/tum pkg_list
	/usr/bin/tum pkg_lock
	/usr/bin/tum pkg_noauto
	/usr/bin/tum pkg_options
	/usr/bin/tum pkg_origin
	/usr/bin/tum pkg_orphans
	/usr/bin/tum pkg_plugins
	/usr/bin/tum pkg_prime_list
	/usr/bin/tum pkg_prime_origins
	/usr/bin/tum pkg_provided_depends
	/usr/bin/tum pkg_query
	/usr/bin/tum pkg_rall_depends
	/usr/bin/tum pkg_raw
	/usr/bin/tum pkg_rcomment
	/usr/bin/tum pkg_rdesc
	/usr/bin/tum pkg_register
	/usr/bin/tum pkg_remove
	/usr/bin/tum pkg_repo
	/usr/bin/tum pkg_required_depends
	/usr/bin/tum pkg_roptions
	/usr/bin/tum pkg_rquery
	/usr/bin/tum pkg_runmaintained
	/usr/bin/tum pkg_search
	/usr/bin/tum pkg_set
	/usr/bin/tum pkg_shared_depends
	/usr/bin/tum pkg_shell
	/usr/bin/tum pkg_shlib
	/usr/bin/tum pkg_show
	/usr/bin/tum pkg_size
	/usr/bin/tum pkg_stats
	/usr/bin/tum pkg_unlock
	/usr/bin/tum pkg_unmaintained
	/usr/bin/tum pkg_update
	/usr/bin/tum pkg_updating
	/usr/bin/tum pkg_upgrade
	/usr/bin/tum pkg_version
	/usr/bin/tum pkg_which

	echo -e "\n${GREEN}[*] All tests passed.${RESET}"
}

main
