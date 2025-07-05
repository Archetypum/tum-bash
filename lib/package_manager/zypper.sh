#!/bin/bash

declare -r RED="\033[0;31m"
declare -r GREEN="\033[0;32m"
declare -r RESET="\033[0m"

function execute() {
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

function zypper()                             { execute zypper                        "$@"; }
function zypper_addlocale()                   { execute zypper addlocale              "$@"; }
function zypper_addlock()                     { execute zypper addlock                "$@"; }
function zypper_addrepo()                     { execute zypper addrepo                "$@"; }
function zypper_addservice()                  { execute zypper addservice             "$@"; }
function zypper_appsteam_cache()              { execute zypper appstream-cache        "$@"; }
function zypper_clean()                       { execute zypper clean                  "$@"; }
function zypper_cleanlocks()                  { execute zypper cleanlocks             "$@"; }
function zypper_dist_upgrade()                { execute zypper dist-upgrade           "$@"; }
function zypper_download()                    { execute zypper download               "$@"; }
function zypper_help()                        { execute zypper help                   "$@"; }
function zypper_info()                        { execute zypper info                   "$@"; }
function zypper_install()                     { execute zypper install                "$@"; }
function zypper_install_new_recommends()      { execute zypper install-new-recommends "$@"; }
function zypper_licenses()                    { execute zypper licenses               "$@"; }
function zypper_list_patches()                { execute zypper list-patches           "$@"; }
function zypper_list_updates()                { execute zypper list-updates           "$@"; }
function zypper_locales()                     { execute zypper locales                "$@"; }
function zypper_locks()                       { execute zypper locks                  "$@"; }
function zypper_modifyrepo()                  { execute zypper modifyrepo             "$@"; }
function zypper_modifyservice()               { execute zypper modifyservice          "$@"; }
function zypper_needs_rebooting()             { execute zypper needs-rebooting        "$@"; }
function zypper_packages()                    { execute zypper packages               "$@"; }
function zypper_patch()                       { execute zypper patch                  "$@"; }
function zypper_patch_check()                 { execute zypper patch-check            "$@"; }
function zypper_patches()                     { execute zypper patches                "$@"; }
function zypper_patch_info()                  { execute zypper patch-info             "$@"; }
function zypper_patterns()                    { execute zypper patterns               "$@"; }
function zypper_product_info()                { execute zypper product-info           "$@"; }
function zypper_products()                    { execute zypper products               "$@"; }
function zypper_purge_kernels()               { execute zypper purge-kernels          "$@"; }
function zypper_ps()                          { execute zypper ps                     "$@"; }
function zypper_refresh()                     { execute zypper refresh                "$@"; }
function zypper_refresh_services()            { execute zypper refresh-services       "$@"; }
function zypper_remove()                      { execute zypper remove                 "$@"; }
function zypper_removelocale()                { execute zypper removelocale           "$@"; }
function zypper_removelock()                  { execute zypper removelock             "$@"; }
function zypper_removeptf()                   { execute zypper removeptf              "$@"; }
function zypper_removerepo()                  { execute zypper removerepo             "$@"; }
function zypper_removeservice()               { execute zypper removeservice          "$@"; }
function zypper_renamerepo()                  { execute zypper renamerepo             "$@"; }
function zypper_repos()                       { execute zypper repos                  "$@"; }
function zypper_search()                      { execute zypper search                 "$@"; }
function zypper_services()                    { execute zypper services               "$@"; }
function zypper_shell()                       { execute zypper shell                  "$@"; }
function zypper_source_download()             { execute zypper source-download        "$@"; }
function zypper_source_install()              { execute zypper source-install         "$@"; }
function zypper_subcommand()                  { execute zypper subcommand             "$@"; }
function zypper_system_architecture()         { execute zypper system-architecture    "$@"; }
function zypper_targetos()                    { execute zypper targetos               "$@"; }
function zypper_update()                      { execute zypper update                 "$@"; }
function zypper_versioncmp()                  { execute zypper versioncmp             "$@"; }
function zypper_verify()                      { execute zypper verify                 "$@"; }
function zypper_what_provides()               { execute zypper what-provides          "$@"; }
function zypper_install_new_recomends()       { execute zypper install-new-recommends "$@"; }

