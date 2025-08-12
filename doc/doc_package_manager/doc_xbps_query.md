# `lib/package_manager/xbps_query.sh` — xbps-query Wrapper Library

**Version:** 0.1.1  
**Author:** Archetypum  
**License:** LGPL-3.0-or-later  
**Project:** [tum-bash](https://github.com/Archetypum/tum-bash.git)

Bash wrapper for interacting with the `xbps-query` package management utility. Provides convenient functions to run common `xbps-query` commands with standardized success/error output and execution logging.

`xbps-query` is commonly used on **Arch GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/xbps_query.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### xbps_query Command Wrappers

Each function wraps a specific `xbps-query` command or flag:

| **Function**                | **Equivalent `xbps-query` Command**    |
|-----------------------------|----------------------------------------|
| xbps_query                  | xbps-query `<args>`                    |
| xbps_query_list_pkgs        | xbps-query --list-pkgs `<args>`        |
| xbps_query_list_hold_pkgs   | xbps-query --list-hold-pkgs `<args>`   |
| xbps_query_list_repos       | xbps-query --list-repos `<args>`       |
| xbps_query_list_manual_pkgs | xbps-query --list-manual-pkgs `<args>` |
| xbps_query_list_orphans     | xbps-query --list-orphans `<args>`     |
| xbps_query_ownedby          | xbps-query --ownedby `<args>`          |
| xbps_query_show             | xbps-query --show `<args>`             |
| xbps_query_search           | xbps-query --search `<args>`           |
| xbps_query_files            | xbps-query --files `<args>`            |
| xbps_query_deps             | xbps-query --deps `<args>`             |
| xbps_query_revdeps          | xbps-query --revdeps `<args>`          |
| xbps_query_cat              | xbps-query cat `<args>`                |

## Example

```bash
#!/bin/bash

source lib/package_manager/xbps_query.sh

# Query package
xbps_query bash
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
