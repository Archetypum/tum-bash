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

function yay()             { execute yay                   "$@"; }
function yay_build()       { execute yay --build           "$@"; }
function yay_show()        { execute yay --show            "$@"; }
function yay_getpkgbuild() { execute yay --getpkgbuild     "$@"; }
function yay_web()         { execute yay --web             "$@"; }

