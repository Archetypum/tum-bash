# `lib/package_manager/dpkg.sh` — dpkg Wrapper Library

Bash wrapper for interacting with the `dpkg` package manager. Provides convenient functions to run common `dpkg` commands with standardized success/error output and execution logging.

`dpkg` is commonly used on **Debian GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/dpkg.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### dpkg Command Wrappers

Each function wraps a specific `dpkg` command or flag:

| **Function**                     | **Equivalent `dpkg` command**                |
|----------------------------------|----------------------------------------------|
| dpkg                             | dpkg `<args>`                                |
| dpkg_abort_after                 | dpkg --abort-after `<args>`                  |
| dpkg_add_architecture            | dpkg --add-architecture `<args>`             |
| dpkg_audit                       | dpkg --audit `<args>`                        |
| dpkg_auto_deconfigure            | dpkg --auto-deconfigure `<args>`             |
| dpkg_clear_avail                 | dpkg --clear-avail `<args>`                  |
| dpkg_clear_selection             | dpkg --clear-selections `<args>`             |
| dpkg_compare_versions            | dpkg --compare-versions `<args>`             |
| dpkg_configure                   | dpkg --configure `<args>`                    |
| dpkg_field                       | dpkg --field `<args>`                        |
| dpkg_forget_old_unavail          | dpkg --forget-old-unavail `<args>`           |
| dpkg_get_selections              | dpkg --get-selections `<args>`               |
| dpkg_help                        | dpkg --help `<args>`                         |
| dpkg_install                     | dpkg --install `<args>`                      |
| dpkg_list                        | dpkg --list `<args>`                         |
| dpkg_listfiles                   | dpkg --listfiles `<args>`                    |
| dpkg_merge_avail                 | dpkg --merge-avail `<args>`                  |
| dpkg_predep_package              | dpkg --predep-package `<args>`               |
| dpkg_print_architecture          | dpkg --print-architecture `<args>`           |
| dpkg_print_avail                 | dpkg --print-avail `<args>`                  |
| dpkg_print_foreign_architectures | dpkg --print-foreign-architectures `<args>`  |
| dpkg_purge                       | dpkg --purge `<args>`                        |
| dpkg_record_avail                | dpkg --record-avail `<args>`                 |
| dpkg_remove                      | dpkg --remove `<args>`                       |
| dpkg_remove_architecture         | dpkg --remove-architecture `<args>`          |
| dpkg_search                      | dpkg --search `<args>`                       |
| dpkg_set_selections              | dpkg --set-selections `<args>`               |
| dpkg_status                      | dpkg --status `<args>`                       |
| dpkg_unpack                      | dpkg --unpack `<args>`                       |
| dpkg_update_avail                | dpkg --update-avail `<args>`                 |
| dpkg_verify                      | dpkg --verify `<args>`                       |
| dpkg_version                     | dpkg --version `<args>`                      |

## Example

```bash
#!/bin/bash

source lib/package_manager/dpkg.sh

# Get version
dpkg_version

# Add 32-bit architecture
dpkg_add_architecture i386
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
