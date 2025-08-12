#!/usr/bin/env bash
#
# `t/test_init_system/test_unix.sh`
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

set -e
source /usr/bin/tum

function pass() { echo -e "${GREEN}[PASS] $1${RESET}"; }
function fail() { echo -e "${RED}[FAIL] $1${RESET}"; exit 1; }

function test_base_check()
{
	local FUNC_NAME="$1"
	local KNOWN="$2"
	local UNKNOWN="notadistribution"

	if "$FUNC_NAME" "$KNOWN" "$KNOWN"; then
		pass "$FUNC_NAME returns true for known distro: $KNOWN"
	else
		fail "$FUNC_NAME failed for known distro: $KNOWN"
	fi

	if "$FUNC_NAME" "$UNKNOWN" "$KNOWN"; then
		fail "$FUNC_NAME returned true for unknown distro: $UNKNOWN"
	else
		pass "$FUNC_NAME returns false for unknown distro: $UNKNOWN"
	fi
}

function test_get_user_distro()
{
	local DISTRO
	DISTRO=$(get_user_distro)

	if [[ -n "$DISTRO" ]]; then
		pass "get_user_distro returned non-empty: $DISTRO"
	else
		fail "get_user_distro returned empty"
	fi
}

function test_get_init_system()
{
	local INIT
	INIT=$(get_init_system)

	if [[ -n "$INIT" ]]; then
		pass "get_init_system returned: $INIT"
	else
		fail "get_init_system returned empty"
	fi
}

function test_get_pid1_comm()
{
	local COMM
	COMM=$(get_pid1_comm)

	if [[ -n "$COMM" ]]; then
		pass "get_pid1_comm returned: $COMM"
	else
		fail "get_pid1_comm returned empty"
	fi
}

function main()
{
	test_base_check is_debian_based debian
	test_base_check is_arch_based arch
	test_base_check is_alpine_based alpine
	test_base_check is_gentoo_based gentoo
	test_base_check is_void_based void
	test_base_check is_dragora_based dragora
	test_base_check is_slackware_based slackware
	test_base_check is_redhat_based fedora
	test_base_check is_guix_based guix
	test_base_check is_freebsd_based freebsd
	test_base_check is_openbsd_based openbsd
	test_base_check is_netbsd_based netbsd
	test_base_check is_solaris_illumos_based solaris
	test_base_check macos_based macos

	test_get_user_distro
	test_get_init_system
	test_get_pid1_comm

	echo -e "\n${GREEN}[*] Success: All tests passed.${RESET}"
}

main
