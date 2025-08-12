# `lib/package_manager/dnf.sh` — dnf Wrapper Library

**Version:** 0.1.1  
**Author:** Archetypum  
**License:** LGPL-3.0-or-later  
**Project:** [tum-bash](https://github.com/Archetypum/tum-bash.git)

Bash wrapper for interacting with the `dnf` package manager. Provides convenient functions to run common `dnf` commands with standardized success/error output and execution logging.

`dnf` is commonly used on **RHEL GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/dnf.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### dnf Command Wrappers

Each function wraps a specific `dnf` command or flag:

| **Function**           | **Equivalent `dnf` command**    |
|------------------------|---------------------------------|
| dnf                    | dnf `<args>`                    |
| dnf_advisory           | dnf advisory `<args>`           |
| dnf_autoremove         | dnf autoremove `<args>`         |
| dnf_check              | dnf check `<args>`              |
| dnf_check_upgrade      | dnf check-upgrade `<args>`      |
| dnf_clean              | dnf clean `<args>`              |
| dnf_distro_sync        | dnf distro-sync `<args>`        |
| dnf_downgrade          | dnf downgrade `<args>`          |
| dnf_download           | dnf download `<args>`           |
| dnf_environment        | dnf environment `<args>`        |
| dnf_group              | dnf group `<args>`              |
| dnf_history            | dnf history `<args>`            |
| dnf_info               | dnf info `<args>`               |
| dnf_install            | dnf install `<args>`            |
| dnf_leaves             | dnf leaves `<args>`             |
| dnf_list               | dnf list `<args>`               |
| dnf_makecache          | dnf makecache `<args>`          |
| dnf_mark               | dnf mark `<args>`               |
| dnf_module             | dnf module `<args>`             |
| dnf_offline            | dnf offline `<args>`            |
| dnf_provides           | dnf provides `<args>`           |
| dnf_reinstall          | dnf reinstall `<args>`          |
| dnf_remove             | dnf remove `<args>`             |
| dnf_replay             | dnf replay `<args>`             |
| dnf_repo               | dnf repo `<args>`               |
| dnf_repoquery          | dnf repoquery `<args>`          |
| dnf_search             | dnf search `<args>`             |
| dnf_swap               | dnf swap `<args>`               |
| dnf_system_upgrade     | dnf system-upgrade `<args>`     |
| dnf_upgrade            | dnf upgrade `<args>`            |
| dnf_versionlock        | dnf versionlock `<args>`        |
| dnf_debuginfo_install  | dnf debuginfo-install `<args>`  |
| dnf_offline_distrosync | dnf offline-distrosync `<args>` |
| dnf_offline_upgrade    | dnf offline-upgrade `<args>`    |
| dnf_config_manager     | dnf config-manager `<args>`     |
| dnf_builddep           | dnf builddep `<args>`           |
| dnf_changelog          | dnf changelog `<args>`          |
| dnf_copr               | dnf copr `<args>`               |
| dnf_needs_restarting   | dnf needs-restarting `<args>`   |
| dnf_repoclosure        | dnf repoclosure `<args>`        |
| dnf_reposync           | dnf reposync `<args>`           |

## Example

```bash
#!/bin/bash

source lib/package_manager/dnf.sh

# Update system
dnf_update

# Autoremove
dnf_autoremove

# Check if your system needs a reboot after updating system
dnf_needs_restarting
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
