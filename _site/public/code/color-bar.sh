#!/usr/bin/env bash

source "$(which shml)"

echo "$(color-bar)"
echo "
$(color-bar red green yellow blue magenta \
                  cyan lightgray darkgray lightred \
                  lightmagenta lightcyan)"
echo ""
echo "Yeah ahuh, you know what it is $(color-bar black yellow black yellow)"
echo "I put it down from the whip to my diamonds, I'm in $(bar black yellow black yellow)"
