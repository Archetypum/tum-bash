# `lib/package_manager/apt.sh` — apt Wrapper Library

**Version:** 1.2.3  
**Author:** Archetypum  
**License:** LGPL-3.0-or-later  
**Project:** [tum-bash](https://github.com/Archetypum/tum-bash.git)

Bash wrapper for interacting with the `apt` package manager. Provides convenient functions to run common `apt` commands with standardized success/error output and execution logging.

`apt` is commonly used on **Debian GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/apt.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### apt Command Wrappers

Each function wraps a specific `apt` command or flag:

| **Function**     | **Equivalent `apt` command** |
|------------------|------------------------------|
| apt              | apt `<args>`                 |
| apt_autoclean    | apt autoclean `<args>`       |
| apt_autoremove   | apt autoremove `<args>`      |
| apt_changelog    | apt changelog `<args>`       |
| apt_depends      | apt depends `<args>`         |
| apt_download     | apt download `<args>`        |
| apt_full_upgrade | apt full-upgrade `<args>`    |
| apt_install      | apt install `<args>`         |
| apt_moo          | apt moo `<args>`             |
| apt_purge        | apt purge `<args>`           |
| apt_reinstall    | apt reinstall `<args>`       |
| apt_search       | apt search `<args>`          |
| apt_showsrc      | apt showsrc `<args>`         |
| apt_update       | apt update `<args>`          |
| apt_autopurge    | apt autopurge `<args>`       |
| apt_build_dep    | apt build-dep `<args>`       |
| apt_clean        | apt clean `<args>`           |
| apt_dist_upgrade | apt dist-upgrade `<args>`    |
| apt_edit_sources | apt edit-sources `<args>`    |
| apt_help         | apt help `<args>`            |
| apt_list         | apt list `<args>`            |
| apt_policy       | apt policy `<args>`          |
| apt_rdepends     | apt rdepends `<args>`        |
| apt_remove       | apt remove `<args>`          |
| apt_show         | apt show `<args>`            |
| apt_source       | apt source `<args>`          |
| apt_upgrade      | apt upgrade `<args>`         |

## Example

```bash
#!/bin/bash

source lib/package_manager/apt.sh

# moo
apt_moo

# Remove old packages
apt_autoremove

# Update and upgrade packages
apt_update
apt_upgrade
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
