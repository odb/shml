#!/usr/bin/env bash

function preform() {
  local steps=$1
  test -z $steps && steps=10

  for s in $(seq 1 $steps); do
    # step
    # do something
    sleep 0.1
    echo $s
  done
}

source shml.sh

echo -ne "$(color blue)"
preform 5   | progress "Example 1:" 5
echo -ne "$(color end)"

preform 10  | progress "Example 2:" 10 "$(color red "=")"
preform 25  | progress "Example 3:" 25 "$(color green "$(icon smile)")"

# Bause there are two characters in the bar character, it will double the length.
# As such, we're going to override the default width like so...
SHML_PROGRESS_WIDTH=30 # 1/2 default
preform 100 | progress "$(a bold "Example 4:")" 100 "$(emoji thinking) "
