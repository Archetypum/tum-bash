# `lib/package_manager/xbps-install.sh` — xbps-install Wrapper Library

**Version:** 0.1.1  
**Author:** Archetypum  
**License:** LGPL-3.0-or-later  
**Project:** [tum-bash](https://github.com/Archetypum/tum-bash.git)

Bash wrapper for interacting with the `xbps-install` package manager. Provides convenient functions to run common `xbps-install` commands with standardized success/error output and execution logging.

`xbps-install` is commonly used on **Void GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/xbps_install.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### xbps-install Command Wrappers

Each function wraps a specific `xbps-install` command or flag:

| **Function** | **Equivalent `xbps-install` command** |
|--------------|---------------------------------------|
| xbps_install | xbps-install `<args>`                 |

## Example

```bash
#!/bin/bash

source lib/package_manager/xbps_install.sh

# Install package
xbps_install bash
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
