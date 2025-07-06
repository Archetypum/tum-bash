TUM_BIN := /usr/bin/tum
TUM_SRC := tum

.PHONY: all install uninstall dependencies

all: install

dependencies:
	@echo "[*] Checking dependencies..."
	@which bash >/dev/null || (echo "[!] GNU Bash is required but not found." && exit 1)
	@echo "[*] GNU Bash is installed and valid."

install: $(TUM_SRC)
	@echo "[*] Installing tum to $(TUM_BIN)..."
	@install -m 0755 $(TUM_SRC) $(TUM_BIN)
	@echo "[*] Installed."

uninstall:
	@echo "[*] Removing $(TUM_BIN)..."
	@rm -f $(TUM_BIN)
	@echo "[*] Uninstalled."
