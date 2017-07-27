#!/bin/bash

readonly ROOT=$( dirname $(dirname $(realpath $0) ) )
readonly TARGET=$ROOT/README.md
readonly HEADER=$(cat << EOT
# TIL

Today I Learned
EOT
)


echo "$HEADER" > $TARGET
