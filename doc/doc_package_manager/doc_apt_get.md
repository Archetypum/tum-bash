# `lib/package_manager/apt_get.sh` — apt-get Wrapper Library

**Version:** 1.2.3  
**Author:** Archetypum  
**License:** LGPL-3.0-or-later  
**Project:** [tum-bash](https://github.com/Archetypum/tum-bash.git)

Bash wrapper for interacting with the `apt-get` package manager. Provides convenient functions to run common `apt-get` commands with standardized success/error output and execution logging.

`apt-get` is commonly used on **Debian GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/apt_get.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### apt-get Command Wrappers

Each function wraps a specific `apt-get` command or flag:

| **Function**            | **Equivalent `apt-get` command**  |
|-------------------------|-----------------------------------|
| apt_get                 | apt-get `<args>`                  |
| apt_get_autoclean       | apt-get autoclean `<args>`        |
| apt_get_build_dep       | apt-get build-dep `<args>`        |
| apt_get_check           | apt-get check `<args>`            |
| apt_get_dist_upgrade    | apt-get dist-upgrade `<args>`     |
| apt_get_dselect_upgrade | apt-get dselect-upgrade `<args>`  |
| apt_get_install         | apt-get install `<args>`          |
| apt_get_remove          | apt-get remove `<args>`           |
| apt_get_update          | apt-get update `<args>`           |
| apt_get_autoremove      | apt-get autoremove `<args>`       |
| apt_get_changelog       | apt-get changelog `<args>`        |
| apt_get_clean           | apt-get clean `<args>`            |
| apt_get_download        | apt-get download `<args>`         |
| apt_get_indextargets    | apt-get indextargets `<args>`     |
| apt_get_purge           | apt-get purge `<args>`            |
| apt_get_source          | apt-get source `<args>`           |
| apt_get_upgrade         | apt-get upgrade `<args>`          |


## Example

```bash
#!/bin/bash

source lib/package_manager/apt_get.sh

# Update && Upgrade
apt_get_update
apt_get_upgrade

# Install packages
apt_get_install bash

# Clean
apt_get_clean
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
