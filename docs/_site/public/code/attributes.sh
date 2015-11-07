#!/usr/bin/env bash

source "$(which shml)"

echo ''
echo "$(attribute underline "So Underlined") $(attribute end)"
echo ''
echo "$(attribute bold "   such BOLD") $(attribute end)"
echo ''
echo "$(attribute invert "Why this inverted?") $(attribute end)"
echo ''
echo "$(a bold "      such BOLD shorter") $(a end)"
echo ''
echo ''
