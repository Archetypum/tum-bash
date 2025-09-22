# `lib/package_manager/aptitude-create-state-bundle.sh` — aptitude-create-state-bundle Wrapper Library

**Version:** 1.2.3  
**Author:** Archetypum  
**License:** LGPL-3.0-or-later  
**Project:** [tum-bash](https://github.com/Archetypum/tum-bash.git)

Bash wrapper for interacting with the `aptitude-create-state-bundle` package management utility. Provides convenient functions to run common `aptitude-create-state-bundle` commands with standardized success/error output and execution logging.

`aptitude-create-state-bundle` is commonly used on **Debian GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/aptitude_create_state_bundle.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### aptitude-create-state-bundle Command Wrappers

Each function wraps a specific `aptitude-create-state-bundle` command or flag:

| **Function**                 | **Equivalent `aptitude-create-state-bundle` command** |
|------------------------------|-------------------------------------------------------|
| aptitude_create_state_bundle | aptitude-create-state-bundle `<args>`                 |

## Example

```bash
#!/bin/bash

source lib/package_manager/aptitude_create_state_bundle.sh

# Create state bundle
aptitude_create_state_bundle
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
