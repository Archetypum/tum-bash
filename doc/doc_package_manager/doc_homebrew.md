# `lib/package_manager/homebrew.sh` — brew Wrapper Library

Bash wrapper for interacting with the `homebrew` package manager. Provides convenient functions to run common `brew` commands with standardized success/error output and execution logging.

`homebrew` is commonly used on **macOS**-based operating systems.

## Usage

Import this library in your Bash script:

```bash
#!/bin/bash

source lib/package_manager/homebrew.sh
```

## Functions

### Core Helper

`execute <command> [args...]`

Runs the given command with arguments, printing a green success message if the command succeeds or a red error message if it fails.

### brew Command Wrappers

Each function wraps a specific `brew` command or flag:

| **Function**          | **Equivalent `brew` command**   |
|-----------------------|---------------------------------|
| brew                  | brew `<args>`                   |
| brew_alias            | brew alias `<args>`             |
| brew_analytics        | brew analytics `<args>`         |
| brew_autoremove       | brew autoremove `<args>`        |
| brew_bundle           | brew bundle `<args>`            |
| brew_casks            | brew casks `<args>`             |
| brew_cleanup          | brew cleanup `<args>`           |
| brew_command          | brew command `<args>`           |
| brew_commands         | brew commands `<args>`          |
| brew_completions      | brew completions `<args>`       |
| brew_config           | brew config `<args>`            |
| brew_deps             | brew deps `<args>`              |
| brew_desc             | brew desc `<args>`              |
| brew_developer        | brew developer `<args>`         |
| brew_docs             | brew docs `<args>`              |
| brew_fetch            | brew fetch `<args>`             |
| brew_formulae         | brew formulae `<args>`          |
| brew_gist_logs        | brew gist-logs `<args>`         |
| brew_help             | brew help `<args>`              |
| brew_home             | brew home `<args>`              |
| brew_install          | brew install `<args>`           |
| brew_leaves           | brew leaves `<args>`            |
| brew_link             | brew link `<args>`              |
| brew_list             | brew list `<args>`              |
| brew_log              | brew log `<args>`               |
| brew_mcp_server       | brew mcp-server `<args>`        |
| brew_migrate          | brew migrate `<args>`           |
| brew_missing          | brew missing `<args>`           |
| brew_nodenv_sync      | brew nodenv-sync `<args>`       |
| brew_options          | brew options `<args>`           |
| brew_outdated         | brew outdated `<args>`          |
| brew_pin              | brew pin `<args>`               |
| brew_postinstall      | brew postinstall `<args>`       |
| brew_pyenv_sync       | brew pyenv-sync `<args>`        |
| brew_rbenv_sync       | brew rbenv-sync `<args>`        |
| brew_readall          | brew readall `<args>`           |
| brew_reinstall        | brew reinstall `<args>`         |
| brew_search           | brew search `<args>`            |
| brew_services         | brew services `<args>`          |
| brew_setup_ruby       | brew setup-ruby `<args>`        |
| brew_shellenv         | brew shellenv `<args>`          |
| brew_tab              | brew tab `<args>`               |
| brew_tap              | brew tap `<args>`               |
| brew_tap_info         | brew tap-info `<args>`          |
| brew_unalias          | brew unalias `<args>`           |
| brew_uninstall        | brew uninstall `<args>`         |
| brew_unlink           | brew unlink `<args>`            |
| brew_unpin            | brew unpin `<args>`             |
| brew_untap            | brew untap `<args>`             |
| brew_update           | brew update `<args>`            |
| brew_update_if_needed | brew update-if-needed `<args>`  |
| brew_update_reset     | brew update-reset `<args>`      |
| brew_upgrade          | brew upgrade `<args>`           |
| brew_uses             | brew uses `<args>`              |
| brew_cache            | brew --cache `<args>`           |
| brew_caskroom         | brew --caskroom `<args>`        |
| brew_cellar           | brew --cellar `<args>`          |
| brew_env              | brew --env `<args>`             |
| brew_prefix           | brew --prefix `<args>`          |
| brew_repository       | brew --repository `<args>`      |
| brew_version          | brew --version `<args>`         |

## Example

```bash
#!/bin/bash

source lib/package_manager/homebrew.sh

# Check homebrew version
brew_version

# Install packages
brew_install neofetch
```

## License

This module is released under the **GNU Lesser General Public License v3.0 or later**.

See:

- [_LICENSE-LGPLv3.md_](https://github.com/Archetypum/tum-bash/blob/master/LICENSE-LGPLv3.md)

- _https://www.gnu.org/licenses/lgpl-3.0.html_

- [_Free Software Foundation_](https://www.fsf.org/)
