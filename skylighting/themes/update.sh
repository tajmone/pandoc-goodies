#!/bin/bash

# v1.0.0 | 2019/06/07 | pandoc 2.7.2 | by Tristano Ajmone (public domain)
# ------------------------------------------------------------------------------
# This script will generate a Skylighting JSON Theme file for every highlight
# style (theme) natively supported by pandoc.
# Generated theme files follow this naming convention:
#     builtin-<theme-name>.theme
# ------------------------------------------------------------------------------
echo -e "\e[94m================================"
echo -e "\e[93mUpdating Skylighting JSON Themes"
echo -e "\e[94m================================"

pandoc --list-highlight-styles | grep -oP '\w+' | while read theme; do
  outFile="builtin-$theme.theme"
  echo -e "\e[0mUpdating theme: \e[94m$theme"
  pandoc -o $outFile --print-highlight-style=$theme
done
