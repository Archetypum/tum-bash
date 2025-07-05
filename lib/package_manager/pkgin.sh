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

function pkgin()                         { execute pkgin                     "$@"; }
function pkgin_list()                    { execute pkgin list                "$@"; }
function pkgin_avail()                   { execute pkgin avail               "$@"; }
function pkgin_search()                  { execute pkgin search              "$@"; }
function pkgin_install()                 { execute pkgin install             "$@"; }
function pkgin_update()                  { execute pkgin update              "$@"; }
function pkgin_upgrade()                 { execute pkgin upgrade             "$@"; }
function pkgin_full_upgrade()            { execute pkgin full-upgrade        "$@"; }
function pkgin_remove()                  { execute pkgin remove              "$@"; }
function pkgin_keep()                    { execute pkgin keep                "$@"; }
function pkgin_unkeep()                  { execute pkgin unkeep              "$@"; }
function pkgin_export()                  { execute pkgin export              "$@"; }
function pkgin_import()                  { execute pkgin import              "$@"; }
function pkgin_show_keep()               { execute pkgin show-keep           "$@"; }
function pkgin_show_no_keep()            { execute pkgin show-no-keep        "$@"; }
function pkgin_autoremove()              { execute pkgin autoremove          "$@"; }
function pkgin_clean()                   { execute pkgin clean               "$@"; }
function pkgin_show_deps()               { execute pkgin show-deps           "$@"; }
function pkgin_show_full_deps()          { execute pkgin show-full-deps      "$@"; }
function pkgin_show_rev_deps()           { execute pkgin show-rev-deps       "$@"; }
function pkgin_provides()                { execute pkgin provides            "$@"; }
function pkgin_requires()                { execute pkgin requires            "$@"; }
function pkgin_show_category()           { execute pkgin show-category       "$@"; }
function pkgin_show_pkg_category()       { execute pkgin show-pkg-category   "$@"; }
function pkgin_show_all_categories()     { execute pkgin show-all-categories "$@"; }
function pkgin_pkg_content()             { execute pkgin pkg-content         "$@"; }
function pkgin_pkg_descr()               { execute pkgin pkg-descr           "$@"; }
function pkgin_pkg_build_defs()          { execute pkgin pkg-build-defs      "$@"; }
function pkgin_stats()                   { execute pkgin stats               "$@"; }

