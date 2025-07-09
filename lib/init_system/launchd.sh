#!/bin/bash
#
# `lib/init_system/launchd.sh`
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

function _run_launchctl()
{
    local ACTION="$1"
    local SERVICE="$2"

    if launchctl "$ACTION" "$SERVICE" >/dev/null 2>&1; then
        echo -e "${GREEN}[*] Success!${RESET}"
        return 0
    else
        echo -e "${RED}[!] Error: launchctl $ACTION $SERVICE failed.${RESET}"
        return 1
    fi
}

function bootstrap_launchctl()      { _run_launchctl "bootstrap"      "$1"; }
function bootout_launchctl()        { _run_launchctl "bootout"        "$1"; }
function enable_launchctl()         { _run_launchctl "enable"         "$1"; }
function disable_launchctl()        { _run_launchctl "disable"        "$1"; }
function uncache_launchctl()        { _run_launchctl "uncache"        "$1"; }
function kickstart_launchctl()      { _run_launchctl "kickstart"      "$1"; }
function attach_launchctl()         { _run_launchctl "attach"         "$1"; }
function debug_launchctl()          { _run_launchctl "debug"          "$1"; }
function kill_launchctl()           { _run_launchctl "kill"           "$1"; }
function blame_launchctl()          { _run_launchctl "blame"          "$1"; }
function print_launchctl()          { _run_launchctl "print"          "$1"; }
function print_cache_launchctl()    { _run_launchctl "print-cache"    "$1"; }
function print_disabled_launchctl() { _run_launchctl "print-disabled" "$1"; }
function plist_launchctl()          { _run_launchctl "plist"          "$1"; }
function procinfo_launchctl()       { _run_launchctl "procinfo"       "$1"; }
function hostinfo_launchctl()       { _run_launchctl "hostinfo"       "$1"; }
function resolveport_launchctl()    { _run_launchctl "resolveport"    "$1"; }
function examine_launchctl()        { _run_launchctl "examine"        "$1"; }
function reboot_launchctl()         { _run_launchctl "reboot"         "$1"; }
function error_launchctl()          { _run_launchctl "error"          "$1"; }
function variant_launchctl()        { _run_launchctl "variant"        "$1"; }
function version_launchctl()        { _run_launchctl "version"        "$1"; }
function load_launchctl()           { _run_launchctl "load"           "$1"; }
function unload_launchctl()         { _run_launchctl "unload"         "$1"; }
function submit_launchctl()         { _run_launchctl "submit"         "$1"; }
function remove_launchctl()         { _run_launchctl "remove"         "$1"; }
function start_launchctl()          { _run_launchctl "start"          "$1"; }
function stop_launchctl()           { _run_launchctl "stop"           "$1"; }
function list_launchctl()           { _run_launchctl "list"           "$1"; }
function setenv_launchctl()         { _run_launchctl "setenv"         "$1"; }
function unsetenv_launchctl()       { _run_launchctl "unsetenv"       "$1"; }
function getenv_launchctl()         { _run_launchctl "getenv"         "$1"; }
function export_launchctl()         { _run_launchctl "export"         "$1"; }
function limit_launchctl()          { _run_launchctl "limit"          "$1"; }
function bsexec_launchctl()         { _run_launchctl "bsexec"         "$1"; }
function asuser_launchctl()         { _run_launchctl "asuser"         "$1"; }
function managerpid_launchctl()     { _run_launchctl "managerpid"     "$1"; }
function manageruid_launchctl()     { _run_launchctl "manageruid"     "$1"; }
function managername_launchctl()    { _run_launchctl "managername"    "$1"; }
function help_launchctl()           { _run_launchctl "help"           "$1"; }

function execute_launchctl()
{
    local COMMAND="$1"
    local SERVICE="$2"

    case "$COMMAND" in
        "bootstrap" | "bootout" | "enable" | "disable" | "uncache" | "kickstart" | "attach" | "debug" | \
        "kill" | "blame" | "print" | "print-cache" | "print-disabled" | "plist" | "procinfo" | "hostinfo" | \
        "resolveport" | "examine" | "reboot" | "error" | "variant" | "version" | "load" | "unload" | "submit" | \
        "remove" | "start" | "stop" | "list" | "setenv" | "unsetenv" | "getenv" | "export" | "limit" | "bsexec" | \
        "asuser" | "managerpid" | "manageruid" | "managername" | "help")
        	;;

        *)
            echo -e "${RED}[!] Error: Unsupported command: $COMMAND${RESET}"
            return 1
            ;;
    esac

    local FUNC_NAME="${COMMAND//-/_}_launchctl"
    "$FUNC_NAME" "$SERVICE"
}
