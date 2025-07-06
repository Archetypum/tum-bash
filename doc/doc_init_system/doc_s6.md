# `lib/init_system/s6.sh` — s6 Wrapper Library

Bash wrapper for interacting with the `s6` init system. Provides convenient functions for issuing `s6-rc` commands in scripts with standardized success/error output.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/init_system/s6.sh
```

And use one of the provided functions to interact with the `s6-rc` command.

## Functions

### Core Helper

`_run_s6_rc <action> <service>`

Runs the `s6-rc` command with the given action and service. Outputs a success or error message based on the result.

### Individual Command Wrappers

Each of these functions wraps a corresponding `s6-rc` subcommand.

| **Function**      | **Equivalent s6-rc command**    |
|-------------------|---------------------------------|
| help_s6_rc        | s6-rc help `<service>`          |
| list_s6_rc        | s6-rc list `<service>`          |
| listall_s6_rc     | s6-rc listall `<service>`       |
| diff_s6_rc        | s6-rc diff `<service>`          |
| start_s6_rc       | s6-rc start `<service>`         |
| stop_s6_rc        | s6-rc stop `<service>`          |
| change_s6_rc      | s6-rc change `<service>`        |

### Dispatcher

`execute_s6_rc <command> <service>`

Dynamically maps the given <command> (e.g., start, stop, change) to the corresponding wrapper function (e.g., start_s6_rc, stop_s6_rc, change_s6_rc) and executes it.

- Returns:
    - 0 on success
    - 1 on failure or unknown command

## Example

```bash
#!/bin/bash

source lib/init_system/s6_rc.sh

SERVICE="myservice"

# Show help for a service
help_s6_rc "$SERVICE"

# List services
list_s6_rc "$SERVICE"

# List all services
listall_s6_rc "$SERVICE"

# Show differences in service state
diff_s6_rc "$SERVICE"

# Start a service
start_s6_rc "$SERVICE"

# Stop a service
stop_s6_rc "$SERVICE"

# Change service state
change_s6_rc "$SERVICE"
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
