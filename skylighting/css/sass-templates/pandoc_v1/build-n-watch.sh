#!/bin/bash
# ------------------------------------------------------------------------------
# This script requires Dart Sass to be installed on the system:
#      https://github.com/sass/dart-sass
#
# On Windows, you can use Chocolatey to install Dart Sass and keep it updated:
#      https://chocolatey.org/packages/sass
# ------------------------------------------------------------------------------
sass --source-map --style=expanded ./:./
sass --source-map --style=expanded --watch ./:./
