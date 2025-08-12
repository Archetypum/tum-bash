# `lib/package_manager/trizen.sh` — trizen Wrapper Library

**Version:** 0.1.1  
**Author:** Archetypum  
**License:** LGPL-3.0-or-later  
**Project:** [tum-bash](https://github.com/Archetypum/tum-bash.git)

Bash wrapper for interacting with the `trizen` package manager. Provides convenient functions to run common `trizen` commands with standardized success/error output and execution logging.

`trizen` is commonly used on **Arch GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/trizen.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### trizen Command Wrappers

Each function wraps a specific `trizen` command or flag:

| **Function**    | **Equivalent `trizen` Command** |
|-----------------|---------------------------------|
| trizen          | trizen `<args>`                 |
| trizen_sync     | trizen --sync `<args>`          |
| trizen_comments | trizen --comments `<args>`      |
| trizen_get      | trizen --get `<args>`           |
| trizen_remove   | trizen --remove `<args>`        |
| trizen_query    | trizen --query `<args>`         |
| trizen_files    | trizen --files `<args>`         |
| trizen_database | trizen --database `<args>`      |
| trizen_deptest  | trizen --deptest `<args>`       |
| trizen_upgrade  | trizen --upgrade `<args>`       |

## Example

```bash
#!/bin/bash

source lib/package_manager/trizen.sh

# Install packages from AUR
trizen_sync neofetch

# Query AUR packages
trizen_query
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
