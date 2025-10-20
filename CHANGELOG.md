# tum-bash v1.2.4-stable

Another stable version of **tum-bash**. Man documentation update, some fixes, etc.

**New**:

- Man page for `tum` (`tum.1`);

- Added `Editor configs` section to the `.gitignore`;

- Added `GNU Shepherd` detection to the `get_init_system`;

- Added more options on getting user's operating system in `get_user_distro`.

**Fixes**:

- Fixed all `is_*_based` funciotns.

**Improvements**:

- Slightly updated `Makefile` for man page installation;

- Slightly updated `README.md`;

- Slightly updated `tum`, `lib/*`, making it a little more compatible with POSIX `sh`;

- Made code more readable;

- Removed useless ANSI color codes and formatting;

- Other small improvements.

```text
     105 text files.
     103 unique files.
       3 files ignored.

github.com/AlDanial/cloc v 2.06  T=0.06 s (1619.8 files/s, 159293.7 lines/s)
--------------------------------------------------------------------------------
Language                      files          blank        comment           code
--------------------------------------------------------------------------------
Markdown                         55           1479              0           2934
Bourne Shell                     44            623            931           2397
Bourne Again Shell                1            168            213           1309
make                              1             10             16             29
YAML                              2              5              0             15
--------------------------------------------------------------------------------
SUM:                            103           2285           1160           6684
--------------------------------------------------------------------------------
```
