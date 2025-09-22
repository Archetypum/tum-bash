# `lib/package_manager/apt_cache.sh` — apk Wrapper Library

**Version:** 1.2.3  
**Author:** Archetypum  
**License:** LGPL-3.0-or-later  
**Project:** [tum-bash](https://github.com/Archetypum/tum-bash.git)

Bash wrapper for interacting with the `apt-cache` package manager. Provides convenient functions to run common `apt-cache` commands with standardized success/error output and execution logging.

`apt-cache` is commonly used on **Debian GNU/Linux**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/apt_cache.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### apt-cache Command Wrappers

Each function wraps a specific `apt-cache` command or flag:

| **Function**        | **Equivalent `apt-cache` command** |
|---------------------|------------------------------------|
| apt_cache           | apt-cache `<args>`                 |
| apt_cache_add       | apt-cache add `<args>`             |
| apt_cache_depends   | apt-cache depends `<args>`         |
| apt_cache_dotty     | apt-cache dotty `<args>`           |
| apt_cache_dump      | apt-cache dump `<args>`            |
| apt_cache_dumpavail | apt-cache dumpavail `<args>`       |
| apt_cache_gencaches | apt-cache gencaches `<args>`       |
| apt_cache_madison   | apt-cache madison `<args>`         |
| apt_cache_pkgnames  | apt-cache pkgnames `<args>`        |
| apt_cache_policy    | apt-cache policy `<args>`          |
| apt_cache_rdepends  | apt-cache rdepends `<args>`        |
| apt_cache_search    | apt-cache search `<args>`          |
| apt_cache_show      | apt-cache show `<args>`            |
| apt_cache_showpkg   | apt-cache showpkg `<args>`         |
| apt_cache_showsrc   | apt-cache showsrc `<args>`         |
| apt_cache_stats     | apt-cache stats `<args>`           |
| apt_cache_unmet     | apt-cache unmet `<args>`           |
| apt_cache_xvcg      | apt-cache xvcg `<args>`            |


## Example

```bash
#!/bin/bash

source lib/package_manager/apt_cache.sh

# Check bash dependencies
apt_depends bash

# Search for package in cache
apt_cache_search bash
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
