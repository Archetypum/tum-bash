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

function apt()                 { execute apt              "$@"; }
function apt_autoclean()       { execute apt autoclean    "$@"; }
function apt_autoremove()      { execute apt autoremove   "$@"; }
function apt_changelog()       { execute apt changelog    "$@"; }
function apt_depends()         { execute apt depends      "$@"; }
function apt_download()        { execute apt download     "$@"; }
function apt_full_upgrade()    { execute apt full-upgrade "$@"; }
function apt_install()         { execute apt install      "$@"; }
function apt_moo()             { execute apt moo          "$@"; }
function apt_purge()           { execute apt purge        "$@"; }
function apt_reinstall()       { execute apt reinstall    "$@"; }
function apt_search()          { execute apt search       "$@"; }
function apt_showsrc()         { execute apt showsrc      "$@"; }
function apt_update()          { execute apt update       "$@"; }
function apt_autopurge()       { execute apt autopurge    "$@"; }
function apt_build_dep()       { execute apt build-dep    "$@"; }
function apt_clean()           { execute apt clean        "$@"; }
function apt_dist_upgrade()    { execute apt dist-upgrade "$@"; }
function apt_edit_sources()    { execute apt edit-sources "$@"; }
function apt_help()            { execute apt help         "$@"; }
function apt_list()            { execute apt list         "$@"; }
function apt_policy()          { execute apt policy       "$@"; }
function apt_rdepends()        { execute apt rdepends     "$@"; }
function apt_remove()          { execute apt remove       "$@"; }
function apt_show()            { execute apt show         "$@"; }
function apt_source()          { execute apt source       "$@"; }
function apt_upgrade()         { execute apt upgrade      "$@"; }

