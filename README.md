# tum-bash

![TheUnixManager](https://github.com/user-attachments/assets/6c0b3fbc-1d09-4d35-9dde-33b22a468c45)

--- 

## Overview

Tum (TheUnixManager) is a universal package management and system initialization library created by Archetypum, designed to simplify interactions with UNIX-like systems and streamline the development of system-related bash scripts.

This is the Bash implementation of `tum`.

---

## Table of contents

- [Why?](#why)
- [What does it solve?](#what-does-it-solve)
- [Use Cases](#use-cases)
- [Requirements](#requirements)
- [Installation](#installation)
- [Documentation](#documentation)
- [Tests](#tests)
- [Supported Package Management Utilities (35)](#supported-package-management-utilities-35)
- [Supported Initialization Systems (7)](#supported-initialization-systems-7)
- [Example Usage](#example-usage)
- [Other Implementations by Archetypum](#other-implementations-by-archetypum)
- [Legal](#legal)

---

## Why?

Because interacting with countless package managers and init systems across UNIX-like platforms is painful — `tum` fixes that.

With `tum`, you:

1) Don't need to be a UNIX maniac who knows every package manager and init system syntax by heart;

2) Don't waste time building utilities from scratch — core functions are prebuilt and ready;

3) Don't write bloated, error-prone scripts — your code stays clean, readable, and portable.

## What does it solve?

Managing packages and system services is inconsistent across distros. Whether you're scripting for Arch, Debian, Void, Slackware, Red Hat, or others, `tum` provides a unified interface to abstract those differences.

It gives you:

1) A standardized way to install, remove, purge, update, upgrade packages (any many more!);

2) Unified service control (status, start, stop, enable, etc.) across multiple init systems (and many more);

3) A modular approach to extend support for more tools and distros;

4) Shell-friendly integration for faster development and cleaner scripts.


## Use Cases

- Write portable installation scripts that “just work” on most UNIX-like systems;

- Build lightweight system provisioning tools in pure Bash;

- Create consistent automation for servers, containers, or virtual machines;

- Prototype cross-distro sysadmin tools without rewriting core logic.

`tum` executable consists of **1464 lines of code** (without empty lines and comments) that makes your code support 400+ GNU/Linux, BSD and macOS distros. That makes `tum` a _**very**_ small dependency in your project.

Your users can install it in just three commands and forget about `tum` existence for forever, because their cross-platform scripts are working just like intended.

_**So why not give it a shot?**_

---

## Requirements

`tum` requires only one dependency - **GNU Bash**. You can install it on practically any UNIX-like operating system if you somehow don't have it installed already.

## Installation

- Via Makefile:

```sh
git clone https://github.com/Archetypum/tum-bash.git
cd tum-bash/

sudo make dependencies
sudo make install
```

- Also, you can use `tum-bash` modules separately if you only need to use some specific functionality:

```sh
mv lib/unix.sh your_desired_location/
mv lib/package_manager/apt.sh your_desired_location/
mv lib/init_system/systemd.sh your_desired_location/
```

- Or use the whole `tum-bash` as a single executable:

```sh
mv tum your_desired_location/  # For convenience, Archetypum recommends '/usr/bin/tum' path (as in Makefile). 
```

## Documentation

You can find `tum-bash` documentation inside the `doc/` directory.

## Tests

You can find automatic tests inside the `t/` directory.

If you want test your installation manually:

```sh
./autotests.sh
```

## Supported Package Management Utilities (35)

### Debian-based:

- **apt**, **apt-get**, **apt-cache**, **apt-cdrom**, **apt-config**, **apt-extracttemplates**, **apt-listchanges**, **apt-mark**, **apt-sortpkgs**, **aptitude**, **aptitude-create-state-bundle**, **aptitude-run-state-bundle**, **dpkg**

### Arch-based:

- **pacman**, **yay**, **trizen**, **pamac**

### Gentoo-based:

- **portage** (open for pull requests)

### Slackware-based:

- **slackpkg**

### Alpine-based:

- **apk**

### Void-based:

- **xbps-install**, **xbps-remove**, **xbps-query**

### Guix-based:

- **guix**

### Dragora-based:

- **qi**

### OpenBSD/NetBSD/FreeBSD-based:

- **pkg_add**, **pkg_delete**, **pkg_create**, **pkg_info**

### FreeBSD-based:

- **pkg**

### NetBSD-based:

- **pkgin**

### RedHat-based:

- **yum**, **dnf**

### openSUSE-based:

- **zypper**, **zypper-log**

### macOS-based:

- **homebrew**

## Supported Initialization Systems (7)

- **systemd**

- **sysvinit**

- **openrc**

- **runit**

- **s6**

- **dinit**

- **launchd**

## Example Usage

### UNIX:

```bash
#!/bin/bash

source unix.sh

DISTRO=$(get_user_distro)
echo -e "${GREEN}Detected distribution: ${DISTRO}${RESET}"

if macos_based "$DISTRO" "$MACOS_BASED"; then
    echo -e "${GREEN}This is a macOS-based system.${RESET}"
else
    echo -e "${GREEN}This is NOT a macOS-based system.${RESET}"
fi

INIT_SYSTEM=$(get_init_system)
echo -e "${GREEN}Detected init system: ${INIT_SYSTEM}${RESET}"
```

### Service Management:

```bash
#!/bin/bash

source sysvinit.sh

SERVICE_NAME="ssh"

echo -e "${GREEN}Starting service '$SERVICE_NAME'...${RESET}"
start_service "$SERVICE_NAME"

echo -e "${GREEN}Checking status of service '$SERVICE_NAME'...${RESET}"
status_service "$SERVICE_NAME"

echo -e "${GREEN}Restarting service '$SERVICE_NAME' using execute_service function...${RESET}"
execute_service restart "$SERVICE_NAME"

echo -e "${GREEN}Stopping service '$SERVICE_NAME'...${RESET}"
stop_service "$SERVICE_NAME"

echo -e "${GREEN}Trying unknown command with execute_service...${RESET}"
execute_service foobar "$SERVICE_NAME"
```

### Package Management

```bash
#!/bin/bash

source apk.sh

echo "=== Display apk version ==="
apk_version

echo -e "\n=== Show apk help ==="
apk_help

echo -e "\n=== Update package index ==="
apk_update

echo -e "\n=== Search for package 'bash' ==="
apk_search bash

echo -e "\n=== Show info about package 'bash' ==="
apk_info bash

echo -e "\n=== List installed packages ==="
apk_list

echo -e "\n=== Add package 'curl' (dry-run) ==="
apk_add --simulate curl

echo -e "\n=== Remove package 'curl' (dry-run) ==="
apk_del --simulate curl
```

## Other Implementations by Archetypum

- [_tum-python_](https://github.com/Archetypum/tum-python)

- [_tum-perl_](https://github.com/Archetypum/tum-perl)

- [_tum-raku_](https://github.com/Archetypum/tum-raku)

- [_tum-c_](https://github.com/Archetypum/tum-c)

- [_tum-rust_](https://github.com/Archetypum/tum-rust)

## Legal

**tum-bash** is free software, released under the **GNU Lesser General Public License v3**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)

![GNU](https://github.com/user-attachments/assets/66935a97-374f-4dbc-9f1c-428070fda139)
