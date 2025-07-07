# `lib/package_manager/apt_cdrom.sh` — apt-cdrom Wrapper Library

Bash wrapper for interacting with the `apt-cdrom` package management utility. Provides convenient functions to run common `apt-cdrom` commands with standardized success/error output and execution logging.

`apt-cdrom` is commonly used on **Debian GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/apt_cdrom.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### apt-cdrom Command Wrappers

Each function wraps a specific `apt-cdrom` command or flag:

| **Function**        | **Equivalent `apt-cdrom` command** |
|---------------------|------------------------------------|
| apt_cdrom           | apt-cdrom `<args>`                 |
| apt_cdrom_add       | apt-cdrom add `<args>`             |
| apt_cdrom_ident     | apt-cdrom ident `<args>`           |

## Example

```bash
#!/bin/bash

source lib/package_manager/apt_cdrom.sh

# Get help
apt_cdrom --help
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
