# tum-bash

![TheUnixManager](https://github.com/user-attachments/assets/6c0b3fbc-1d09-4d35-9dde-33b22a468c45)

**Tum (TheUnixManager)** is a universal package management and initialization system library created by **Archetypum**, designed to simplify interaction with various UNIX-like systems and streamline the creation of system-related scripts.

This is the Bash implementation of `tum`.

---

## Why?

Because interacting with countless package managers and init systems across UNIX-like platforms is painful — `tum` fixes that.

---

## Requirements

`tum` requires only one dependency - **GNU Bash**. You can install it on practically any UNIX-like operating system.

## Installation

- Via Makefile:

```sh
git clone https://github.com/Archetypum/tum-bash.git
cd tum-bash/

sudo make dependencies
sudo make install
```

- You can use `tum-bash` modules separately:

```sh
mv lib/unix.sh your_desired_location/
mv lib/package_manager/apt.sh your_desired_location/
mv lib/init_system/systemd.sh your_desired_location/
```

- Or use the whole `tum-bash` in a single file:

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
