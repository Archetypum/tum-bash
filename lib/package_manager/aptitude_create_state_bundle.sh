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

function aptitude_create_state_bundle()              { execute aptitude_create_state_bundle                   "$@"; }
function aptitude_create_state_bundle_help()         { execute aptitude_create_state_bundle --help            "$@"; }
function aptitude_create_state_bundle_print_inputs() { execute aptitude_create_state_bundle --print-inputs    "$@"; }
function aptitude_create_state_bundle_force_bzip2()  { execute aptitude_create_state_bundle --force-bzip2     "$@"; }
function aptitude_create_state_bundle_force_gzip()   { execute aptitude_create_state_bundle --force-gzip      "$@"; }

