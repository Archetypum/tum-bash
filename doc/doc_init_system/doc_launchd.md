# `lib/init_system/launchd.sh` — launchd Wrapper Library

**Version:** 1.2.3  
**Author:** Archetypum  
**License:** LGPL-3.0-or-later  
**Project:** [tum-bash](https://github.com/Archetypum/tum-bash.git)

Bash wrapper for interacting with the `launchd` init system. Provides convenient functions for issuing `launchctl` commands in scripts with standardized success/error output.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/init_system/launchd.sh
```

And use one of the provided functions to interact with the `launchctl` command.

## Functions

### Core Helper

`_run_launchctl <action> <service>`

Runs the `launchctl` command with the given action and service. Outputs a success or error message based on the result.

### Individual Command Wrappers

Each of these functions wraps a corresponding `launchctl` subcommand.

| **Function**                 | **Equivalent launchctl command**     |
|------------------------------|--------------------------------------|
| bootstrap_launchctl          | launchctl bootstrap `<service>`      |
| bootout_launchctl            | launchctl bootout `<service>`        |
| enable_launchctl             | launchctl enable `<service>`         |
| disable_launchctl            | launchctl disable `<service>`        |
| uncache_launchctl            | launchctl uncache `<service>`        |
| kickstart_launchctl          | launchctl kickstart `<service>`      |
| attach_launchctl             | launchctl attach `<service>`         |
| debug_launchctl              | launchctl debug `<service>`          |
| kill_launchctl               | launchctl kill `<service>`           |
| blame_launchctl              | launchctl blame `<service>`          |
| print_launchctl              | launchctl print `<service>`          |
| print_cache_launchctl        | launchctl print-cache `<service>`    |
| print_disabled_launchctl     | launchctl print-disabled `<service>` |
| plist_launchctl              | launchctl plist `<service>`          |
| procinfo_launchctl           | launchctl procinfo `<service>`       |
| hostinfo_launchctl           | launchctl hostinfo `<service>`       |
| resolveport_launchctl        | launchctl resolveport `<service>`    |
| examine_launchctl            | launchctl examine `<service>`        |
| reboot_launchctl             | launchctl reboot `<service>`         |
| error_launchctl              | launchctl error `<service>`          |
| variant_launchctl            | launchctl variant `<service>`        |
| version_launchctl            | launchctl version `<service>`        |
| load_launchctl               | launchctl load `<service>`           |
| unload_launchctl             | launchctl unload `<service>`         |
| submit_launchctl             | launchctl submit `<service>`         |
| remove_launchctl             | launchctl remove `<service>`         |
| start_launchctl              | launchctl start `<service>`          |
| stop_launchctl               | launchctl stop `<service>`           |
| list_launchctl               | launchctl list `<service>`           |
| setenv_launchctl             | launchctl setenv `<service>`         |
| unsetenv_launchctl           | launchctl unsetenv `<service>`       |
| getenv_launchctl             | launchctl getenv `<service>`         |
| export_launchctl             | launchctl export `<service>`         |
| limit_launchctl              | launchctl limit `<service>`          |
| bsexec_launchctl             | launchctl bsexec `<service>`         |
| asuser_launchctl             | launchctl asuser `<service>`         |
| managerpid_launchctl         | launchctl managerpid `<service>`     |
| manageruid_launchctl         | launchctl manageruid `<service>`     |
| managername_launchctl        | launchctl managername `<service>`    |
| help_launchctl               | launchctl help `<service>`           |

### Dispatcher

`execute_launchctl <command> <service>`

Dynamically maps the given <command> (e.g., start, submit, print-cache) to the corresponding wrapper function (e.g., start_launchctl, submit_launchctl) and executes it.

- Returns:
    - 0 on success
    - 1 on failure or unknown command

## Example

```bash
#!/bin/bash

source lib/init_system/launchd.sh

SERVICE="com.example.myservice"

# Dynamically execute a command
execute_launchctl "restart" "$SERVICE"

# Another example
execute_launchctl "print-cache" "$SERVICE"
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
