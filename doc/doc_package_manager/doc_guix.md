# `lib/package_manager/guix.sh` — guix Wrapper Library

**Version:** 1.2.3  
**Author:** Archetypum  
**License:** LGPL-3.0-or-later  
**Project:** [tum-bash](https://github.com/Archetypum/tum-bash.git)

Bash wrapper for interacting with the `guix` package manager. Provides convenient functions to run common `guix` commands with standardized success/error output and execution logging.

`guix` is commonly used on **Guix GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/guix.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### guix Command Wrappers

Each function wraps a specific `guix` command or flag:

| **Function**           | **Equivalent `guix` command** |
|------------------------|-------------------------------|
| guix                   | guix `<args>`                 |
| guix_archive           | guix archive `<args>`         |
| guix_build             | guix build `<args>`           |
| guix_challenge         | guix challenge `<args>`       |
| guix_container         | guix container `<args>`       |
| guix_copy              | guix copy `<args>`            |
| guix_deploy            | guix deploy `<args>`          |
| guix_describe          | guix describe `<args>`        |
| guix_download          | guix download `<args>`        |
| guix_edit              | guix edit `<args>`            |
| guix_environment       | guix environment `<args>`     |
| guix_gc                | guix gc `<args>`              |
| guix_git               | guix git `<args>`             |
| guix_graph             | guix graph `<args>`           |
| guix_hash              | guix hash `<args>`            |
| guix_help              | guix --help `<args>`          |
| guix_home              | guix home `<args>`            |
| guix_import            | guix import `<args>`          |
| guix_install           | guix install `<args>`         |
| guix_lint              | guix lint `<args>`            |
| guix_offload           | guix offload `<args>`         |
| guix_pack              | guix pack `<args>`            |
| guix_package           | guix package `<args>`         |
| guix_processes         | guix processes `<args>`       |
| guix_publish           | guix publish `<args>`         |
| guix_pull              | guix pull `<args>`            |
| guix_refresh           | guix refresh `<args>`         |
| guix_remove            | guix remove `<args>`          |
| guix_repl              | guix repl `<args>`            |
| guix_search            | guix search `<args>`          |
| guix_shell             | guix shell `<args>`           |
| guix_show              | guix show `<args>`            |
| guix_size              | guix size `<args>`            |
| guix_style             | guix style `<args>`           |
| guix_system            | guix system `<args>`          |
| guix_time_machine      | guix time-machine `<args>`    |
| guix_upgrade           | guix upgrade `<args>`         |
| guix_weather           | guix weather `<args>`         |

## Example

```bash
#!/bin/bash

source lib/package_manager/guix.sh

# Get help
guix_help
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
