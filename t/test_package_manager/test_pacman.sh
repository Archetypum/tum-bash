#!/bin/bash
#
# `t/test_package_manager/test_pacman.sh`
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

set -e
source /usr/bin/tum

declare -r RED="\033[0;31m"
declare -r GREEN="\033[0;32m"
declare -r RESET="\033[0m"

function pass() { echo -e "${GREEN}[PASS] $1${RESET}"; }
function fail() { echo -e "${RED}[FAIL] $1${RESET}"; exit 1; }

function test_wrapper()
{
    local FUNC="$1"
    local ARGS=("$@")
    shift

    if OUTPUT=$("$FUNC" "${ARGS[@]}" 2>&1); then
        if [[ "$OUTPUT" == *"Success"* ]]; then
            pass "$FUNC passed"
        else
            fail "$FUNC output mismatch"
        fi
    else
        fail "$FUNC failed to run"
    fi
}

DRY_RUN_ARGS=(--dryrun --noconfirm)

function main
{
	echo $(/usr/bin/tum pacman_help)
	# test_wrapper pacman            --version
	# test_wrapper pacman_help
	# test_wrapper pacman_version
	# test_wrapper pacman_database   "${DRY_RUN_ARGS[@]}"
	# test_wrapper pacman_files      "${DRY_RUN_ARGS[@]}"
	# test_wrapper pacman_query      "${DRY_RUN_ARGS[@]}"
	# test_wrapper pacman_remove     "${DRY_RUN_ARGS[@]}" fake-package
	# test_wrapper pacman_sync       "${DRY_RUN_ARGS[@]}" fake-package
	# test_wrapper pacman_deptest    "${DRY_RUN_ARGS[@]}" fake-package
	# test_wrapper pacman_upgrade    "${DRY_RUN_ARGS[@]}" ./fake.pkg.tar.zst

	# echo "All tests passed."
}

main
