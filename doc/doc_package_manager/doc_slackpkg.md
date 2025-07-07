# `lib/package_manager/slackpkg.sh` — slackpkg Wrapper Library

Bash wrapper for interacting with the `slackpkg` package manager. Provides convenient functions to run common `slackpkg` commands with standardized success/error output and execution logging.

`slackpkg` is commonly used on **Slackware GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/slackpkg.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### slackpkg Command Wrappers

Each function wraps a specific `slackpkg` command or flag:

| **Function**           | **Equivalent `slackpkg` Command** |
|------------------------|-----------------------------------|
| slackpkg               | slackpkg `<args>`                 |
| slackpkg_search        | slackpkg search `<args>`          |
| slackpkg_install       | slackpkg install `<args>`         |
| slackpkg_upgrade       | slackpkg upgrade `<args>`         |
| slackpkg_reinstall     | slackpkg reinstall `<args>`       |
| slackpkg_remove        | slackpkg remove `<args>`          |
| slackpkg_blacklist     | slackpkg blacklist `<args>`       |
| slackpkg_download      | slackpkg download `<args>`        |
| slackpkg_info          | slackpkg info `<args>`            |
| slackpkg_clean_system  | slackpkg clean-system `<args>`    |
| slackpkg_upgrade_all   | slackpkg upgrade-all `<args>`     |
| slackpkg_install_new   | slackpkg install-new `<args>`     |
| slackpkg_check_updates | slackpkg check-updates `<args>`   |
| slackpkg_update        | slackpkg update `<args>`          |

## Example

```bash
#!/bin/bash

source lib/package_manager/slackpkg.sh

# Search for packages
slackpkg_search bash

# Get package info
slackpkg_info bash 
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
