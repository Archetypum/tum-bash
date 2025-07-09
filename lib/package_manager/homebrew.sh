#!/bin/bash
#
# `lib/package_manager/homebrew.sh`
#
# Copyright (C) 2025 Archetypum
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>

declare -r RED="\033[0;31m"
declare -r GREEN="\033[0;32m"
declare -r RESET="\033[0m"

readonly SAFE_ARG_PATTERN="^[a-zA-Z0-9@._/:+=-]+$"

function is_safe_argument()
{
    local ARG="$1"

    if [[ "$ARG" =~ $SAFE_ARG_PATTERN ]]; then
        return 0
    else
        return 1
    fi
}

function validate_command()
{
    local ARG

    if (( $# == 0 )); then
        echo -e "${RED}[!] Error: Empty command${RESET}" >&2
        return 1
    fi

    for ARG in "$@"; do
        if ! is_safe_argument "$ARG"; then
            echo -e "${RED}[!] Error: Unsafe or invalid argument detected: '$ARG'${RESET}" >&2
            return 1
        fi
    done

    return 0
}

function execute()
{
    local CMD=("$@")

    if ! validate_command "${CMD[@]}"; then
        return 1
    fi

    echo -e "${GREEN}[<==] Executing '${CMD[*]}'...${RESET}"

    if command "${CMD[@]}"; then
        echo -e "${GREEN}[*] Success!${RESET}"
        return 0
    else
        echo -e "${RED}[!] Error: Failed to execute: '${CMD[*]}'.${RESET}" >&2
        return 1
    fi
}

function brew()                          { execute brew                  "$@"; }
function brew_alias()                    { execute brew alias            "$@"; }
function brew_analytics()                { execute brew analytics        "$@"; }
function brew_autoremove()               { execute brew autoremove       "$@"; }
function brew_bundle()                   { execute brew bundle           "$@"; }
function brew_casks()                    { execute brew casks            "$@"; }
function brew_cleanup()                  { execute brew cleanup          "$@"; }
function brew_command()                  { execute brew command          "$@"; }
function brew_commands()                 { execute brew commands         "$@"; }
function brew_completions()              { execute brew completions      "$@"; }
function brew_config()                   { execute brew config           "$@"; }
function brew_deps()                     { execute brew deps             "$@"; }
function brew_desc()                     { execute brew desc             "$@"; }
function brew_developer()                { execute brew developer        "$@"; }
function brew_docs()                     { execute brew docs             "$@"; }
function brew_fetch()                    { execute brew fetch            "$@"; }
function brew_formulae()                 { execute brew formulae         "$@"; }
function brew_gist_logs()                { execute brew gist-logs        "$@"; }
function brew_help()                     { execute brew help             "$@"; }
function brew_home()                     { execute brew home             "$@"; }
function brew_install()                  { execute brew install          "$@"; }
function brew_leaves()                   { execute brew leaves           "$@"; }
function brew_link()                     { execute brew link             "$@"; }
function brew_list()                     { execute brew list             "$@"; }
function brew_log()                      { execute brew log              "$@"; }
function brew_mcp_server()               { execute brew mcp-server       "$@"; }
function brew_migrate()                  { execute brew migrate          "$@"; }
function brew_missing()                  { execute brew missing          "$@"; }
function brew_nodenv_sync()              { execute brew nodenv-sync      "$@"; }
function brew_options()                  { execute brew options          "$@"; }
function brew_outdated()                 { execute brew outdated         "$@"; }
function brew_pin()                      { execute brew pin              "$@"; }
function brew_postinstall()              { execute brew postinstall      "$@"; }
function brew_pyenv_sync()               { execute brew pyenv-sync       "$@"; }
function brew_rbenv_sync()               { execute brew rbenv-sync       "$@"; }
function brew_readall()                  { execute brew readall          "$@"; }
function brew_reinstall()                { execute brew reinstall        "$@"; }
function brew_search()                   { execute brew search           "$@"; }
function brew_services()                 { execute brew services         "$@"; }
function brew_setup_ruby()               { execute brew setup-ruby       "$@"; }
function brew_shellenv()                 { execute brew shellenv         "$@"; }
function brew_tab()                      { execute brew tab              "$@"; }
function brew_tap()                      { execute brew tap              "$@"; }
function brew_tap_info()                 { execute brew tap-info         "$@"; }
function brew_unalias()                  { execute brew unalias          "$@"; }
function brew_uninstall()                { execute brew uninstall        "$@"; }
function brew_unlink()                   { execute brew unlink           "$@"; }
function brew_unpin()                    { execute brew unpin            "$@"; }
function brew_untap()                    { execute brew untap            "$@"; }
function brew_update()                   { execute brew update           "$@"; }
function brew_update_if_needed()         { execute brew update-if-needed "$@"; }
function brew_update_reset()             { execute brew update-reset     "$@"; }
function brew_upgrade()                  { execute brew upgrade          "$@"; }
function brew_uses()                     { execute brew uses             "$@"; }
function brew_cache()                    { execute brew --cache          "$@"; }
function brew_caskroom()                 { execute brew --caskroom       "$@"; }
function brew_cellar()                   { execute brew --cellar         "$@"; }
function brew_env()                      { execute brew --env            "$@"; }
function brew_prefix()                   { execute brew --prefix         "$@"; }
function brew_repository()               { execute brew --repository     "$@"; }
function brew_version()                  { execute brew --version        "$@"; }

