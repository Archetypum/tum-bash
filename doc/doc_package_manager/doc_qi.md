# `lib/package_manager/qi.sh` — qi Wrapper Library

**Version:** 0.1.1  
**Author:** Archetypum  
**License:** LGPL-3.0-or-later  
**Project:** [tum-bash](https://github.com/Archetypum/tum-bash.git)

Bash wrapper for interacting with the `qi` package manager. Provides convenient functions to run common `qi` commands with standardized success/error output and execution logging.

`qi` is commonly used on **Dragora GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/qi.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### qi Command Wrappers

Each function wraps a specific `qi` command or flag:

| **Function** | **Equivalent `qi` command** |
|--------------|-----------------------------|
| qi           | qi `<args>`                 |
| qi_warn      | qi warn `<args>`            |
| qi_install   | qi install `<args>`         |
| qi_remove    | qi remove `<args>`          |
| qi_upgrade   | qi upgrade `<args>`         |
| qi_extract   | qi extract `<args>`         |
| qi_create    | qi create `<args>`          |
| qi_build     | qi build `<args>`           |
| qi_order     | qi order `<args>`           |

## Example

```bash
#!/bin/bash

source lib/package_manager/qi.sh

# Install package
qi_install example_package

# Upgrade packages
qi_upgrade
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
