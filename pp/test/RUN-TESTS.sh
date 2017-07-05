#!/bin/bash

# ===============================
# INITIALIZE REQUIRED ENV VARS...
# ===============================
. ../macros/INIT-ENV.sh

for i in *.md;do
  echo "-- NOW PROCESSING: $i"
  pp ../macros/macros.pp $i  \
  | pandoc  -f markdown      \
            -t html5         \
            --css=github.css \
            --standalone     \
            --smart          \
            --normalize      \
            -o ${i%.*}.html
done
