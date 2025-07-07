# `lib/unix.sh` — UNIX System Detection Library

**Version:** 0.0.1  
**Author:** Archetypum  
**License:** LGPL-3.0-or-later  
**Project:** [tum-bash](https://github.com/Archetypum/tum-bash)

---

## Overview

This library provides a collection of utilities for Bash scripts to detect the underlying UNIX-like operating system, identify the init system, determine package manager support, and interact with users through standard prompts and checks.

---

## Table of Contents

- [Features](#features)
- [Color and Style Constants](#color-and-style-constants)
- [Supported Systems](#supported-systems)
- [Functions](#functions)
  - [Distribution Detection](#distribution-detection)
  - [Init System Detection](#init-system-detection)
  - [User Interaction](#user-interaction)
  - [Privilege Check](#privilege-check)
- [License](#license)

---

## Features

- Detects GNU/Linux distribution families (Debian, Arch, Void, etc.)
- Detects BSD, macOS, Solaris, and other UNIX variants
- Detects the system's init (systemd, OpenRC, runit, etc.)
- Standardized prompt and root-check helpers
- Provides lists of supported distros and package managers

---

## Color and Style Constants

The script defines ANSI escape sequences for colored and formatted terminal output. Examples:

- `${RED}`, `${GREEN}`, `${YELLOW}` — colors
- `${BOLD}`, `${ITALIC}`, `${UNDERLINE}` — styles
- `${RESET}` — reset formatting

These are available globally after sourcing the file.

---

## Supported Systems

### Package Managers

Defined in the `SUPPORTED_PMS` array. Includes tools such as:

- `apt`, `aptitude`, `dnf`, `yum`, `apk`, `pacman`, `zypper`, and many more.

### Init Systems

Defined in the `SUPPORTED_INITS` array:

- `systemd`, `openrc`, `sysvinit`, `s6`, `runit`, `dinit`, `launchd`

### Distribution Families

Includes arrays for major UNIX-like distribution families:

- `DEBIAN_BASED`
- `ARCH_BASED`
- `ALPINE_BASED`
- `GENTOO_BASED`
- `VOID_BASED`
- `DRAGORA_BASED`
- `SLACKWARE_BASED`
- `REDHAT_BASED`
- `OPENSUSE_BASED`
- `GUIX_BASED`
- `FREEBSD_BASED`
- `OPENBSD_BASED`
- `NETBSD_BASED`
- `SOLARIS_ILLUMOS_BASED`
- `MACOS_BASED`

---

## Functions

### Distribution Detection

#### is_family_based

Each function checks whether the given distro name belongs to a known family:

- `is_debian_based`
- `is_arch_based`
- `is_alpine_based`
- `is_gentoo_based`
- `is_void_based`
- `is_dragora_based`
- `is_slackware_based`
- `is_redhat_based`
- `is_guix_based`
- `is_freebsd_based`
- `is_openbsd_based`
- `is_netbsd_based`
- `is_solaris_illumos_based`
- `macos_based`

All functions take the current distro name as the first argument and a list of known names as the rest. They return `0` on match and `1` otherwise.

#### Example

```bash
#!/bin/bash

source lib/unix.sh

DISTRO="ubuntu"
if is_debian_based "$DISTRO" "${DEBIAN_BASED[@]}"; then
    echo "$DISTRO is Debian-based"
fi
```

#### get_user_distro

Detects and returns the current Linux distribution ID.

This function attempts to read the distribution ID from `/etc/os-release`. If the file is missing or unreadable, it prompts the user to manually input the OS name.
Prints the distribution name to stdout (e.g. ubuntu, arch, gentoo, etc.) If detection fails, prompts the user for manual input.

#### Example

```bash
#!/bin/bash

souce lib/unix.sh

DISTRO=$(get_user_distro)
echo "Detected distro: $DISTRO"
```

---

### Init System Detection

#### `get_init_system`

Attempts to identify the init system by checking known file paths and the name of PID 1.

Returns one of:  
`systemd`, `openrc`, `sysvinit`, `s6`, `runit`, `dinit`, `launchd`, or `unknown`.

#### Example

```bash
#!/bin/bash

source lib/unix.sh

INIT_SYSTEM=$(get_init_system)
echo "Init system: $INIT_SYSTEM"
```

#### `get_pid1_comm`

Helper function that returns the `COMM` field for PID 1 using `ps` utility.

#### Example

```bash
#!/bin/bash

source lib/unix.sh

PID1_NAME=$(get_pid1_comm)
echo "PID 1 command: $PID1_NAME"
```

---

### User Interaction

#### `prompt_user`

Prompts the user with a yes/no question and returns `0` for yes and `1` for no.

#### Example

```bash
#!/bin/bash

source lib/unix.sh

if prompt_user "Do you want to continue?" "Y"; then
    echo "User agreed."
else
    echo "User declined."
fi

```

#### `clear_screen`

Clears the terminal using the `clear` command.

#### Example

```bash
#!/bin/bash

source lib/unix.sh

clear_screen
echo "Screen was cleared."
```

---

### Privilege Check

#### `check_privileges`

Exits the script if it's not being run as root (`EUID != 0`), with a red error message.

#### Example

```bash
#!/bin/bash

source lib/unix.sh

check_privileges
echo "Running as root."
```

---

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
