#!/usr/bin/env bash
## Wifi signal indicator

wifi() {
  interface="wlp82s0"
  # If the wifi interface exists but no connection is active, "down" shall be displayed.
  if [[ "$(cat /sys/class/net/$interface/operstate)" = 'down' ]]; then
    echo "down"
    exit
  fi
  quality=$(grep "$interface" /proc/net/wireless | awk '{ printf "%d%", int($3 * 100 / 70) }')
  echo -e "  $quality"
}

