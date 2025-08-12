# `lib/package_manager/yum.sh` — yum Wrapper Library

**Version:** 0.1.1  
**Author:** Archetypum  
**License:** LGPL-3.0-or-later  
**Project:** [tum-bash](https://github.com/Archetypum/tum-bash.git)

Bash wrapper for interacting with the `yum` package manager. Provides convenient functions to run common `yum` commands with standardized success/error output and execution logging.

`yum` is commonly used on **RHEL GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/yum.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### yum Command Wrappers

Each function wraps a specific `yum` command or flag:

| **Function**           | **Equivalent `yum` command**    |
|------------------------|---------------------------------|
| yum                    | yum `<args>`                    |
| yum_advisory           | yum advisory `<args>`           |
| yum_autoremove         | yum autoremove `<args>`         |
| yum_check              | yum check `<args>`              |
| yum_check_upgrade      | yum check-upgrade `<args>`      |
| yum_clean              | yum clean `<args>`              |
| yum_distro_sync        | yum distro-sync `<args>`        |
| yum_downgrade          | yum downgrade `<args>`          |
| yum_download           | yum download `<args>`           |
| yum_environment        | yum environment `<args>`        |
| yum_group              | yum group `<args>`              |
| yum_history            | yum history `<args>`            |
| yum_info               | yum info `<args>`               |
| yum_install            | yum install `<args>`            |
| yum_leaves             | yum leaves `<args>`             |
| yum_list               | yum list `<args>`               |
| yum_makecache          | yum makecache `<args>`          |
| yum_mark               | yum mark `<args>`               |
| yum_module             | yum module `<args>`             |
| yum_offline            | yum offline `<args>`            |
| yum_provides           | yum provides `<args>`           |
| yum_reinstall          | yum reinstall `<args>`          |
| yum_remove             | yum remove `<args>`             |
| yum_replay             | yum replay `<args>`             |
| yum_repo               | yum repo `<args>`               |
| yum_repoquery          | yum repoquery `<args>`          |
| yum_search             | yum search `<args>`             |
| yum_swap               | yum swap `<args>`               |
| yum_system_upgrade     | yum system-upgrade `<args>`     |
| yum_upgrade            | yum upgrade `<args>`            |
| yum_versionlock        | yum versionlock `<args>`        |
| yum_debuginfo_install  | yum debuginfo-install `<args>`  |
| yum_offline_distrosync | yum offline-distrosync `<args>` |
| yum_offline_upgrade    | yum offline-upgrade `<args>`    |
| yum_config_manager     | yum config-manager `<args>`     |
| yum_builddep           | yum builddep `<args>`           |
| yum_changelog          | yum changelog `<args>`          |
| yum_copr               | yum copr `<args>`               |
| yum_needs_restarting   | yum needs-restarting `<args>`   |
| yum_repoclosure        | yum repoclosure `<args>`        |
| yum_reposync           | yum reposync `<args>`           |


## Example

```bash
#!/bin/bash

source lib/package_manager/yum.sh

# Update system
yum_update

# Autoremove
yum_autoremove

# Check if your system needs a reboot after updating system
yum_needs_restarting
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
