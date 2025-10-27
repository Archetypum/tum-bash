# tum-bash v2.2.4-stable

New release with the main goal of removing all useless crap from the distribution.
`doc/` and `lib/` planned to be removed because they are mostly obsolete and just
making the repository more bloated.

**New**:

- Added `pkgman` to `$SUPPORTED_PMS` and `launch_roster` to `$SUPPORTED_INITS`;

- Added `launch_roster` detection for Haiku in `get_init`;

- Updated man page for `tum`;

- Added `get_package_manager`;

- Removed `clear_screen` because its fucking useless;

- Renamed `get_user_distro` to `get_distro`;

- Removed `lib/` because its fucking useless;

- Removed `.travis.yml` because its fucking useless;

- Removed ANSI color codes and text formatting because they are fucking useless.

**Fixes**:

- Function `prompt_user` is working now (holy FUCKING shit bro);

- Function `get_init` identifies sysvinit and openrc correctly now;

**Improvements**:

- Slightly updated the code to make it more POSIX sh compliant;

- Slightly improved markdown documents;

- Improved `get_pid_comm` for busybox distributions;

- Made `CODE_OF_CONDUCT.md` better;

- Other small improvements.

```text
      60 text files.
      58 unique files.
       3 files ignored.

github.com/AlDanial/cloc v 2.06  T=0.11 s (542.3 files/s, 53084.8 lines/s)
--------------------------------------------------------------------------------
Language                      files          blank        comment           code
--------------------------------------------------------------------------------
Markdown                         55           1439              0           2848
Bourne Again Shell                1            119             21           1195
make                              1             10             16             29
YAML                              1              0              0              1
--------------------------------------------------------------------------------
SUM:                             58           1568             37           4073
--------------------------------------------------------------------------------
```
