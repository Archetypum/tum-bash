# `lib/package_manager/apk.sh` — apk Wrapper Library

Bash wrapper for interacting with the `apk` package manager. Provides convenient functions to run common `apk` commands with standardized success/error output and execution logging.

`apk` is commonly used on **Alpine Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/apk.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### apk Command Wrappers

Each function wraps a specific `apk` command or flag:

| **Function**        | **Equivalent `apk` command**          |
|---------------------|---------------------------------------|
| apk                 | apk `<args>`                          |
| apk_help            | apk --help `<args>`                   |
| apk_add             | apk add `<args>`                      |
| apk_del             | apk del `<args>`                      |
| apk_fix             | apk fix `<args>`                      |
| apk_update          | apk update `<args>`                   |
| apk_upgrade         | apk upgrade `<args>`                  |
| apk_cache           | apk cache `<args>`                    |
| apk_info            | apk info `<args>`                     |
| apk_list            | apk list `<args>`                     |
| apk_dot             | apk dot `<args>`                      |
| apk_policy          | apk policy `<args>`                   |
| apk_search          | apk search `<args>`                   |
| apk_index           | apk index `<args>`                    |
| apk_fetch           | apk fetch `<args>`                    |
| apk_manifest        | apk manifest `<args>`                 |
| apk_verify          | apk verify `<args>`                   |
| apk_audit           | apk audit `<args>`                    |
| apk_stats           | apk stats `<args>`                    |
| apk_version         | apk version `<args>`                  |

## Example

```bash
#!/bin/bash

source lib/package_manager/apk.sh

# Get help
apk_help

# Install packages
apk_add htop

# Update and upgrade packages
apk_update
apk_upgrade
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
