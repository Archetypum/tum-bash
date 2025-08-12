#!/usr/bin/env bash
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
# You should have received a copy of the GNU Lesser General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>

#
# Disable Unicode for speed:
#
LC_ALL=C
LANG=C

declare -r RED="\033[0;31m"
declare -r GREEN="\033[0;32m"
declare -r RESET="\033[0m"

_run_systemctl()
{
    local action="$1"
    local service="$2"

    systemctl "$action" "$service" >/dev/null 2>&1 &&
        { printf "${GREEN}[*] Success!${RESET}\n"; return 0; } ||
        { printf "${RED}[!] Error: 'systemctl $action $service' failed.${RESET}\n"; return 1; }
}

add_requires_systemctl()           { _run_systemctl "add-requires"                 "$1"; }
add_wants_systemctl()              { _run_systemctl "add-wants"                    "$1"; }
bind_systemctl()                   { _run_systemctl "bind"                         "$1"; }
cancel_systemctl()                 { _run_systemctl "cancel"                       "$1"; }
cat_systemctl()                    { _run_systemctl "cat"                          "$1"; }
condreload_systemctl()             { _run_systemctl "condreload"                   "$1"; }
condrestart_systemctl()            { _run_systemctl "condrestart"                  "$1"; }
condstop_systemctl()               { _run_systemctl "condstop"                     "$1"; }
daemon_reexec_systemctl()          { _run_systemctl "daemon-reexec"                "$1"; }
daemon_reload_systemctl()          { _run_systemctl "daemon-reload"                "$1"; }
default_systemctl()                { _run_systemctl "default"                      "$1"; }
disable_systemctl()                { _run_systemctl "disable"                      "$1"; }
edit_systemctl()                   { _run_systemctl "edit"                         "$1"; }
emergency_systemctl()              { _run_systemctl "emergency"                    "$1"; }
enable_systemctl()                 { _run_systemctl "enable"                       "$1"; }
exit_systemctl()                   { _run_systemctl "exit"                         "$1"; }
force_reload_systemctl()           { _run_systemctl "force-reload"                 "$1"; }
get_default_systemctl()            { _run_systemctl "get-default"                  "$1"; }
halt_systemctl()                   { _run_systemctl "halt"                         "$1"; }
help_systemctl()                   { _run_systemctl "help"                         "$1"; }
hibernate_systemctl()              { _run_systemctl "hibernate"                    "$1"; }
hybrid_sleep_systemctl()           { _run_systemctl "hybrid-sleep"                 "$1"; }
import_environment_systemctl()     { _run_systemctl "import-environment"           "$1"; }
is_active_systemctl()              { _run_systemctl "is-active"                    "$1"; }
is_enabled_systemctl()             { _run_systemctl "is-enabled"                   "$1"; }
is_failed_systemctl()              { _run_systemctl "is-failed"                    "$1"; }
isolate_systemctl()                { _run_systemctl "isolate"                      "$1"; }
is_system_running_systemctl()      { _run_systemctl "is-system-running"            "$1"; }
kexec_systemctl()                  { _run_systemctl "kexec"                        "$1"; }
kill_systemctl()                   { _run_systemctl "kill"                         "$1"; }
link_systemctl()                   { _run_systemctl "link"                         "$1"; }
list_automounts_systemctl()        { _run_systemctl "list-automounts"              "$1"; }
list_dependencies_systemctl()      { _run_systemctl "list-dependencies"            "$1"; }
list_jobs_systemctl()              { _run_systemctl "list-jobs"                    "$1"; }
list_machines_systemctl()          { _run_systemctl "list-machines"                "$1"; }
list_sockets_systemctl()           { _run_systemctl "list-sockets"                 "$1"; }
list_timers_systemctl()            { _run_systemctl "list-timers"                  "$1"; }
list_unit_files_systemctl()        { _run_systemctl "list-unit-files"              "$1"; }
list_units_systemctl()             { _run_systemctl "list-units"                   "$1"; }
log_level_systemctl()              { _run_systemctl "log-level"                    "$1"; }
log_target_systemctl()             { _run_systemctl "log-target"                   "$1"; }
mask_systemctl()                   { _run_systemctl "mask"                         "$1"; }
mount_image_systemctl()            { _run_systemctl "mount-image"                  "$1"; }
poweroff_systemctl()               { _run_systemctl "poweroff"                     "$1"; }
preset_systemctl()                 { _run_systemctl "preset"                       "$1"; }
preset_all_systemctl()             { _run_systemctl "preset-all"                   "$1"; }
reboot_systemctl()                 { _run_systemctl "reboot"                       "$1"; }
reenable_systemctl()               { _run_systemctl "reenable"                     "$1"; }
reload_systemctl()                 { _run_systemctl "reload"                       "$1"; }
reload_or_restart_systemctl()      { _run_systemctl "reload-or-restart"            "$1"; }
rescue_systemctl()                 { _run_systemctl "rescue"                       "$1"; }
reset_failed_systemctl()           { _run_systemctl "reset-failed"                 "$1"; }
restart_systemctl()                { _run_systemctl "restart"                      "$1"; }
revert_systemctl()                 { _run_systemctl "revert"                       "$1"; }
service_log_level_systemctl()      { _run_systemctl "service-log-level"            "$1"; }
service_log_target_systemctl()     { _run_systemctl "service-log-target"           "$1"; }
service_watchdogs_systemctl()      { _run_systemctl "service-watchdogs"            "$1"; }
set_default_systemctl()            { _run_systemctl "set-default"                  "$1"; }
set_environment_systemctl()        { _run_systemctl "set-environment"              "$1"; }
property_systemctl()               { _run_systemctl "property"                     "$1"; }
show_systemctl()                   { _run_systemctl "show"                         "$1"; }
show_environment_systemctl()       { _run_systemctl "show-environment"             "$1"; }
start_systemctl()                  { _run_systemctl "start"                        "$1"; }
status_systemctl()                 { _run_systemctl "status"                       "$1"; }
stop_systemctl()                   { _run_systemctl "stop"                         "$1"; }
suspend_systemctl()                { _run_systemctl "suspend"                      "$1"; }
suspend_then_hibernate_systemctl() { _run_systemctl "suspend-then-hibernate"       "$1"; }
switch_root_systemctl()            { _run_systemctl "switch-root"                  "$1"; }
try_reload_or_restart_systemctl()  { _run_systemctl "try-reload-or-restart"        "$1"; }
try_restart_systemctl()            { _run_systemctl "try-restart"                  "$1"; }
unmask_systemctl()                 { _run_systemctl "unmask"                       "$1"; }
unset_environment_systemctl()      { _run_systemctl "unset-environment"            "$1"; }

execute_systemctl()
{
    local command="$1"
    local service="$2"

    case "$command" in
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
        	printf "${RED}[!] Error: Unsupported command: '$command'.${RESET}\n"
        	return 1
        	;;
    esac

    local func_name="${command//-/_}_systemctl"
    "$func_name" "$service"
}
