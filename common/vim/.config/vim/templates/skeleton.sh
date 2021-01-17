#!/usr/bin/env bash

# My personal bash script template
#
# Inspired by: https://github.com/leogtzr/minimal-safe-bash-template
#
# Version: 1.0
#
# Copyright 2021 Christian Harke
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

set -o errexit
set -o nounset
set -o pipefail

work_dir=$(dirname "$(readlink --canonicalize-existing "${0}" 2> /dev/null)")
readonly conf_file="${work_dir}/script.conf"
readonly error_parsing_options=81
readonly script_name="${0##*/}"
a_option_flag=0
abc_option_flag=0
flag_option_flag=0

trap clean_up ERR EXIT SIGINT SIGTERM

usage() {
    cat <<USAGE_TEXT
Usage: ${script_name} [-h | --help] [-a <ARG>] [--abc <ARG>] [-f | --flag]

DESCRIPTION
    Your description here.

    OPTIONS:

    -h, --help
        Print this help and exit.

    -f, --flag
        Description for flag option.

    -a
        Description for the -a option.

    --abc
        Description for the --abc option.

USAGE_TEXT
}

clean_up() {
    trap - ERR EXIT SIGINT SIGTERM
    # Remove temporary files/directories, log files or rollback changes.
}

die() {
    local -r msg="${1}"
    local -r code="${2:-90}"
    echo "${msg}" >&2
    exit "${code}"
}

if [[ -f "${conf_file}" ]]; then
    # shellcheck source=script.conf
    . "${conf_file}"
fi

parse_user_options() {
    local -r args=("${@}")
    local opts

    # The following code works perfectly for 
    opts=$(getopt --options a:,f,h --long abc:,help,flag -- "${args[@]}" 2> /dev/null) || {
        usage
        die "error: parsing options" "${error_parsing_options}"
    }

    eval set -- "${opts}"

    while true; do
    case "${1}" in

        --abc)
            abc_option_flag=1
            readonly abc_arg="${2}"
            shift
            shift
            ;;

        -a)
            a_option_flag=1
            readonly a_arg="${2}"
            shift
            shift
            ;;

        --help|-h)
            usage

            exit 0
            shift
            ;;

        --flag|-f)
            flag_option_flag=1

            shift
            ;;

        --)
            shift
            break
            ;;
        *)
            break
            ;;
    esac
    done
}

parse_user_options "${@}"

if ((flag_option_flag)); then
    echo "flag option set"
fi

# Check if the flag options are set or ON:
if ((abc_option_flag)); then
    # Logic for when --abc is set.
    # "${abc_arg}" should also be set.
    echo "Using --abc option -> arg: [${abc_arg}]"
fi

if ((a_option_flag)); then
    # Logic for when -a is set.
    # "${a_arg}" should also be set.
    echo "Using -a option -> arg: [${a_arg}]"
fi

exit 0

