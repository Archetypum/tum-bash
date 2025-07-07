# `lib/package_manager/apt_config.sh` — apt-config Wrapper Library

Bash wrapper for interacting with the `apt-config` package management utility. Provides convenient functions to run common `apt-config` commands with standardized success/error output and execution logging.

`apt-config` is commonly used on **Debian GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/apt_config.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### apt-config Command Wrappers

Each function wraps a specific `apt-config` command or flag:

| **Function**         | **Equivalent `apt-config` command** |
|----------------------|-------------------------------------|
| apt_config           | apt-config `<args>`                 |
| apt_config_shell     | apt-config shell `<args>`           |
| apt_config_dump      | apt-config dump `<args>`            |

## Example

```bash
#!/bin/bash

source lib/package_manager/apt_config.sh

# Dump APT configs
apt_config_dump
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
