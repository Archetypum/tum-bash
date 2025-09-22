# `lib/package_manager/apt-sortpkgs.sh` — apt-sortpkgs Wrapper Library

**Version:** 1.2.3  
**Author:** Archetypum  
**License:** LGPL-3.0-or-later  
**Project:** [tum-bash](https://github.com/Archetypum/tum-bash.git)

Bash wrapper for interacting with the `apt-sortpkgs` package management utility. Provides convenient functions to run common `apt-sortpkgs` commands with standardized success/error output and execution logging.

`apt-sortpkgs` is commonly used on **Debian GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/apt_sortpkgs.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### apt-sortpkgs Command Wrappers

Each function wraps a specific `apt-sortpkgs` command or flag:

| **Function** | **Equivalent `apt-sortpkgs` command** |
|--------------|---------------------------------------|
| apt_sortpkgs | apt-sortpkgs `<args>`                 |

## Example

```bash
#!/bin/bash

source lib/package_manager/apt-sortpkgs.sh

# Sort packages
apt_sortpkgs 
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
