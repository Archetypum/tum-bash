#!/bin/bash

declare -r RED="\033[0;31m"
declare -r GREEN="\033[0;32m"
declare -r RESET="\033[0m"

function _run_service()
{
    local ACTION="$1"
    local SERVICE="$2"

    if service "$SERVICE" "$ACTION" >/dev/null 2>&1; then
        echo -e "${GREEN}[*] Success!${RESET}"
        return 0
    else
        echo -e "${RED}[!] Error: service $SERVICE $ACTION failed.${RESET}"
        return 1
    fi
}

function start_service()        { _run_service "start"        "$1"; }
function stop_service()         { _run_service "stop"         "$1"; }
function force_reload_service() { _run_service "force-reload" "$1"; }
function restart_service()      { _run_service "restart"      "$1"; }
function status_service()       { _run_service "status"       "$1"; }

function execute_service()
{
    local COMMAND="$1"
    local SERVICE="$2"
    local FUNC_NAME="${COMMAND//-/_}_service"

    if declare -f "$FUNC_NAME" >/dev/null 2>&1; then
        $FUNC_NAME "$SERVICE"
        return $?
    else
        echo -e "${RED}[!] Error: Unknown command: $COMMAND${RESET}"
        return 1
    fi
}

