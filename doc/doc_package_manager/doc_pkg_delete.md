# `lib/package_manager/pkg_delete.sh` — pkg_delete Wrapper Library

**Version:** 1.2.3  
**Author:** Archetypum  
**License:** LGPL-3.0-or-later  
**Project:** [tum-bash](https://github.com/Archetypum/tum-bash.git)

Bash wrapper for interacting with the `pkg_delete` package manager. Provides convenient functions to run common `pkg_delete` commands with standardized success/error output and execution logging.

`pkg_delete` is commonly used on **FreeBSD/OpenBSD/NetBSD**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/pkg_delete.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### pkg_delete Command Wrappers

Each function wraps a specific `pkg_delete` command or flag:

| **Function** | **Equivalent `pkg_delete` command** |
|--------------|-------------------------------------|
| pkg_delete   | pkg_delete `<args>`                 |

## Example

```bash
#!/bin/bash

source lib/package_manager/pkg_delete.sh

# Delete package
pkg_delete bash
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
