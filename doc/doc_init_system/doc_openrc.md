# `lib/init_system/openrc.sh` — openrc Wrapper Library

Bash wrapper for interacting with the `openrc` init system. Provides convenient functions for issuing `rc-service` commands in scripts with standardized success/error output.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/init_system/openrc.sh
```

And use one of the provided functions to interact with the `rc-service` command.

## Functions

### Core Helper

`_run_rc_service <action> <service>`

Runs the `rc-service` command with the given action and service. Outputs a success or error message based on the result.

### Individual Command Wrappers

Each of these functions wraps a corresponding `rc-service` subcommand.

| **Function**                | **Equivalent `rc-service` command** |
|-----------------------------|-------------------------------------| 
| start_rc_service            | rc-service `<svc>` start            |
| stop_rc_service             | rc-service `<svc>` stop             |
| reload_rc_service           | rc-service `<svc>` reload           |
| force_reload_rc_service     | rc-service `<svc>` force-reload     |
| restart_rc_service          | rc-service `<svc>` restart          |
| try_restart_rc_service      | rc-service `<svc>` try-restart      |
| status_rc_service           | rc-service `<svc>` status           |

### Dispatcher

`execute_rc_service <command> <service>`

Dynamically maps the given <command> (e.g., start, stop) to the corresponding wrapper function (e.g., start_rc_service, stop_rc_service) and executes it.

- Returns:
    - 0 on success
    - 1 on failure or unknown command

## Example

```bash
#!/bin/bash

source lib/init_system/openrc.sh

SERVICE="nginx"

# Start the service
start_rc_service "$SERVICE"

# Check service status
status_rc_service "$SERVICE"

# Restart the service
restart_rc_service "$SERVICE"
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
