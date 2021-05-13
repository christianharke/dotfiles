#!/usr/bin/env bash
# Microphone volume indicator

mic() {
  mic=`amixer get Capture | awk -F'[][]' 'END{ print $4":"$2 }' | sed 's/on://g'`
  echo -e " $mic"
}

