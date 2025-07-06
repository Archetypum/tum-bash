# `lib/init_system.dinit.sh`

Bash wrapper for interacting with the `dinit` init system. Provides convenient functions for issuing `dinitctl` commands in scripts with standardized success/error output.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/init_system.dinit.sh
```

Use one of the provided functions to interact with the `dinitctl` command.

## Functions

### Core Helper

`_run_dinitctl <action> <service>`

Runs the `dinitctl` command with the given action and service. Outputs a success or error message based on the result.

### Individual Command Wrappers

Each of these functions wraps a corresponding dinitctl subcommand.

| **Function**        | **Equivalent dinitctl command** |
|---------------------|---------------------------------|
| start_dinitctl      | dinitctl start `<service>`      |
| stop_dinitctl       | dinitctl stop `<service>`       |
| status_dinitctl     | dinitctl status `<service>`     |
| is_started_dinitctl | dinitctl is-started `<service>` |
| is_failed_dinitctl  | dinitctl is-failed `<service>`  |
| restart_dinitctl    | dinitctl restart `<service>`    |
| wake_dinitctl       | dinitctl wake `<service>`       |
| release_dinitctl    | dinitctl release `<service>`    |
| unpin_dinitctl      | dinitctl unpin `<service>`      |
| unload_dinitctl     | dinitctl unload `<service>`     |
| reload_dinitctl     | dinitctl reload `<service>`     |
| list_dinitctl       | dinitctl list `<service>`       |
| shutdown_dinitctl   | dinitctl shutdown `<service>`   |
| add_dep_dinitctl    | dinitctl add-dep `<service>`    |
| rm_dep_dinitctl     | dinitctl rm-dep `<service>`     |
| enable_dinitctl     | dinitctl enable `<service>`     |
| disable_dinitctl    | dinitctl disable `<service>`    |
| trigger_dinitctl    | dinitctl trigger `<service>`    |
| untrigger_dinitctl  | dinitctl untrigger `<service>`  |
| setenv_dinitctl     | dinitctl setenv `<service>`     |
| unsetenv_dinitctl   | dinitctl unsetenv `<service>`   |
| catalog_dinitctl    | dinitctl catalog `<service>`    |
| signal_dinitctl     | dinitctl signal `<service>`     |

### Dispatcher

`execute_dinitctl <command> <service>`

Dynamically maps the given <command> (e.g., start, restart, enable) to the appropriate wrapper function (e.g., start_dinitctl) and executes it.

- Returns:
  - 0 on success
  - 1 on failure or unknown command

## Example

```bash
#!/bin/bash

source lib/init_system.dinit.sh

SERVICE="nginx"

# Start a service
start_dinitctl "$SERVICE"

# Check if it's started
is_started_dinitctl "$SERVICE"

# Use dynamic dispatcher
execute_dinitctl "restart" "$SERVICE"
```

## License

This module is released under the [GNU Lesser General Public License v3.0 or later](https://www.gnu.org/licenses/lgpl-3.0.html).