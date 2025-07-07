# `lib/package_manager/xbps-remove.sh` — xbps-remove Wrapper Library

Bash wrapper for interacting with the `xbps-remove` package manager. Provides convenient functions to run common `xbps-remove` commands with standardized success/error output and execution logging.

`xbps-remove` is commonly used on **Void GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/xbps_remove.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### xbps-remove Command Wrappers

Each function wraps a specific `xbps-remove` command or flag:

| **Function** | **Equivalent `xbps-remove` command** |
|--------------|--------------------------------------|
| xbps_remove  | xbps-remove `<args>`                 |

## Example

```bash
#!/bin/bash

source lib/package_manager/xbps-remove.sh

# Remove package
xbps_remove bash
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
