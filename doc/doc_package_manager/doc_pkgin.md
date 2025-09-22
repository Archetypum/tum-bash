# `lib/package_manager/pkgin.sh` — brew Wrapper Library

**Version:** 1.2.3  
**Author:** Archetypum  
**License:** LGPL-3.0-or-later  
**Project:** [tum-bash](https://github.com/Archetypum/tum-bash.git)

Bash wrapper for interacting with the `pkgin` package manager. Provides convenient functions to run common `pkgin` commands with standardized success/error output and execution logging.

`pkgin` is commonly used on **NetBSD**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/pkgin.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### pkgin Command Wrappers

Each function wraps a specific `pkgin` command or flag:

| **Function**              | **Equivalent `pkgin` command**     |
|---------------------------|------------------------------------|
| pkgin                     | pkgin `<args>`                     |
| pkgin_list                | pkgin list `<args>`                |
| pkgin_avail               | pkgin avail `<args>`               |
| pkgin_search              | pkgin search `<args>`              |
| pkgin_install             | pkgin install `<args>`             |
| pkgin_update              | pkgin update `<args>`              |
| pkgin_upgrade             | pkgin upgrade `<args>`             |
| pkgin_full_upgrade        | pkgin full-upgrade `<args>`        |
| pkgin_remove              | pkgin remove `<args>`              |
| pkgin_keep                | pkgin keep `<args>`                |
| pkgin_unkeep              | pkgin unkeep `<args>`              |
| pkgin_export              | pkgin export `<args>`              |
| pkgin_import              | pkgin import `<args>`              |
| pkgin_show_keep           | pkgin show-keep `<args>`           |
| pkgin_show_no_keep        | pkgin show-no-keep `<args>`        |
| pkgin_autoremove          | pkgin autoremove `<args>`          |
| pkgin_clean               | pkgin clean `<args>`               |
| pkgin_show_deps           | pkgin show-deps `<args>`           |
| pkgin_show_full_deps      | pkgin show-full-deps `<args>`      |
| pkgin_show_rev_deps       | pkgin show-rev-deps `<args>`       |
| pkgin_provides            | pkgin provides `<args>`            |
| pkgin_requires            | pkgin requires `<args>`            |
| pkgin_show_category       | pkgin show-category `<args>`       |
| pkgin_show_pkg_category   | pkgin show-pkg-category `<args>`   |
| pkgin_show_all_categories | pkgin show-all-categories `<args>` |
| pkgin_pkg_content         | pkgin pkg-content `<args>`         |
| pkgin_pkg_descr           | pkgin pkg-descr `<args>`           |
| pkgin_pkg_build_defs      | pkgin pkg-build-defs `<args>`      |
| pkgin_stats               | pkgin stats `<args>`               |

## Example

```bash
#!/bin/bash

source lib/package_manager/pkgin.sh

# List binary packages on the system
pkgin_list

# Update && Upgrade the system
pkgin_update
pkgin_upgrade

# Search for packages
pkgin_search bash
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
