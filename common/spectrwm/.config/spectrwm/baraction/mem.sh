#!/usr/bin/env bash
## RAM usage indicator

mem() {
  mem=`free | awk '/Mem/ {printf "%d%\n", $3 / $2 * 100 }'`
  echo -e "  $mem"
}

