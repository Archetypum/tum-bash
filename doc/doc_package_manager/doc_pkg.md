# `lib/package_manager/pkg.sh` — pkg Wrapper Library

Bash wrapper for interacting with the `pkg` package manager. Provides convenient functions to run common `pkg` commands with standardized success/error output and execution logging.

`pkg` is commonly used on **FreeBSD**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/pkg.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### pkg Command Wrappers

Each function wraps a specific `pkg` command or flag:

| **Function**         | **Equivalent `pkg` command**    |
|----------------------|---------------------------------|
| pkg                  | pkg `<args>`                    |
| pkg_add              | pkg add `<args>`                |
| pkg_alias            | pkg alias `<args>`              |
| pkg_all_depends      | pkg all-depends `<args>`        |
| pkg_annotate         | pkg annotate `<args>`           |
| pkg_annotations      | pkg annotations `<args>`        |
| pkg_audit            | pkg audit `<args>`              |
| pkg_autoremove       | pkg autoremove `<args>`         |
| pkg_backup           | pkg backup `<args>`             |
| pkg_bootstrap        | pkg bootstrap `<args>`          |
| pkg_build_depends    | pkg build-depends `<args>`      |
| pkg_check            | pkg check `<args>`              |
| pkg_cinfo            | pkg cinfo `<args>`              |
| pkg_clean            | pkg clean `<args>`              |
| pkg_comment          | pkg comment `<args>`            |
| pkg_convert          | pkg convert `<args>`            |
| pkg_create           | pkg create `<args>`             |
| pkg_csearch          | pkg csearch `<args>`            |
| pkg_delete           | pkg delete `<args>`             |
| pkg_desc             | pkg desc `<args>`               |
| pkg_download         | pkg download `<args>`           |
| pkg_fetch            | pkg fetch `<args>`              |
| pkg_help             | pkg help `<args>`               |
| pkg_iinfo            | pkg iinfo `<args>`              |
| pkg_info             | pkg info `<args>`               |
| pkg_install          | pkg install `<args>`            |
| pkg_isearch          | pkg isearch `<args>`            |
| pkg_leaf             | pkg leaf `<args>`               |
| pkg_list             | pkg list `<args>`               |
| pkg_lock             | pkg lock `<args>`               |
| pkg_noauto           | pkg noauto `<args>`             |
| pkg_options          | pkg options `<args>`            |
| pkg_origin           | pkg options `<args>`            |
| pkg_orphans          | pkg orphans `<args>`            |
| pkg_plugins          | pkg plugins `<args>`            |
| pkg_prime_list       | pkg prime-list `<args>`         |
| pkg_prime_origins    | pkg prime-origins `<args>`      |
| pkg_provided_depends | pkg provided-depends `<args>`   |
| pkg_query            | pkg query `<args>`              |
| pkg_rall_depends     | pkg rall-depends `<args>`       |
| pkg_raw              | pkg raw `<args>`                |
| pkg_rcomment         | pkg rcomment `<args>`           |
| pkg_rdesc            | pkg rdesc `<args>`              |
| pkg_register         | pkg register `<args>`           |
| pkg_remove           | pkg remove `<args>`             |
| pkg_repo             | pkg repo `<args>`               |
| pkg_required_depends | pkg required-depends `<args>`   |
| pkg_roptions         | pkg roptions `<args>`           |
| pkg_rquery           | pkg rquery `<args>`             |
| pkg_runmaintained    | pkg runmaintained `<args>`      |
| pkg_search           | pkg search `<args>`             |
| pkg_set              | pkg set `<args>`                |
| pkg_shared_depends   | pkg shared-depends `<args>`     |
| pkg_shell            | pkg shell `<args>`              |
| pkg_shlib            | pkg shlib `<args>`              |
| pkg_show             | pkg show `<args>`               |
| pkg_size             | pkg size `<args>`               |
| pkg_stats            | pkg stats `<args>`              |
| pkg_unlock           | pkg unlock `<args>`             |
| pkg_unmaintained     | pkg unmaintained `<args>`       |
| pkg_update           | pkg update `<args>`             |
| pkg_updating         | pkg updating `<args>`           |
| pkg_upgrade          | pkg upgrade `<args>`            |
| pkg_version          | pkg version `<args>`            |
| pkg_which            | pkg which `<args>`              |

## Example

```bash
#!/bin/bash

source lib/package_manager/pkg.sh

# Update system
pkg_update

# Autoremove
pkg_autoremove
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
