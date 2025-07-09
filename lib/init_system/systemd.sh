#!/bin/bash
#
# `lib/init_system/systemd.sh`
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

declare -r RED="\033[0;31m"
declare -r GREEN="\033[0;32m"
declare -r RESET="\033[0m"

function _run_systemctl()
{
    local ACTION="$1"
    local SERVICE="$2"

    if systemctl "$ACTION" "$SERVICE" >/dev/null 2>&1; then
        echo -e "${GREEN}[*] Success!${RESET}"
        return 0
    else
        echo -e "${RED}[!] Error: systemctl $ACTION $SERVICE failed.${RESET}"
        return 1
    fi
}

function add_requires_systemctl()           { _run_systemctl "add-requires"                 "$1"; }
function add_wants_systemctl()              { _run_systemctl "add-wants"                    "$1"; }
function bind_systemctl()                   { _run_systemctl "bind"                         "$1"; }
function cancel_systemctl()                 { _run_systemctl "cancel"                       "$1"; }
function cat_systemctl()                    { _run_systemctl "cat"                          "$1"; }
function condreload_systemctl()             { _run_systemctl "condreload"                   "$1"; }
function condrestart_systemctl()            { _run_systemctl "condrestart"                  "$1"; }
function condstop_systemctl()               { _run_systemctl "condstop"                     "$1"; }
function daemon_reexec_systemctl()          { _run_systemctl "daemon-reexec"                "$1"; }
function daemon_reload_systemctl()          { _run_systemctl "daemon-reload"                "$1"; }
function default_systemctl()                { _run_systemctl "default"                      "$1"; }
function disable_systemctl()                { _run_systemctl "disable"                      "$1"; }
function edit_systemctl()                   { _run_systemctl "edit"                         "$1"; }
function emergency_systemctl()              { _run_systemctl "emergency"                    "$1"; }
function enable_systemctl()                 { _run_systemctl "enable"                       "$1"; }
function exit_systemctl()                   { _run_systemctl "exit"                         "$1"; }
function force_reload_systemctl()           { _run_systemctl "force-reload"                 "$1"; }
function get_default_systemctl()            { _run_systemctl "get-default"                  "$1"; }
function halt_systemctl()                   { _run_systemctl "halt"                         "$1"; }
function help_systemctl()                   { _run_systemctl "help"                         "$1"; }
function hibernate_systemctl()              { _run_systemctl "hibernate"                    "$1"; }
function hybrid_sleep_systemctl()           { _run_systemctl "hybrid-sleep"                 "$1"; }
function import_environment_systemctl()     { _run_systemctl "import-environment"           "$1"; }
function is_active_systemctl()              { _run_systemctl "is-active"                    "$1"; }
function is_enabled_systemctl()             { _run_systemctl "is-enabled"                   "$1"; }
function is_failed_systemctl()              { _run_systemctl "is-failed"                    "$1"; }
function isolate_systemctl()                { _run_systemctl "isolate"                      "$1"; }
function is_system_running_systemctl()      { _run_systemctl "is-system-running"            "$1"; }
function kexec_systemctl()                  { _run_systemctl "kexec"                        "$1"; }
function kill_systemctl()                   { _run_systemctl "kill"                         "$1"; }
function link_systemctl()                   { _run_systemctl "link"                         "$1"; }
function list_automounts_systemctl()        { _run_systemctl "list-automounts"              "$1"; }
function list_dependencies_systemctl()      { _run_systemctl "list-dependencies"            "$1"; }
function list_jobs_systemctl()              { _run_systemctl "list-jobs"                    "$1"; }
function list_machines_systemctl()          { _run_systemctl "list-machines"                "$1"; }
function list_sockets_systemctl()           { _run_systemctl "list-sockets"                 "$1"; }
function list_timers_systemctl()            { _run_systemctl "list-timers"                  "$1"; }
function list_unit_files_systemctl()        { _run_systemctl "list-unit-files"              "$1"; }
function list_units_systemctl()             { _run_systemctl "list-units"                   "$1"; }
function log_level_systemctl()              { _run_systemctl "log-level"                    "$1"; }
function log_target_systemctl()             { _run_systemctl "log-target"                   "$1"; }
function mask_systemctl()                   { _run_systemctl "mask"                         "$1"; }
function mount_image_systemctl()            { _run_systemctl "mount-image"                  "$1"; }
function poweroff_systemctl()               { _run_systemctl "poweroff"                     "$1"; }
function preset_systemctl()                 { _run_systemctl "preset"                       "$1"; }
function preset_all_systemctl()             { _run_systemctl "preset-all"                   "$1"; }
function reboot_systemctl()                 { _run_systemctl "reboot"                       "$1"; }
function reenable_systemctl()               { _run_systemctl "reenable"                     "$1"; }
function reload_systemctl()                 { _run_systemctl "reload"                       "$1"; }
function reload_or_restart_systemctl()      { _run_systemctl "reload-or-restart"            "$1"; }
function rescue_systemctl()                 { _run_systemctl "rescue"                       "$1"; }
function reset_failed_systemctl()           { _run_systemctl "reset-failed"                 "$1"; }
function restart_systemctl()                { _run_systemctl "restart"                      "$1"; }
function revert_systemctl()                 { _run_systemctl "revert"                       "$1"; }
function service_log_level_systemctl()      { _run_systemctl "service-log-level"            "$1"; }
function service_log_target_systemctl()     { _run_systemctl "service-log-target"           "$1"; }
function service_watchdogs_systemctl()      { _run_systemctl "service-watchdogs"            "$1"; }
function set_default_systemctl()            { _run_systemctl "set-default"                  "$1"; }
function set_environment_systemctl()        { _run_systemctl "set-environment"              "$1"; }
function property_systemctl()               { _run_systemctl "property"                     "$1"; }
function show_systemctl()                   { _run_systemctl "show"                         "$1"; }
function show_environment_systemctl()       { _run_systemctl "show-environment"             "$1"; }
function start_systemctl()                  { _run_systemctl "start"                        "$1"; }
function status_systemctl()                 { _run_systemctl "status"                       "$1"; }
function stop_systemctl()                   { _run_systemctl "stop"                         "$1"; }
function suspend_systemctl()                { _run_systemctl "suspend"                      "$1"; }
function suspend_then_hibernate_systemctl() { _run_systemctl "suspend-then-hibernate"       "$1"; }
function switch_root_systemctl()            { _run_systemctl "switch-root"                  "$1"; }
function try_reload_or_restart_systemctl()  { _run_systemctl "try-reload-or-restart"        "$1"; }
function try_restart_systemctl()            { _run_systemctl "try-restart"                  "$1"; }
function unmask_systemctl()                 { _run_systemctl "unmask"                       "$1"; }
function unset_environment_systemctl()      { _run_systemctl "unset-environment"            "$1"; }

function execute_systemctl()
{
    local COMMAND="$1"
    local SERVICE="$2"

    case "$COMMAND" in
        "add-requires" | "add-wants" | "bind" | "cancel" | "cat" | "condreload" | "condrestart" | "condstop" | \
        "daemon-reexec" | "daemon-reload" | "default" | "disable" | "edit" | "emergency" | "enable" | "exit" | \
        "force-reload" | "get-default" | "halt" | "help" | "hibernate" | "hybrid-sleep" | "import-environment" | \
        "is-active" | "is-enabled" | "is-failed" | "isolate" | "is-system-running" | "kexec" | "kill" | "link" | \
        "list-automounts" | "list-dependencies" | "list-jobs" | "list-machines" | "list-sockets" | "list-timers" | \
        "list-unit-files" | "list-units" | "log-level" | "log-target" | "mask" | "mount-image" | "poweroff" | \
        "preset" | "preset-all" | "reboot" | "reenable" | "reload" | "reload-or-restart" | "rescue" | "reset-failed" | \
        "restart" | "revert" | "service-log-level" | "service-log-target" | "service-watchdogs" | "set-default" | \
        "set-environment" | "property" | "show" | "show-environment" | "start" | "status" | "stop" | "suspend" | \
        "suspend-then-hibernate" | "switch-root" | "try-reload-or-restart" | "try-restart" | "unmask" | "unset-environment")
        	;;

    	*)
        	echo -e "${RED}[!] Error: Unsupported command: $COMMAND${RESET}"
        	return 1
        	;;
    esac

    local FUNC_NAME="${COMMAND//-/_}_systemctl"
    "$FUNC_NAME" "$SERVICE"
}
