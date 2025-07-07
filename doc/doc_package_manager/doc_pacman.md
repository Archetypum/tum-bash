# `lib/package_manager/pacman.sh` — pacman Wrapper Library

Bash wrapper for interacting with the `pacman` package manager. Provides convenient functions to run common `pacman` commands with standardized success/error output and execution logging.

`pacman` is commonly used on **Arch GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/pacman.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### Pacman Command Wrappers

Each function wraps a specific `pacman` command or flag:

| **Function**        | **Equivalent `pacman` command**  |
|---------------------|----------------------------------|
| pacman              | pacman `<args>`                  |
| pacman_help         | pacman --help `<args>`           |
| pacman_version      | pacman --version `<args>`        |
| pacman_database     | pacman --database `<args>`       |
| pacman_files        | pacman --files `<args>`          |
| pacman_query        | pacman --query `<args>`          |
| pacman_remove       | pacman --remove `<args>`         |
| pacman_sync         | pacman --sync `<args>`           |
| pacman_deptest      | pacman --deptest `<args>`        |
| pacman_upgrade      | pacman --upgrade `<args>`        |

## Example

```bash
#!/bin/bash

source lib/package_manager/pacman.sh

# Show pacman version
pacman_version

# Synchronize package databases
pacman_sync htop

# Query for installed package
pacman_query -s bash
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
