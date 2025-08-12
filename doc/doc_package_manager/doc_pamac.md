# `lib/package_manager/pamac.sh` — pamac Wrapper Library

**Version:** 0.1.1  
**Author:** Archetypum  
**License:** LGPL-3.0-or-later  
**Project:** [tum-bash](https://github.com/Archetypum/tum-bash.git)

Bash wrapper for interacting with the `pamac` package manager. Provides convenient functions to run common `pamac` commands with standardized success/error output and execution logging.

`pamac` is commonly used on **Arch GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/pamac.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### pamac Command Wrappers

Each function wraps a specific `pamac` command or flag:

| **Function**       | **Equivalent `pamac` command** |
|--------------------|--------------------------------|
| pamac              | pamac `<args>`                 |
| pamac_version      | pamac --version `<args>`       |
| pamac_help         | pamac --help `<args>`          |
| pamac_search       | pamac search `<args>`          |
| pamac_list         | pamac list `<args>`            |
| pamac_info         | pamac info `<args>`            |
| pamac_install      | pamac install `<args>`         |
| pamac_reinstall    | pamac reinstall `<args>`       |
| pamac_remove       | pamac remove `<args>`          |
| pamac_checkupdates | pamac checkupdates `<args>`    |
| pamac_upgrade      | pamac upgrade `<args>`         |
| pamac_update       | pamac update `<args>`          |
| pamac_clone        | pamac clone `<args>`           |
| pamac_build        | pamac build `<args>`           |
| pamac_clean        | pamac clean `<args>`           |


## Example

```bash
#!/bin/bash

source lib/package_manager/pamac.sh

# Get the source code of package
pamac_clone bash

# Get version
pamac_version

# Get help
pamac_help
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
