# `lib/package_manager/pkg_info.sh` — pkg_info Wrapper Library

**Version:** 0.1.1  
**Author:** Archetypum  
**License:** LGPL-3.0-or-later  
**Project:** [tum-bash](https://github.com/Archetypum/tum-bash.git)

Bash wrapper for interacting with the `pkg_info` package management utility. Provides convenient functions to run common `pkg_info` commands with standardized success/error output and execution logging.

`pkg_info` is commonly used on **FreeBSD/OpenBSD/NetBSD**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/pkg_info.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### pkg_info Command Wrappers

Each function wraps a specific `pkg_info` command or flag:

| **Function** | **Equivalent `pkg_info` command** |
|--------------|-----------------------------------|
| pkg_info     | pkg_info `<args>`                 |

## Example

```bash
#!/bin/bash

source lib/package_manager/pkg_info.sh

# Get package info
pkg_info
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
