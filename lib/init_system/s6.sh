#!/bin/bash

function _run_s6_rc()
{
    local ACTION="$1"
    local SERVICE="$2"

    if s6-rc "$ACTION" "$SERVICE" >/dev/null 2>&1; then
        echo -e "${GREEN}[*] Success!${RESET}"
        return 0
    else
        echo -e "${RED}[!] Error: s6-rc $ACTION $SERVICE failed.${RESET}"
        return 1
    fi
}

function help_s6_rc()     { _run_s6_rc "help"     "$1"; }
function list_s6_rc()     { _run_s6_rc "list"     "$1"; }
function listall_s6_rc()  { _run_s6_rc "listall"  "$1"; }
function diff_s6_rc()     { _run_s6_rc "diff"     "$1"; }
function start_s6_rc()    { _run_s6_rc "start"    "$1"; }
function stop_s6_rc()     { _run_s6_rc "stop"     "$1"; }
function change_s6_rc()   { _run_s6_rc "change"   "$1"; }

function execute_s6_rc()
{
    local COMMAND="$1"
    local SERVICE="$2"
    local FUNC_NAME="${COMMAND//-/_}_s6_rc"

    if declare -f "$FUNC_NAME" >/dev/null 2>&1; then
        $FUNC_NAME "$SERVICE"
        return $?
    else
        echo -e "${RED}[!] Error: Unknown command: $COMMAND${RESET}"
        return 1
    fi
}

