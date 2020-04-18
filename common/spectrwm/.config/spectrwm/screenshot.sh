#!/usr/bin/env bash

notification() {
    notify-send -u low "${1}" "${2}"
}

screenshot() {
    OUT="${HOME}/Pictures/screenshots/%F_%H-%M-%S.png"
	case $1 in
	full)
        FILE=$(scrot -m "${OUT}" -e 'echo $f')
        notification "Fullscreen screenshot saved" "${FILE}"
		;;
	window)
		sleep 0.5
        FILE=$(scrot -s "${OUT}" -e 'echo $f')
        notification "Current window screenshot saved" "${FILE}"
		;;
	esac;
}

screenshot $1
