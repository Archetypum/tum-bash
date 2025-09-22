# `lib/init_system/runit.sh` — dinit Wrapper Library

**Version:** 1.2.3  
**Author:** Archetypum  
**License:** LGPL-3.0-or-later  
**Project:** [tum-bash](https://github.com/Archetypum/tum-bash.git)

Bash wrapper for interacting with the `runit` init system. Provides convenient functions for issuing `sv` commands in scripts with standardized success/error output.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/init_system/runit.sh
```

And use one of the provided functions to interact with the `sv` command.

## Functions

### Core Helper

`_run_sv <action> <service>`

Runs the `sv` command with the given action and service. Outputs a success or error message based on the result.

### Individual Command Wrappers

Each of these functions wraps a corresponding sv subcommand.

| **Function**      | **Equivalent `sv` Command**  |
|-------------------|------------------------------|
| status_sv         | sv status `<svc>`            |
| up_sv             | sv up `<svc>`                |
| down_sv           | sv down `<svc>`              |
| once_sv           | sv once `<svc>`              |
| pause_sv          | sv pause `<svc>`             |
| cont_sv           | sv cont `<svc>`              |
| hup_sv            | sv hup `<svc>`               |
| alarm_sv          | sv alarm `<svc>`             |
| interrupt_sv      | sv interrupt `<svc>`         |
| quit_sv           | sv quit `<svc>`              |
| one_sv            | sv 1 `<svc>`                 |
| two_sv            | sv 2 `<svc>`                 |
| term_sv           | sv term `<svc>`              |
| kill_sv           | sv kill `<svc>`              |
| exit_sv           | sv exit `<svc>`              |
| start_sv          | sv start `<svc>`             |
| stop_sv           | sv stop `<svc>`              |
| reload_sv         | sv reload `<svc>`            |
| restart_sv        | sv restart `<svc>`           |
| shutdown_sv       | sv shutdown `<svc>`          |
| force_stop_sv     | sv force-stop `<svc>`        |
| force_restart_sv  | sv force-restart `<svc>`     |
| force_shutdown_sv | sv force-shutdown `<svc>`    |
| try_restart_sv    | sv try-restart `<svc>`       |
| check_sv          | sv check `<svc>`             |

### Dispatcher

`execute_sv <command> <service>`

Dynamically maps the given <command> (e.g., status, start) to the appropriate wrapper function (e.g., start_sv, status_sv) and executes it.

- Returns:
  - 0 on success
  - 1 on failure or unknown command

## Example

```bash
#!/bin/bash

source lib/init_system/runit.sh

SERVICE="apache"

# Check service status
status_sv "$SERVICE"

# Start the service
start_sv "$SERVICE"

# Restart the service
restart_sv "$SERVICE"

# Gracefully stop the service
stop_sv "$SERVICE"

# Forcefully terminate the service
kill_sv "$SERVICE"
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
