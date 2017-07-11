CALL SCSS --update --force ./:./ --sourcemap=none --style=expanded
CALL SCSS --watch ./:./ --sourcemap=none --style=expanded

:: NOTE: Possible styles:
::  - nested (default)
::  - compact
::  - compressed
::  - expanded