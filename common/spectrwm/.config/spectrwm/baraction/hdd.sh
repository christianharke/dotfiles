#!/usr/bin/env bash
## Available disk space indicator

hdd() {
  hdd="$(df -h -P -l "/" | awk 'NR==2{print $4}')"
  echo -e "  $hdd"
}

