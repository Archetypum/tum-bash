# `lib/package_manager/yay.sh` — yay Wrapper Library

Bash wrapper for interacting with the `yay` package manager. Provides convenient functions to run common `yay` commands with standardized success/error output and execution logging.

`yay` is commonly used on **Arch GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/yay.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### yay Command Wrappers

Each function wraps a specific `yay` command or flag:

| **Function**     | **Equivalent `yay` command** |
|------------------|------------------------------|
| yay              | yay `<args>`                 |
| yay_help         | yay --build `<args>`         |
| yay_version      | yay --show `<args>`          |
| yay_database     | yay --getpkgbuild `<args>`   |
| yay_files        | yay --web `<args>`           |

## Example

```bash
#!/bin/bash

source lib/package_manager/yay.sh

# Install packages from AUR
yay neofetch
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
