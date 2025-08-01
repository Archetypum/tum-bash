#!/bin/bash
#
# `t/test_init_system/test_s6.sh`
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

    OUTPUT=$(execute_s6_rc "start" "EXAMPLE-SERVICE" 2>&1)
    if [[ "$OUTPUT" == *"Success"* ]]; then
        pass "execute_s6_rc with valid command"
    else
        fail "execute_s6_rc failed on valid command"
    fi
}

function test_execute_invalid()
{
    local OUTPUT

    if OUTPUT=$(execute_s6_rc "invalid-cmd" "EXAMPLE-SERVICE" 2>&1); then
        fail "execute_s6_rc accepted invalid command"
    else
        if [[ "$OUTPUT" == *"Unknown command"* ]]; then
            pass "execute_s6_rc rejected invalid command"
        else
            fail "Unexpected output for invalid command"
        fi
    fi
}

function mock_s6_rc()
{
    echo "[MOCK] s6-rc $*"
    return 0
}

function s6-rc()
{
    mock_s6_rc "$@"
}

function main()
{
	test_wrapper help_s6_rc
	test_wrapper list_s6_rc
	test_wrapper listall_s6_rc
	test_wrapper diff_s6_rc
	test_wrapper start_s6_rc
	test_wrapper stop_s6_rc
	test_wrapper change_s6_rc
	test_execute_valid
	test_execute_invalid

	echo -e "${GREEN}[*] Success: All tests passed.${RESET}"
}

main
