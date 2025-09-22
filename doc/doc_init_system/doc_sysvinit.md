# `lib/init_system/sysvinit.sh` — sysvinit Wrapper Library

**Version:** 1.2.3  
**Author:** Archetypum  
**License:** LGPL-3.0-or-later  
**Project:** [tum-bash](https://github.com/Archetypum/tum-bash.git)

Bash wrapper for interacting with the `sysvinit` init system. Provides convenient functions for issuing `service` commands in scripts with standardized success/error output.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/init_system/sysvinit.sh
```

And use one of the provided functions to interact with the `service` command.

## Functions

### Core Helper

`_run_service <action> <service>`

Runs the `service` command with the given action and service. Outputs a success or error message based on the result.

### Individual Command Wrappers

Each of these functions wraps a corresponding `service` subcommand.

| **Function**              | **Equivalent `service` command**     |
|---------------------------|--------------------------------------|
| start_service             | service `<svc>` start                |
| stop_service              | service `<svc>` stop                 |
| force_reload_service      | service `<svc>` force-reload         |
| restart_service           | service `<svc>` restart              |
| status_service            | service `<svc>` status               |

### Dispatcher

`execute_service <command> <service>`

Dynamically maps the given <command> (e.g., start, stop) to the corresponding wrapper function (e.g., start_service, stop_service) and executes it.

- Returns:
    - 0 on success
    - 1 on failure or unknown command

## Example

```bash
#!/bin/bash

source lib/init_system/sysvinit.sh

SERVICE="ssh"

# Start the service
start_service "$SERVICE"

# Check status
status_service "$SERVICE"

# Restart it
restart_service "$SERVICE"
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
