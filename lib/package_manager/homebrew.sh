#!/usr/bin/env bash
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
# You should have received a copy of the GNU Lesser General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>

#
# Disable Unicode for speed:
#
LC_ALL="C"
LANG="C"

readonly RED="\033[0;31m"
readonly GREEN="\033[0;32m"
readonly RESET="\033[0m"

readonly SAFE_ARG_PATTERN="^[a-zA-Z0-9@._/:+=-]+$"

is_safe_argument()
{
    arg="$1"

    [[ "$arg" =~ $SAFE_ARG_PATTERN ]] && return 0 || return 1
}

validate_command()
{
    arg=

    (( $# == 0 )) && { printf "${RED}[!] Error: Empty command.${RESET}\n" >&2; return 1; }

    for arg in "$@"; do
        ! is_safe_argument "$arg" &&
            { printf "${RED}[!] Error: Unsafe or invalid argument detected: '$arg'${RESET}" >&2; return 1; }
    done

    return 0
}

execute()
{
    cmd=("$@")

    ! validate_command "${cmd[@]}" && return 1

    printf "${GREEN}[<==] Executing '${cmd[*]}'...${RESET}\n"
    command "${cmd[@]}" && 
        { printf "${GREEN}[*] Success!${RESET}\n"; return 0; } ||
        { printf "${RED}[!] Error: Failed to execute: '${cmd[*]}'.${RESET}\n" >&2 return 1; }
}

brew()                          { execute brew                  "$@"; }
brew_alias()                    { execute brew alias            "$@"; }
brew_analytics()                { execute brew analytics        "$@"; }
brew_autoremove()               { execute brew autoremove       "$@"; }
brew_bundle()                   { execute brew bundle           "$@"; }
brew_casks()                    { execute brew casks            "$@"; }
brew_cleanup()                  { execute brew cleanup          "$@"; }
brew_command()                  { execute brew command          "$@"; }
brew_commands()                 { execute brew commands         "$@"; }
brew_completions()              { execute brew completions      "$@"; }
brew_config()                   { execute brew config           "$@"; }
brew_deps()                     { execute brew deps             "$@"; }
brew_desc()                     { execute brew desc             "$@"; }
brew_developer()                { execute brew developer        "$@"; }
brew_docs()                     { execute brew docs             "$@"; }
brew_fetch()                    { execute brew fetch            "$@"; }
brew_formulae()                 { execute brew formulae         "$@"; }
brew_gist_logs()                { execute brew gist-logs        "$@"; }
brew_help()                     { execute brew help             "$@"; }
brew_home()                     { execute brew home             "$@"; }
brew_install()                  { execute brew install          "$@"; }
brew_leaves()                   { execute brew leaves           "$@"; }
brew_link()                     { execute brew link             "$@"; }
brew_list()                     { execute brew list             "$@"; }
brew_log()                      { execute brew log              "$@"; }
brew_mcp_server()               { execute brew mcp-server       "$@"; }
brew_migrate()                  { execute brew migrate          "$@"; }
brew_missing()                  { execute brew missing          "$@"; }
brew_nodenv_sync()              { execute brew nodenv-sync      "$@"; }
brew_options()                  { execute brew options          "$@"; }
brew_outdated()                 { execute brew outdated         "$@"; }
brew_pin()                      { execute brew pin              "$@"; }
brew_postinstall()              { execute brew postinstall      "$@"; }
brew_pyenv_sync()               { execute brew pyenv-sync       "$@"; }
brew_rbenv_sync()               { execute brew rbenv-sync       "$@"; }
brew_readall()                  { execute brew readall          "$@"; }
brew_reinstall()                { execute brew reinstall        "$@"; }
brew_search()                   { execute brew search           "$@"; }
brew_services()                 { execute brew services         "$@"; }
brew_setup_ruby()               { execute brew setup-ruby       "$@"; }
brew_shellenv()                 { execute brew shellenv         "$@"; }
brew_tab()                      { execute brew tab              "$@"; }
brew_tap()                      { execute brew tap              "$@"; }
brew_tap_info()                 { execute brew tap-info         "$@"; }
brew_unalias()                  { execute brew unalias          "$@"; }
brew_uninstall()                { execute brew uninstall        "$@"; }
brew_unlink()                   { execute brew unlink           "$@"; }
brew_unpin()                    { execute brew unpin            "$@"; }
brew_untap()                    { execute brew untap            "$@"; }
brew_update()                   { execute brew update           "$@"; }
brew_update_if_needed()         { execute brew update-if-needed "$@"; }
brew_update_reset()             { execute brew update-reset     "$@"; }
brew_upgrade()                  { execute brew upgrade          "$@"; }
brew_uses()                     { execute brew uses             "$@"; }
brew_cache()                    { execute brew --cache          "$@"; }
brew_caskroom()                 { execute brew --caskroom       "$@"; }
brew_cellar()                   { execute brew --cellar         "$@"; }
brew_env()                      { execute brew --env            "$@"; }
brew_prefix()                   { execute brew --prefix         "$@"; }
brew_repository()               { execute brew --repository     "$@"; }
brew_version()                  { execute brew --version        "$@"; }

