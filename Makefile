# `Makefile`
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

TUM_BIN := /usr/bin/tum
TUM_SRC := tum

.PHONY: all install uninstall dependencies

all: dependencies install

dependencies:
	@echo "[<==] Checking dependencies..."
	@which bash >/dev/null || (echo "[!] GNU Bash is required but not found." && exit 1)
	@echo "[*] GNU Bash is installed and valid."

install: $(TUM_SRC)
	@echo "[<==] Installing tum to $(TUM_BIN)..."
	@install -m 0755 $(TUM_SRC) $(TUM_BIN)
	@echo "[*] Installed."

uninstall:
	@echo "[<==] Removing $(TUM_BIN)..."
	@rm -f $(TUM_BIN)
	@echo "[*] Uninstalled."
