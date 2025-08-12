#!/usr/bin/env bash
#
# `t/test_package_manager/test_homebrew.sh`
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

declare -r GREEN="\033[0;32m"
declare -r RESET="\033[0m"

function main
{
	echo -e "\n[<==] Starting tests for 'brew'...\n"

	/usr/bin/tum brew
	/usr/bin/tum brew_alias
	/usr/bin/tum brew_analytics
	/usr/bin/tum brew_autoremove
	/usr/bin/tum brew_bundle
	/usr/bin/tum brew_casks
	/usr/bin/tum brew_cleanup
	/usr/bin/tum brew_command
	/usr/bin/tum brew_commands
	/usr/bin/tum brew_completions
	/usr/bin/tum brew_config
	/usr/bin/tum brew_deps
	/usr/bin/tum brew_desc
	/usr/bin/tum brew_developer
	/usr/bin/tum brew_docs
	/usr/bin/tum brew_fetch
	/usr/bin/tum brew_formulae
	/usr/bin/tum brew_gist_logs
	/usr/bin/tum brew_help
	/usr/bin/tum brew_home
	/usr/bin/tum brew_install
	/usr/bin/tum brew_leaves
	/usr/bin/tum brew_link
	/usr/bin/tum brew_list
	/usr/bin/tum brew_log
	/usr/bin/tum brew_mcp_server
	/usr/bin/tum brew_migrate
	/usr/bin/tum brew_missing
	/usr/bin/tum brew_nodenv_sync
	/usr/bin/tum brew_options
	/usr/bin/tum brew_outdated
	/usr/bin/tum brew_pin
	/usr/bin/tum brew_postinstall
	/usr/bin/tum brew_pyenv_sync
	/usr/bin/tum brew_rbenv_sync
	/usr/bin/tum brew_readall
	/usr/bin/tum brew_reinstall
	/usr/bin/tum brew_search
	/usr/bin/tum brew_services
	/usr/bin/tum brew_setup_ruby
	/usr/bin/tum brew_shellenv
	/usr/bin/tum brew_tab
	/usr/bin/tum brew_tap
	/usr/bin/tum brew_tap_info
	/usr/bin/tum brew_unalias
	/usr/bin/tum brew_uninstall
	/usr/bin/tum brew_unlink
	/usr/bin/tum brew_unpin
	/usr/bin/tum brew_untap
	/usr/bin/tum brew_update
	/usr/bin/tum brew_update_if_needed
	/usr/bin/tum brew_update_reset
	/usr/bin/tum brew_upgrade
	/usr/bin/tum brew_uses
	/usr/bin/tum brew_cache
	/usr/bin/tum brew_caskroom
	/usr/bin/tum brew_cellar
	/usr/bin/tum brew_env
	/usr/bin/tum brew_prefix
	/usr/bin/tum brew_repository
	/usr/bin/tum brew_version

	echo -e "\n${GREEN}[*] All tests passed.${RESET}"
}

main
