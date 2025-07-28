#!/bin/bash
#
# `t/test_init_system/test_systemd.sh`
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

    OUTPUT=$(execute_systemctl "start" "EXAMPLE-SERVICE" 2>&1)
    if [[ "$OUTPUT" == *"Success"* ]]; then
        pass "execute_systemctl with valid command"
    else
        fail "execute_systemctl failed on valid command"
    fi
}

function test_execute_invalid()
{
    local OUTPUT

    if OUTPUT=$(execute_systemctl "invalid-cmd" "EXAMPLE-SERVICE" 2>&1); then
        fail "execute_systemctl accepted invalid command"
    else
        if [[ "$OUTPUT" == *"Unknown command"* ]]; then
            pass "execute_systemctl rejected invalid command"
        else
            fail "Unexpected output for invalid command"
        fi
    fi
}

function mock_systemctl()
{
    echo "[MOCK] systemctl $*"
    return 0
}

function systemctl()
{
    mock_systemctl "$@"
}

function main()
{
	test_wrapper add_requires_systemctl
	test_wrapper add_wants_systemctl
	test_wrapper bind_systemctl
	test_wrapper cancel_systemctl
	test_wrapper cat_systemctl
	test_wrapper condreload_systemctl
	test_wrapper condrestart_systemctl
	test_wrapper condstop_systemctl
	test_wrapper daemon_reexec_systemctl
	test_wrapper daemon_reload_systemctl
	test_wrapper default_systemctl
	test_wrapper disable_systemctl
	test_wrapper edit_systemctl
	test_wrapper emergency_systemctl
	test_wrapper enable_systemctl
	test_wrapper exit_systemctl
	test_wrapper force_reload_systemctl
	test_wrapper get_default_systemctl
	test_wrapper halt_systemctl
	test_wrapper help_systemctl
	test_wrapper hibernate_systemctl
	test_wrapper hybrid_sleep_systemctl
	test_wrapper import_environment_systemctl
	test_wrapper is_active_systemctl
	test_wrapper is_enabled_systemctl
	test_wrapper is_failed_systemctl
	test_wrapper isolate_systemctl
	test_wrapper is_system_running_systemctl
	test_wrapper kexec_systemctl
	test_wrapper kill_systemctl
	test_wrapper link_systemctl
	test_wrapper list_automounts_systemctl
	test_wrapper list_dependencies_systemctl
	test_wrapper list_jobs_systemctl
	test_wrapper list_machines_systemctl
	test_wrapper list_sockets_systemctl
	test_wrapper list_timers_systemctl
	test_wrapper list_unit_files_systemctl
	test_wrapper list_units_systemctl
	test_wrapper log_level_systemctl
	test_wrapper log_target_systemctl
	test_wrapper mask_systemctl
	test_wrapper mount_image_systemctl
	test_wrapper poweroff_systemctl
	test_wrapper preset_systemctl
	test_wrapper preset_all_systemctl
	test_wrapper reboot_systemctl
	test_wrapper reenable_systemctl
	test_wrapper reload_systemctl
	test_wrapper reload_or_restart_systemctl
	test_wrapper rescue_systemctl
	test_wrapper reset_failed_systemctl
	test_wrapper restart_systemctl
	test_wrapper revert_systemctl
	test_wrapper service_log_level_systemctl
	test_wrapper service_log_target_systemctl
	test_wrapper service_watchdogs_systemctl
	test_wrapper set_default_systemctl
	test_wrapper set_environment_systemctl
	test_wrapper property_systemctl
	test_wrapper show_systemctl
	test_wrapper show_environment_systemctl
	test_wrapper start_systemctl
	test_wrapper status_systemctl
	test_wrapper stop_systemctl
	test_wrapper suspend_systemctl
	test_wrapper suspend_then_hibernate_systemctl
	test_wrapper switch_root_systemctl
	test_wrapper try_reload_or_restart_systemctl
	test_wrapper try_restart_systemctl
	test_wrapper unmask_systemctl
	test_wrapper unset_environment_systemctl
	test_execute_valid
	test_execute_invalid

	echo -e "${GREEN}[*] Success: All tests passed.${RESET}"
}

main
