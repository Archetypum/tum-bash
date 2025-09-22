# `lib/package_manager/apt_listchanges.sh` — apt-listchanges Wrapper Library

**Version:** 1.2.3  
**Author:** Archetypum  
**License:** LGPL-3.0-or-later  
**Project:** [tum-bash](https://github.com/Archetypum/tum-bash.git)

Bash wrapper for interacting with the `apt-listchanges` package management utility. Provides convenient functions to run common `apt-listchanges` commands with standardized success/error output and execution logging.

`apt-listchanges` is commonly used on **Debian GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/apt_listchanges.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### apt-listchanges Command Wrappers

Each function wraps a specific `apt-listchanges` command or flag:

| **Function**    | **Equivalent `apt-listchanges` command** |
|-----------------|------------------------------------------|
| apt_listchanges | apt-listchanges `<args>`                 |

## Example

```bash
#!/bin/bash

source lib/package_manager/apt_listchanges.sh

# List changes in packages on the system
apt_listchanges
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
