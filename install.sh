#!/usr/bin/env bash

find . -maxdepth 1 -type d -name "[a-z]*" -print | while read f;
do
    echo "Install $(basename "$f") ..."
    stow -t "$HOME" -R "$(basename "$f")"
done
