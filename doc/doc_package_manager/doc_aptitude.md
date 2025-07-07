# `lib/package_manager/aptitude.sh` — aptitude Wrapper Library

Bash wrapper for interacting with the `aptitude` package manager. Provides convenient functions to run common `aptitude` commands with standardized success/error output and execution logging.

`aptitude` is commonly used on **Debian GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/aptitude.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### aptitude Command Wrappers

Each function wraps a specific `aptitude` command or flag:

| **Function**             | **Equivalent `aptitude` Command** |
|--------------------------|-----------------------------------|
| aptitude                 | aptitude `<args>`                 |
| aptitude_add_user_tag    | aptitude add-user-tag `<args>`    |
| aptitude_clean           | aptitude clean `<args>`           |
| aptitude_forget_new      | aptitude forget-new `<args>`      |
| aptitude_keep            | aptitude keep `<args>`            |
| aptitude_reinstall       | aptitude reinstall `<args>`       |
| aptitude_search          | aptitude search `<args>`          |
| aptitude_update          | aptitude update `<args>`          |
| aptitude_why_not         | aptitude why-not `<args>`         |
| aptitude_autoclean       | aptitude autoclean `<args>`       |
| aptitude_dist_upgrade    | aptitude dist-upgrade `<args>`    |
| aptitude_full_upgrade    | aptitude full-upgrade `<args>`    |
| aptitude_keep_all        | aptitude keep-all `<args>`        |
| aptitude_remove          | aptitude remove `<args>`          |
| aptitude_show            | aptitude show `<args>`            |
| aptitude_upgrade         | aptitude upgrade `<args>`         |
| aptitude_build_dep       | aptitude build-dep `<args>`       |
| aptitude_download        | aptitude download `<args>`        |
| aptitude_hold            | aptitude hold `<args>`            |
| aptitude_markauto        | aptitude markauto `<args>`        |
| aptitude_remove_user_tag | aptitude remove-user-tag `<args>` |
| aptitude_unhold          | aptitude unhold `<args>`          |
| aptitude_versions        | aptitude versions `<args>`        |
| aptitude_changelog       | aptitude changelog `<args>`       |
| aptitude_forbid_version  | aptitude forbid-version `<args>`  |
| aptitude_install         | aptitude install `<args>`         |
| aptitude_purge           | aptitude purge `<args>`           |
| aptitude_safe_upgrade    | aptitude safe-upgrade `<args>`    |
| aptitude_unmarkauto      | aptitude unmarkauto `<args>`      |
| aptitude_why             | aptitude why `<args>`             |

## Example

```bash
#!/bin/bash

source lib/package_manager/aptitude.sh

# Launch aptitude
aptitude

# Install packages
aptitude_install bash

# Check why systems needs some package
aptitude_why bash
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
