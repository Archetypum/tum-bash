# tum-bash v0.1.1-stable

Second stable version of **tum-bash**. Security-oriented update.

**Security**:

- Fixed possible shell injections attacks for package managers;

- Fixed possible shell injections attacks for init systems;

- Added new security policies in `SECURITY.md`;

**Bugs**:

- Fixed `t/test_unix.sh` overwriting of readonly variables;

**Typos**:

- Fixed `lib/init_system/s6.sh` being written in Rust instead of Bash;

- Renamed `lib/init_system/sysvinit` to `lib/init_system/sysvinit.sh`;

**Other Changes**:

- Updated `README.md` for the new stable release;

- Updated `TODO.md` for the new stable release;

- Updated `CHANGELOG.md` for the new stable release.

```text
     153 text files.
     152 unique files.
       2 files ignored.

github.com/AlDanial/cloc v 2.04  T=0.14 s (1117.9 files/s, 99063.6 lines/s)
--------------------------------------------------------------------------------
Language                      files          blank        comment           code
--------------------------------------------------------------------------------
Bourne Shell                     89            949           1564           4633
Markdown                         55           1443              0           2772
Bourne Again Shell                1            204            206           1464
XML                               5              0              0            196
make                              1              6             16             16
YAML                              1              0              0              1
--------------------------------------------------------------------------------
SUM:                            152           2602           1786           9082
--------------------------------------------------------------------------------
```
