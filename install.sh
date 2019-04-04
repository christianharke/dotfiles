#!/usr/bin/env bash

cd "$(dirname "$0")" || exit

find . -maxdepth 1 -type d -name "[a-z]*" -print | while read f;
do
    echo "Install $(basename "$f") ..."
    stow -t "$HOME" -R "$(basename "$f")"
done
