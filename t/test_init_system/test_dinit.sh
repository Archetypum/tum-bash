#!/usr/bin/env bash
#
# `t/test_init_system/test_dinit.sh`
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

function test_wrapper()
{
    local CMD=$1
    local SERVICE="DUMMY.SERVICE"

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

    OUTPUT=$(execute_dinitctl "start" "DUMMY.SERVICE" 2>&1)
    if [[ "$OUTPUT" == *"Success"* ]]; then
        pass "execute_dinitctl with valid command"
    else
        fail "execute_dinitctl failed on valid command"
    fi
}

function test_execute_invalid()
{
    local OUTPUT

    if OUTPUT=$(execute_dinitctl "invalid-cmd" "DUMMY.SERVICE" 2>&1); then
        fail "execute_dinitctl accepted invalid command"
    else
        if [[ "$OUTPUT" == *"Unknown command"* ]]; then
            pass "execute_dinitctl rejected invalid command"
        else
            fail "Unexpected output for invalid command"
        fi
    fi
}

function mock_dinitctl()
{
    echo "[MOCK] dinitctl $*"
    return 0
}

function dinitctl()
{
    mock_dinitctl "$@"
}

function main()
{
	test_wrapper start_dinitctl
	test_wrapper stop_dinitctl
	test_wrapper status_dinitctl
	test_wrapper is_started_dinitctl
	test_wrapper is_failed_dinitctl
	test_wrapper restart_dinitctl
	test_wrapper wake_dinitctl
	test_wrapper release_dinitctl
	test_wrapper unpin_dinitctl
	test_wrapper unload_dinitctl
	test_wrapper reload_dinitctl
	test_wrapper list_dinitctl
	test_wrapper shutdown_dinitctl
	test_wrapper add_dep_dinitctl
	test_wrapper rm_dep_dinitctl
	test_wrapper enable_dinitctl
	test_wrapper disable_dinitctl
	test_wrapper trigger_dinitctl
	test_wrapper untrigger_dinitctl
	test_wrapper setenv_dinitctl
	test_wrapper unsetenv_dinitctl
	test_wrapper catalog_dinitctl
	test_wrapper signal_dinitctl
	test_execute_valid
	test_execute_invalid

	echo -e "${GREEN}[*] Success: All tests passed.${RESET}"
}

main
