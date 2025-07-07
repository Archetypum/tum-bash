# `lib/package_manager/pkg_add.sh` — pkg_add Wrapper Library

Bash wrapper for interacting with the `pkg_add` package manager. Provides convenient functions to run common `pkg_add` commands with standardized success/error output and execution logging.

`pkg_add` is commonly used on **FreeBSD/OpenBSD/NetBSD**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/pkg_add.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### pkg_add Command Wrappers

Each function wraps a specific `pkg_add` command or flag:

| **Function** | **Equivalent `pkg_add` command** |
|--------------|----------------------------------|
| pkg_add      | pkg_add `<args>`                 |

## Example

```bash
#!/bin/bash

source lib/package_manager/pkg_add.sh

# Add package
pkg_add bash
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
