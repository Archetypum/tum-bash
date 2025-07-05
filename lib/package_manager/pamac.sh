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

function pamac()              { execute pamac                  "$@"; }
function pamac_version()      { execute pamac --version        "$@"; }
function pamac_help()         { execute pamac --help           "$@"; }
function pamac_search()       { execute pamac search           "$@"; }
function pamac_list()         { execute pamac list             "$@"; }
function pamac_info()         { execute pamac info             "$@"; }
function pamac_install()      { execute pamac install          "$@"; }
function pamac_reinstall()    { execute pamac reinstall        "$@"; }
function pamac_remove()       { execute pamac remove           "$@"; }
function pamac_checkupdates() { execute pamac checkupdates     "$@"; }
function pamac_upgrade()      { execute pamac upgrade          "$@"; }
function pamac_update()       { execute pamac update           "$@"; }
function pamac_clone()        { execute pamac clone            "$@"; }
function pamac_build()        { execute pamac build            "$@"; }
function pamac_clean()        { execute pamac clean            "$@"; }

