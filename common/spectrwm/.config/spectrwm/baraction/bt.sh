#!/usr/bin/env bash
# Bluetooth info

bt() {
  device="04:5D:4B:97:5D:55"
  name="$(bluetoothctl -- info $device | grep "Name" | cut -d ":" -f 2 | tr -d '[:space:]')"
  connected="$(bluetoothctl -- info $device | grep "Connected" | cut -d ":" -f 2 | tr -d '[:space:]')"
  if [[ "$connected" != 'yes' ]]; then
    name="-"
  fi
  echo -e "  $name"
}

