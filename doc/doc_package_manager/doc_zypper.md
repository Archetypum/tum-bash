# `lib/package_manager/zypper.sh` — zypper Wrapper Library

**Version:** 1.2.3  
**Author:** Archetypum  
**License:** LGPL-3.0-or-later  
**Project:** [tum-bash](https://github.com/Archetypum/tum-bash.git)

Bash wrapper for interacting with the `zypper` package manager. Provides convenient functions to run common `zypper` commands with standardized success/error output and execution logging.

`zypper` is commonly used on **SUSE GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/zypper.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### zypper Command Wrappers

Each function wraps a specific `zypper` command or flag:

| **Function**                  | **Equivalent `zypper` command**        |
|-------------------------------|----------------------------------------|
| zypper                        | zypper `<args>`                        |
| zypper_addlocale              | zypper addlocale `<args>`              |
| zypper_addlock                | zypper addlock `<args>`                |
| zypper_addrepo                | zypper addrepo `<args>`                |
| zypper_addservice             | zypper addservice `<args>`             |
| zypper_appsteam_cache         | zypper appstream-cache `<args>`        |
| zypper_clean                  | zypper clean `<args>`                  |
| zypper_cleanlocks             | zypper cleanlocks `<args>`             |
| zypper_dist_upgrade           | zypper dist-upgrade `<args>`           |
| zypper_download               | zypper download `<args>`               |
| zypper_help                   | zypper help `<args>`                   |
| zypper_info                   | zypper info `<args>`                   |
| zypper_install                | zypper install `<args>`                |
| zypper_install_new_recommends | zypper install-new-recommends `<args>` |
| zypper_licenses               | zypper licenses `<args>`               |
| zypper_list_patches           | zypper list-patches `<args>`           |
| zypper_list_updates           | zypper list-updates `<args>`           |
| zypper_locales                | zypper locales `<args>`                |
| zypper_locks                  | zypper locks `<args>`                  |
| zypper_modifyrepo             | zypper modifyrepo `<args>`             |
| zypper_modifyservice          | zypper modifyservice `<args>`          |
| zypper_needs_rebooting        | zypper needs-rebooting `<args>`        |
| zypper_packages               | zypper packages `<args>`               |
| zypper_patch                  | zypper patch `<args>`                  |
| zypper_patch_check            | zypper patch-check `<args>`            |
| zypper_patches                | zypper patches `<args>`                |
| zypper_patch_info             | zypper patch-info `<args>`             |
| zypper_patterns               | zypper patterns `<args>`               |
| zypper_product_info           | zypper product-info `<args>`           |
| zypper_products               | zypper products `<args>`               |
| zypper_purge_kernels          | zypper purge-kernels `<args>`          |
| zypper_ps                     | zypper ps `<args>`                     |
| zypper_refresh                | zypper refresh `<args>`                |
| zypper_refresh_services       | zypper refresh-services `<args>`       |
| zypper_remove                 | zypper remove `<args>`                 |
| zypper_removelocale           | zypper removelocale `<args>`           |
| zypper_removelock             | zypper removelock `<args>`             |
| zypper_removeptf              | zypper removeptf `<args>`              |
| zypper_removerepo             | zypper removerepo `<args>`             |
| zypper_removeservice          | zypper removeservice `<args>`          |
| zypper_renamerepo             | zypper renamerepo `<args>`             |
| zypper_repos                  | zypper repos `<args>`                  |
| zypper_search                 | zypper search `<args>`                 |
| zypper_services               | zypper services `<args>`               |
| zypper_shell                  | zypper shell `<args>`                  |
| zypper_source_download        | zypper source-download `<args>`        |
| zypper_source_install         | zypper source-install `<args>`         |
| zypper_subcommand             | zypper subcommand `<args>`             |
| zypper_system_architecture    | zypper system-architecture `<args>`    |
| zypper_targetos               | zypper targetos `<args>`               |
| zypper_update                 | zypper update `<args>`                 |
| zypper_versioncmp             | zypper versioncmp `<args>`             |
| zypper_verify                 | zypper verify `<args>`                 |
| zypper_what_provides          | zypper what-provides `<args>`          |

## Example

```bash
#!/bin/bash

source lib/package_manager/zypper.sh

# Update ** Upgrade the system
zypper_refresh
zypper_update

# Get help
zypper_help
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
