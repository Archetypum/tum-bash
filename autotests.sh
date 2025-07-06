#!/bin/bash
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
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>

function main()
{
	echo -e "[<==] Starting autotests for UNIX...\n"
	sleep 1

	t/test_unix.sh

    echo -e "[<==] Starting autotests for Initialization Systems...\n"
    sleep 1

    t/test_init_system/test_dinit.sh
    t/test_init_system/test_launchd.sh
    t/test_init_system/test_openrc.sh
    t/test_init_system/test_runit.sh
    t/test_init_system/test_s6.sh
    t/test_init_system/test_systemd.sh
    t/test_init_system/test_sysvinit.sh

    echo -e "[<==] Starting autotests for Package Managers...\n"
    sleep 1

    echo -e "\n[*] Finished autotests."
}

main
