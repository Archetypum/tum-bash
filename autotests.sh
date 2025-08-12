#!/usr/bin/env bash
#
# `autotests.sh`
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

#
# Disable Unicode for speed:
#
LC_ALL=C
LANG=C

main()
{
	printf "[<==] Starting autotests for UNIX...\n"
	sleep 1

	t/test_unix.sh

    printf "\n[<==] Starting autotests for Initialization Systems...\n"
    sleep 1

    t/test_init_system/test_dinit.sh
    t/test_init_system/test_launchd.sh
    t/test_init_system/test_openrc.sh
    t/test_init_system/test_runit.sh
    t/test_init_system/test_s6.sh
    t/test_init_system/test_systemd.sh
    t/test_init_system/test_sysvinit.sh

    printf "\n[<==] Starting autotests for Package Managers...\n"
    sleep 1

	t/test_package_manager/test_apk.sh
	t/test_package_manager/test_apt.sh
	t/test_package_manager/test_apt_cache.sh
	t/test_package_manager/test_apt_cdrom.sh
	t/test_package_manager/test_apt_config.sh
	t/test_package_manager/test_apt_extracttemplates.sh
	t/test_package_manager/test_apt_get.sh
	t/test_package_manager/test_apt_listchanges.sh
	t/test_package_manager/test_apt_mark.sh
	t/test_package_manager/test_apt_sortpkgs.sh
	t/test_package_manager/test_aptitude.sh
	t/test_package_manager/test_aptitude_create_state_bundle.sh
	t/test_package_manager/test_aptitude_run_state_bundle.sh
	t/test_package_manager/test_dnf.sh
	t/test_package_manager/test_dpkg.sh
	t/test_package_manager/test_guix.sh
	t/test_package_manager/test_homebrew.sh
	t/test_package_manager/test_pacman.sh
	t/test_package_manager/test_pamac.sh
	t/test_package_manager/test_pkg.sh
	t/test_package_manager/test_pkg_add.sh
	t/test_package_manager/test_pkg_create.sh
	t/test_package_manager/test_pkg_info.sh
	t/test_package_manager/test_pkgin.sh
	t/test_package_manager/test_portage.sh
	t/test_package_manager/test_qi.sh
	t/test_package_manager/test_slackpkg.sh
	t/test_package_manager/test_trizen.sh
	t/test_package_manager/test_xbps_install.sh
	t/test_package_manager/test_xbps_query.sh
	t/test_package_manager/test_xbps_remove.sh
	t/test_package_manager/test_yay.sh
	t/test_package_manager/test_yum.sh
	t/test_package_manager/test_zypper.sh
	t/test_package_manager/test_zypper_log.sh

    printf "\n[*] Finished autotests.\n"
}

main
