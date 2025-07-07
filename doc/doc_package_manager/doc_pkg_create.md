# `lib/package_manager/pkg_create.sh` — pkg_create Wrapper Library

Bash wrapper for interacting with the `pkg_create` package management utility. Provides convenient functions to run common `pkg_create` commands with standardized success/error output and execution logging.

`pkg_create` is commonly used on **FreeBSD/OpenBSD/NetBSD**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/pkg_create.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### pkg_create Command Wrappers

Each function wraps a specific `pkg_create` command or flag:

| **Function** | **Equivalent `pkg_create` command** |
|--------------|-------------------------------------|
| pkg_create   | pkg_create `<args>`                 |

## Example

```bash
#!/bin/bash

source lib/package_manager/pkg_create.sh

# Create package
pkg_create example_name
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
