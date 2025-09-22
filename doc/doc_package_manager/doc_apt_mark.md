# `lib/package_manager/apt_mark.sh` — apt-mark Wrapper Library

**Version:** 1.2.3  
**Author:** Archetypum  
**License:** LGPL-3.0-or-later  
**Project:** [tum-bash](https://github.com/Archetypum/tum-bash.git)

Bash wrapper for interacting with the `apt-mark` package management utility. Provides convenient functions to run common `apt-mark` commands with standardized success/error output and execution logging.

`apt-mark` is commonly used on **Debian GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/apt_mark.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### apt-mark Command Wrappers

Each function wraps a specific `apt-mark` command or flag:

| **Function**             | **Equivalent `apt-mark` command** |
|--------------------------|-----------------------------------|
| apt_mark                 | apt-mark `<args>`                 |
| apt_mark_auto            | apt-mark auto `<args>`            |
| apt_mark_manual          | apt-mark manual `<args>`          |
| apt_mark_minimize_manual | apt-mark minimize-manual `<args>` |
| apt_mark_showauto        | apt-mark showauto `<args>`        |
| apt_mark_showmanual      | apt-mark showmanual `<args>`      |
| apt_mark_hold            | apt-mark hold `<args>`            |
| apt_mark_unhold          | apt-mark unhold `<args>`          |
| apt_mark_showhold        | apt-mark showhold `<args>`        |

## Example

```bash
#!/bin/bash

source lib/package_manager/apt_mark.sh

# Show hold packages
apt_mark_showhold
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
