#!/usr/bin/env bash

cd "$(dirname "$0")" || exit

function install() {
    echo "Install $(basename "$1") ..."
    stow -t "$HOME" -R "$(basename "$1")"
}
readonly -f install

if [ -z "$1" ];
then
    echo "Usage: ./install.sh [--all] folder ..."
    exit 1
elif [[ $1 = "--all" ]];
then
    find . -maxdepth 1 -type d,l -name "[a-z]*" -print | while read -r f;
    do
        if [ $(basename "$f") != "install.sh" ];
        then
            install "$f"
        fi
    done
else
    for i in "$@";
    do
        install "$i"
    done
fi
