# tum-bash

![TheUnixManager](https://github.com/user-attachments/assets/6c0b3fbc-1d09-4d35-9dde-33b22a468c45)

--- 

## Overview

`tum` (TheUnixManager) is a universal package management and system initialization library created by Archetypum, designed to simplify interactions with UNIX-like operating systems and streamline the development of system-related bash/shell scripts.

This is the Bash implementation of `tum`.

---

## Table of contents

- [Why?](#why)
- [What does it solve?](#what-does-it-solve)
- [Use Cases](#use-cases)
- [Requirements](#requirements)
- [Installation](#installation)
- [Documentation](#documentation)
- [Supported Package Management Utilities (35)](#supported-package-management-utilities-35)
- [Supported Initialization Systems (7)](#supported-initialization-systems-7)
- [Example Usage](#example-usage)
- [Legal](#legal)

---

## Why?

Because interacting with countless package managers and init systems across UNIX-like platforms is painful — `tum` fixes that.

With `tum`, you:

1) Don't need to be a UNIX maniac who knows every package manager and init system syntax and arguments by heart;

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

`tum` executable consists of **1186 lines of pure bash** (without empty lines and comments) that makes your code support thousands GNU/Linux, BSD, Minix, Haiku, Android, iOS and macOS distros. That makes `tum` a _**very**_ small and lightweight dependency in your project.

Your users can install it in just three commands and forget about `tum` existence for forever, because their cross-platform scripts are working just like intended.

_**So why not give it a shot?**_

---

## Requirements

`tum` requires only one dependency - **GNU Bash** version >`3.1+`. You can install it on practically any UNIX-like operating system if you somehow don't have it installed already.

## Installation

```sh
git clone https://github.com/Archetypum/tum-bash.git
cd tum-bash/

# You can use doas instead of sudo.
sudo make dependencies
sudo make install
```

## Documentation

You can find `tum-bash` documentation inside the `doc/` directory (Mostly obsolete, man pages coming soon).

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

### MINIX/NetBSD-based:

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

### Information gathering:

```bash
#!/usr/bin/env bash

source /usr/bin/tum

distro=$(get_distro)
init=$(get_init) 
init_comm=$(get_pid1_comm)
pm=$(get_package_manager)
check_privileges           # example: [*] Not running as root..

echo $distro               # example: artix
echo $init                 # example: s6 
echo $init_comm            # example: s6-svscan
echo $pm                   # example: pacman
```

## Legal

`tum-bash` is free software, released under the **GNU Lesser General Public License v3**.

See:

- [_LICENSE-LGPLv3.md_](./LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)

![GNU](https://github.com/user-attachments/assets/66935a97-374f-4dbc-9f1c-428070fda139)
