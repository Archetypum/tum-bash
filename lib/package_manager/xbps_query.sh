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
        echo -e "${RED}[!] Error: Failed to execute: '${CMD[*]}'${RESET}"
        return 1
    fi
}

function xbps_query()                  { execute xbps-query                    "$@"; }
function xbps_query_list_pkgs()        { execute xbps-query --list-pkgs        "$@"; }
function xbps_query_list_hold_pkgs()   { execute xbps-query --list-hold-pkgs   "$@"; }
function xbps_query_list_repos()       { execute xbps-query --list-repos       "$@"; }
function xbps_query_list_manual_pkgs() { execute xbps-query --list-manual-pkgs "$@"; }
function xbps_query_list_orphans()     { execute xbps-query --list-orphans     "$@"; }
function xbps_query_ownedby()          { execute xbps-query --ownedby          "$@"; }
function xbps_query_show()             { execute xbps-query --show             "$@"; }
function xbps_query_search()           { execute xbps-query --search           "$@"; }
function xbps_query_files()            { execute xbps-query --files            "$@"; }
function xbps_query_deps()             { execute xbps-query --deps             "$@"; }
function xbps_query_revdeps()          { execute xbps-query --revdeps          "$@"; }
function xbps_query_cat()              { execute xbps-query cat                "$@"; }

