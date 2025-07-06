#!/bin/bash
#
# `t/test_init_system/test_runit.sh`
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

    OUTPUT=$(execute_sv "start" "EXAMPLE-SERVICE" 2>&1)
    if [[ "$OUTPUT" == *"Success"* ]]; then
        pass "execute_sv with valid command"
    else
        fail "execute_sv failed on valid command"
    fi
}

function test_execute_invalid()
{
    local OUTPUT

    if OUTPUT=$(execute_sv "invalid-cmd" "EXAMPLE-SERVICE" 2>&1); then
        fail "execute_sv accepted invalid command"
    else
        if [[ "$OUTPUT" == *"Unknown command"* ]]; then
            pass "execute_sv rejected invalid command"
        else
            fail "Unexpected output for invalid command"
        fi
    fi
}

function mock_sv()
{
    echo "[MOCK] sv $*"
    return 0
}

function sv()
{
    mock_sv "$@"
}

function main()
{
	test_wrapper status_sv
	test_wrapper up_sv
	test_wrapper down_sv
	test_wrapper once_sv
	test_wrapper pause_sv
	test_wrapper cont_sv
	test_wrapper hup_sv
	test_wrapper alarm_sv
	test_wrapper interrupt_sv
	test_wrapper quit_sv
	test_wrapper one_sv
	test_wrapper two_sv
	test_wrapper term_sv
	test_wrapper kill_sv
	test_wrapper exit_sv
	test_wrapper start_sv
	test_wrapper stop_sv
	test_wrapper reload_sv
	test_wrapper restart_sv
	test_wrapper shutdown_sv
	test_wrapper force_stop_sv
	test_wrapper force_restart_sv
	test_wrapper force_shutdown_sv
	test_wrapper try_restart_sv
	test_wrapper check_sv
	test_execute_valid
	test_execute_invalid

	echo -e "${GREEN}[*] Success: All tests passed.${RESET}"
}

main
