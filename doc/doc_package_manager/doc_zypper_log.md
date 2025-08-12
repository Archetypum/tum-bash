# `lib/package_manager/zypper_log.sh` — zypper-log Wrapper Library

**Version:** 0.1.1  
**Author:** Archetypum  
**License:** LGPL-3.0-or-later  
**Project:** [tum-bash](https://github.com/Archetypum/tum-bash.git)

Bash wrapper for interacting with the `zypper-log` package management utility. Provides convenient functions to run common `zypper-log` commands with standardized success/error output and execution logging.

`zypper-log` is commonly used on **SUSE GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/zypper_log.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### zypper-log Command Wrappers

Each function wraps a specific `zypper-log` command or flag:

| **Function**                  | **Equivalent `zypper-log` command** |
|-------------------------------|-------------------------------------|
| zypper_log                    | zypper-log `<args>`                 |

## Example

```bash
#!/bin/bash

source lib/package_manager/zypper_log.sh

# Log package changes 
zypper_log
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
