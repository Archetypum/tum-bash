# `lib/package_manager/apt_extracttemplates.sh` — apt-extracttemplates Wrapper Library

Bash wrapper for interacting with the `apt-extracttemplates` package management utility. Provides convenient functions to run common `apt-extracttemplates` commands with standardized success/error output and execution logging.

`apt-extracttemplates` is commonly used on **Debian GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/apt_extracttemplates.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### apt-extracttemplates Command Wrappers

Each function wraps a specific `apt-extracttemplates` command or flag:

| **Function**         | **Equivalent `apt-extracttemplates` command** |
|----------------------|-----------------------------------------------|
| apt_extracttemplates | apt-extracttemplates `<args>`                 |

## Example

```bash
#!/bin/bash

source lib/package_manager/apt_extracttemplates.sh

# Extract templates
apt_extracttemplates
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
