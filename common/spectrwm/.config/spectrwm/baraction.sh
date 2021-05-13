#!/usr/bin/env bash
# baraction.sh for spectrwm status bar

## CPU
cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "$cpu%"
}

## RAM
mem() {
  mem=`free | awk '/Mem/ {printf "%d%\n", $3 / $2 * 100 }'`
  echo -e "$mem"
}

## DISK
hdd() {
  hdd="$(df -h -P -l "/" | awk 'NR==2{print $4}')"
  echo -e "$hdd"
}

## TEMPERATURE
temp() {
  temp="$(sensors -j "coretemp-isa-0000" | jq '."coretemp-isa-0000"[] | objects | select(has("temp1_input"))."temp1_input"')°C"
  echo -e "$temp"
}

## WIFI
wifi() {
  interface="wlp82s0"
  # If the wifi interface exists but no connection is active, "down" shall be displayed.
  if [[ "$(cat /sys/class/net/$interface/operstate)" = 'down' ]]; then
    echo "down"
    exit
  fi
  quality=$(grep "$interface" /proc/net/wireless | awk '{ printf "%d%", int($3 * 100 / 70) }')
  echo -e "$quality"
}

## BLUETOOTH
bt() {
  device="04:5D:4B:97:5D:55"
  name="$(bluetoothctl -- info $device | grep "Name" | cut -d ":" -f 2 | tr -d '[:space:]')"
  connected="$(bluetoothctl -- info $device | grep "Connected" | cut -d ":" -f 2 | tr -d '[:space:]')"
  if [[ "$connected" != 'yes' ]]; then
    name="-"
  fi
  echo -e "$name"
}

## VOLUME
vol() {
  vol=`amixer get Master | awk -F'[][]' 'END{ print $4":"$2 }' | sed 's/on://g'`
  echo -e "$vol"
}

## MIC
mic() {
  mic=`amixer get Capture | awk -F'[][]' 'END{ print $4":"$2 }' | sed 's/on://g'`
  echo -e "$mic"
}

## BATTERY
batt() {
  batt="$(acpi -b | head -n 1 | grep -Po "[[:digit:]]{1,3}%")"
  echo -e "$batt"
}

## DATE
datetime() {
  datetime="$(LC_TIME=en_US.UTF-8 date '+%a %b %-d %H:%M')"
  echo -e "$datetime"
}

# Loops forever outputting a line every SLEEP_SEC secs
SLEEP_SEC=1

# It seems that we are limited to how many characters can be displayed via
# the baraction script output. And the the markup tags count in that limit.
# So I would love to add more functions to this script but it makes the 
# echo output too long to display correctly.
while :; do
    echo "  $(cpu) ·   $(mem) ·   $(hdd) ·  $(temp) ·   $(wifi) ·   $(bt) ·   $(vol) ·  $(mic) ·  $(batt) ·   $(datetime)"
	sleep $SLEEP_SEC
done
