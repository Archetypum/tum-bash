#!/usr/bin/env bash
#
# `t/test_init_system/test_launchd.sh`
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

declare -r RED="\033[0;31m"
declare -r GREEN="\033[0;32m"
declare -r RESET="\033[0m"

function pass() { echo -e "${GREEN}[PASS] $1${RESET}"; }
function fail() { echo -e "${RED}[FAIL] $1${RESET}"; exit 1; }

function test_wrapper()
{
    local CMD=$1
    local SERVICE="EXAMPLE-SERVICE"

    if OUTPUT=$("$CMD" "$SERVICE" 2>&1); then
        if [[ "$OUTPUT" == *"Success"* ]]; then
            pass "$CMD passed"
        else
            fail "$CMD output mismatch"
        fi
    else
        fail "$CMD returned failure"
    fi
}

function test_execute_valid()
{
    local OUTPUT

    OUTPUT=$(execute_launchctl "start" "EXAMPLE-SERVICE" 2>&1)
    if [[ "$OUTPUT" == *"Success"* ]]; then
        pass "execute_launchctl with valid command"
    else
        fail "execute_launchctl failed on valid command"
    fi
}

function test_execute_invalid()
{
    local OUTPUT

    if OUTPUT=$(execute_launchctl "invalid-cmd" "EXAMPLE-SERVICE" 2>&1); then
        fail "execute_launchctl accepted invalid command"
    else
        if [[ "$OUTPUT" == *"Unknown command"* ]]; then
            pass "execute_launchctl rejected invalid command"
        else
            fail "Unexpected output for invalid command"
        fi
    fi
}

function mock_launchctl()
{
    echo "[MOCK] launchctl $*"
    return 0
}

function launchctl()
{
    mock_launchctl "$@"
}

function main
{
	test_wrapper bootstrap_launchctl
	test_wrapper bootout_launchctl
	test_wrapper enable_launchctl
	test_wrapper disable_launchctl
	test_wrapper uncache_launchctl
	test_wrapper kickstart_launchctl
	test_wrapper attach_launchctl
	test_wrapper debug_launchctl
	test_wrapper kill_launchctl
	test_wrapper blame_launchctl
	test_wrapper print_launchctl
	test_wrapper print_cache_launchctl
	test_wrapper print_disabled_launchctl
	test_wrapper plist_launchctl
	test_wrapper procinfo_launchctl
	test_wrapper hostinfo_launchctl
	test_wrapper resolveport_launchctl
	test_wrapper examine_launchctl
	test_wrapper reboot_launchctl
	test_wrapper error_launchctl
	test_wrapper variant_launchctl
	test_wrapper version_launchctl
	test_wrapper load_launchctl
	test_wrapper unload_launchctl
	test_wrapper submit_launchctl
	test_wrapper remove_launchctl
	test_wrapper start_launchctl
	test_wrapper stop_launchctl
	test_wrapper list_launchctl
	test_wrapper setenv_launchctl
	test_wrapper unsetenv_launchctl
	test_wrapper getenv_launchctl
	test_wrapper export_launchctl
	test_wrapper limit_launchctl
	test_wrapper bsexec_launchctl
	test_wrapper asuser_launchctl
	test_wrapper managerpid_launchctl
	test_wrapper manageruid_launchctl
	test_wrapper managername_launchctl
	test_wrapper help_launchctl
	test_execute_valid
	test_execute_invalid

	echo -e "${GREEN}[*] Success: All tests passed.${RESET}"
}

main
