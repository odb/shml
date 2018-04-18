#!/usr/bin/env bash

source shml.sh
on_human() {
  dialog "What is your name?" "on_dialog"
}

on_dialog() {
  echo "$(color green "Hello, $1! $(emoji beer)")"
}

on_not_human() {
  confirm "$(color red "Do you come in peace?")" "on_friend" "on_enemy"
}

on_friend() {
  echo "$(emoji '=)') $(emoji beer)"
}

on_enemy() {
  echo "$(emoji rage) $(emoji poop)"
}

confirm "$(color blue "Are you human?")" "on_human" "on_not_human"
exit 0
