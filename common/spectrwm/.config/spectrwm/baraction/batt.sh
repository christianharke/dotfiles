#!/usr/bin/env bash
# Battery power indicator

batt() {
  batt="$(acpi -b | head -n 1 | grep -Po "[[:digit:]]{1,3}%")"
  echo -e " $batt"
}

