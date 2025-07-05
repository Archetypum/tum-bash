#!/bin/bash

declare -r RED="\033[0;31m"
declare -r GREEN="\033[0;32m"
declare -r RESET="\033[0m"

function execute()
{
    local CMD=("$@")
    echo -e "${GREEN}[<==] Executing '${CMD[*]}'...${RESET}"
    if "${CMD[@]}"; then
        echo -e "${GREEN}[*] Success!${RESET}"
        return 0
    else
        echo -e "${RED}[!] Error: Failed to execute: '${CMD[*]}'.${RESET}"
        return 1
    fi
}

function trizen()          { execute trizen             "$@"; }
function trizen_sync()     { execute trizen --sync      "$@"; }
function trizen_comments() { execute trizen --comments  "$@"; }
function trizen_get()      { execute trizen --get       "$@"; }
function trizen_remove()   { execute trizen --remove    "$@"; }
function trizen_query()    { execute trizen --query     "$@"; }
function trizen_files()    { execute trizen --files     "$@"; }
function trizen_database() { execute trizen --database  "$@"; }
function trizen_deptest()  { execute trizen --deptest   "$@"; }
function trizen_upgrade()  { execute trizen --upgrade   "$@"; }

