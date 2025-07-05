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

function slackpkg()                     { execute slackpkg               "$@"; }
function slackpkg_search()              { execute slackpkg search        "$@"; }
function slackpkg_install()             { execute slackpkg install       "$@"; }
function slackpkg_upgrade()             { execute slackpkg upgrade       "$@"; }
function slackpkg_reinstall()           { execute slackpkg reinstall     "$@"; }
function slackpkg_remove()              { execute slackpkg remove        "$@"; }
function slackpkg_blacklist()           { execute slackpkg blacklist     "$@"; }
function slackpkg_download()            { execute slackpkg download      "$@"; }
function slackpkg_info()                { execute slackpkg info          "$@"; }
function slackpkg_clean_system()        { execute slackpkg clean-system  "$@"; }
function slackpkg_upgrade_all()         { execute slackpkg upgrade-all   "$@"; }
function slackpkg_install_new()         { execute slackpkg install-new   "$@"; }
function slackpkg_check_updates()       { execute slackpkg check-updates "$@"; }
function slackpkg_update()              { execute slackpkg update        "$@"; }
