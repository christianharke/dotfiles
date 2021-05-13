#!/usr/bin/env bash
# Volume indicator

vol() {
  vol=`amixer get Master | awk -F'[][]' 'END{ print $4":"$2 }' | sed 's/on://g'`
  echo -e "  $vol"
}

