#!/bin/bash

function _run_rc_service()
{
    local ACTION="$1"
    local SERVICE="$2"

    if rc_service "$SERVICE" "$ACTION" >/dev/null 2>&1; then
        echo -e "${GREEN}[*] Success!${RESET}"
        return 0
    else
        echo -e "${RED}[!] Error: rc_service $SERVICE $ACTION failed.${RESET}"
        return 1
    fi
}

function start_rc_service()        { _run_rc_service "start"        "$1"; }
function stop_rc_service()         { _run_rc_service "stop"         "$1"; }
function reload_rc_service()       { _run_rc_service "reload"       "$1"; }
function force_reload_rc_service() { _run_rc_service "force-reload" "$1"; }
function restart_rc_service()      { _run_rc_service "restart"      "$1"; }
function try_restart_rc_service()  { _run_rc_service "try-restart"  "$1"; }
function status_rc_service()       { _run_rc_service "status"       "$1"; }

function execute_rc_service()
{
    local COMMAND="$1"
    local SERVICE="$2"
    local FUNC_NAME="${COMMAND//-/_}_rc_service"

    if declare -f "$FUNC_NAME" >/dev/null 2>&1; then
        $FUNC_NAME "$SERVICE"
        return $?
    else
        echo -e "${RED}[!] Error: Unknown command: $COMMAND${RESET}"
        return 1
    fi
}

