# `lib/init_system/systemd.sh` — sysvinit Wrapper Library

**Version:** 0.1.1  
**Author:** Archetypum  
**License:** LGPL-3.0-or-later  
**Project:** [tum-bash](https://github.com/Archetypum/tum-bash.git)

Bash wrapper for interacting with the `systemd` init system. Provides convenient functions for issuing `systemctl` commands in scripts with standardized success/error output.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/init_system/systemd.sh
```

And use one of the provided functions to interact with the `systemctl` command.

## Functions

### Core Helper

`_run_systemctl <action> <service>`

Runs the `systemctl` command with the given action and service. Outputs a success or error message based on the result.

### Individual Command Wrappers

Each of these functions wraps a corresponding `systemctl` subcommand.

| **Function**                      | **Equivalent `systemctl` command**       |
|-----------------------------------|------------------------------------------|
| add_requires_systemctl            | systemctl add-requires `<svc>`           |
| add_wants_systemctl               | systemctl add-wants `<svc>`              |
| bind_systemctl                    | systemctl bind `<svc>`                   |
| cancel_systemctl                  | systemctl cancel `<svc>`                 |
| cat_systemctl                     | systemctl cat `<svc>`                    |
| condreload_systemctl              | systemctl condreload `<svc>`             |
| condrestart_systemctl             | systemctl condrestart `<svc>`            |
| condstop_systemctl                | systemctl condstop `<svc>`               |
| daemon_reexec_systemctl           | systemctl daemon-reexec `<svc>`          |
| daemon_reload_systemctl           | systemctl daemon-reload `<svc>`          |
| default_systemctl                 | systemctl default `<svc>`                |
| disable_systemctl                 | systemctl disable `<svc>`                |
| edit_systemctl                    | systemctl edit `<svc>`                   |
| emergency_systemctl               | systemctl emergency `<svc>`              |
| enable_systemctl                  | systemctl enable `<svc>`                 |
| exit_systemctl                    | systemctl exit `<svc>`                   |
| force_reload_systemctl            | systemctl force-reload `<svc>`           |
| get_default_systemctl             | systemctl get-default `<svc>`            |
| halt_systemctl                    | systemctl halt `<svc>`                   |
| help_systemctl                    | systemctl help `<svc>`                   |
| hibernate_systemctl               | systemctl hibernate `<svc>`              |
| hybrid_sleep_systemctl            | systemctl hybrid-sleep `<svc>`           |
| import_environment_systemctl      | systemctl import-environment `<svc>`     |
| is_active_systemctl               | systemctl is-active `<svc>`              |
| is_enabled_systemctl              | systemctl is-enabled `<svc>`             |
| is_failed_systemctl               | systemctl is-failed `<svc>`              |
| isolate_systemctl                 | systemctl isolate `<svc>`                |
| is_system_running_systemctl       | systemctl is-system-running `<svc>`      |
| kexec_systemctl                   | systemctl kexec `<svc>`                  |
| kill_systemctl                    | systemctl kill `<svc>`                   |
| link_systemctl                    | systemctl link `<svc>`                   |
| list_automounts_systemctl         | systemctl list-automounts `<svc>`        |
| list_dependencies_systemctl       | systemctl list-dependencies `<svc>`      |
| list_jobs_systemctl               | systemctl list-jobs `<svc>`              |
| list_machines_systemctl           | systemctl list-machines `<svc>`          |
| list_sockets_systemctl            | systemctl list-sockets `<svc>`           |
| list_timers_systemctl             | systemctl list-timers `<svc>`            |
| list_unit_files_systemctl         | systemctl list-unit-files `<svc>`        |
| list_units_systemctl              | systemctl list-units `<svc>`             |
| log_level_systemctl               | systemctl log-level `<svc>`              |
| log_target_systemctl              | systemctl log-target `<svc>`             |
| mask_systemctl                    | systemctl mask `<svc>`                   |
| mount_image_systemctl             | systemctl mount-image `<svc>`            |
| poweroff_systemctl                | systemctl poweroff `<svc>`               |
| preset_systemctl                  | systemctl preset `<svc>`                 |
| preset_all_systemctl              | systemctl preset-all `<svc>`             |
| reboot_systemctl                  | systemctl reboot `<svc>`                 |
| reenable_systemctl                | systemctl reenable `<svc>`               |
| reload_systemctl                  | systemctl reload `<svc>`                 |
| reload_or_restart_systemctl       | systemctl reload-or-restart `<svc>`      |
| rescue_systemctl                  | systemctl rescue `<svc>`                 |
| reset_failed_systemctl            | systemctl reset-failed `<svc>`           |
| restart_systemctl                 | systemctl restart `<svc>`                |
| revert_systemctl                  | systemctl revert `<svc>`                 |
| service_log_level_systemctl       | systemctl service-log-level `<svc>`      |
| service_log_target_systemctl      | systemctl service-log-target `<svc>`     |
| service_watchdogs_systemctl       | systemctl service-watchdogs `<svc>`      |
| set_default_systemctl             | systemctl set-default `<svc>`            |
| set_environment_systemctl         | systemctl set-environment `<svc>`        |
| property_systemctl                | systemctl property `<svc>`               |
| show_systemctl                    | systemctl show `<svc>`                   |
| show_environment_systemctl        | systemctl show-environment `<svc>`       |
| start_systemctl                   | systemctl start `<svc>`                  |
| status_systemctl                  | systemctl status `<svc>`                 |
| stop_systemctl                    | systemctl stop `<svc>`                   |
| suspend_systemctl                 | systemctl suspend `<svc>`                |
| suspend_then_hibernate_systemctl  | systemctl suspend-then-hibernate `<svc>` |
| switch_root_systemctl             | systemctl switch-root `<svc>`            |
| try_reload_or_restart_systemctl   | systemctl try-reload-or-restart `<svc>`  |
| try_restart_systemctl             | systemctl try-restart `<svc>`            |
| unmask_systemctl                  | systemctl unmask `<svc>`                 |
| unset_environment_systemctl       | systemctl unset-environment `<svc>`      |

### Dispatcher

`execute_systemctl <command> <service>`

Dynamically maps the given <command> (e.g., start, stop) to the corresponding wrapper function (e.g., start_systemctl, stop_systemctl) and executes it.

- Returns:
    - 0 on success
    - 1 on failure or unknown command

## Example

```bash
#!/bin/bash

source lib/init_system/systemd.sh

SERVICE="ufw"

# Start a systemd unit
start_systemctl "$SERVICE"

# Check if the unit is active
is_active_systemctl "$SERVICE"
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
