#!/usr/bin/env bash
# baraction.sh for spectrwm status bar

for i in $(dirname "$0")/baraction/*;
  do source $i
done

# Loops forever outputting a line every SLEEP_SEC secs
SLEEP_SEC=1

# It seems that we are limited to how many characters can be displayed via
# the baraction script output. And the the markup tags count in that limit.
while :; do
    echo "$(cpu) · $(mem) · $(hdd) · $(temp) · $(wifi) · $(bt) · $(vol) · $(mic) · $(batt) · $(datetime)"
    sleep $SLEEP_SEC
done
