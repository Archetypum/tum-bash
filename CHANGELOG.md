# tum-bash v0.1.1-stable

Second stable version of **tum-bash**. Security-oriented update with a lot of changes to the codebase.

**New**:

- Added `osx`, `ios`, `watchos`, `tvos`, `visionos` to the `$MACOS_BASED` array in `tum`, `lib/unix.sh`. 

- Added `is_based_on()` function to `tum`, `lib/unix.sh` to make code more **DRY**;

- Added `is_based_on()` documentation and usage example to the `doc/doc_unix.md`; 

- Added `tum.1` for future man documentation;

- Added `.travis.yml` for future Travis CI build.

**Improvements**:

- Replaced external processes and programs with pure bash alternatives;

- Replaced `#!/bin/bash` shebangs with `#!/usr/bin/env bash` shebang.

**Security**:

- Fixed possible shell injections attacks for package managers;

- Fixed possible shell injections attacks for init systems;

- Added new security policies in `SECURITY.md`;

**Bugs**:

- Fixed `t/test_unix.sh` overwriting of readonly variables;

- Fixed `tum`, `lib/unix.sh` potential overwriting of readonly variables.

**Typos**:

- Fixed `lib/init_system/s6.sh` being written in Rust instead of Bash;

- Renamed `lib/init_system/sysvinit` to `lib/init_system/sysvinit.sh`;

**Removed**:

- Removed 't/' because these tests are useless and bloated;

- Removed `autotests.sh`. Same reason.

**Other Changes**:

- Updated `README.md` for the new stable release;

- Updated `TODO.md` for the new stable release;

- Updated `CHANGELOG.md` for the new stable release.

```text
     104 text files.
     103 unique files.
       3 files ignored.

github.com/AlDanial/cloc v 2.04  T=0.05 s (2234.3 files/s, 224061.5 lines/s)
--------------------------------------------------------------------------------
Language                      files          blank        comment           code
--------------------------------------------------------------------------------
Markdown                         55           1501              0           2956
Bourne Shell                     44            604            829           2781
Bourne Again Shell                1            156            209           1235
make                              1              6             16             16
YAML                              2              5              0             15
--------------------------------------------------------------------------------
SUM:                            103           2272           1054           7003
--------------------------------------------------------------------------------
```
