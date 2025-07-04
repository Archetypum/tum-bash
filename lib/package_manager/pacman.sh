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

function pacman_help()       { execute pacman --help      "$@"; }
function pacman_version()    { execute pacman --version   "$@"; }
function pacman_database()   { execute pacman --database  "$@"; }
function pacman_files()      { execute pacman --files     "$@"; }
function pacman_query()      { execute pacman --query     "$@"; }
function pacman_remove()     { execute pacman --remove    "$@"; }
function pacman_sync()       { execute pacman --sync      "$@"; }
function pacman_deptest()    { execute pacman --deptest   "$@"; }
function pacman_upgrade()    { execute pacman --upgrade   "$@"; }

