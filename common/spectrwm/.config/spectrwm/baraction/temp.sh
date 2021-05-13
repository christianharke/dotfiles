#!/usr/bin/env bash
# Temperature indicator

temp() {
  temp="$(sensors -j "coretemp-isa-0000" | jq '."coretemp-isa-0000"[] | objects | select(has("temp1_input"))."temp1_input"')°C"
  echo -e " $temp"
}

