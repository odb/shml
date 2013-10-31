#!/usr/bin/env bash

#************************************************#
#    Clistrap - Style Framework for The Terminal
#                    Beta
#        by Justin Dorfman - @jdorfman
#                10-27-2013
#
#               Inspired by:
#       Kiyor Cia, Jeff Foard FLOZz' MISC,
#  Joshua Mervine, Mark Otto & Dave Gandy
#
#
#     https://github.com/jdorfman/sTre-lang
#************************************************#

# Foreground (Text)
##
function cs-color {
  local __end='\033[39m'
  local __color='\033[97m' # white by default
  case "$1" in
    end|off|reset)       __color=$__end;;
    black|000000)        __color='\033[30m';;
    red|F00BAF)          __color='\033[31m';;
    green|00CD00)        __color='\033[32m';;
    yellow|CDCD00)       __color='\033[33m';;
    blue|0286fe)         __color='\033[34m';;
    magenta|e100cc)      __color='\033[35m';;
    cyan|00d3cf)         __color='\033[36m';;
    lightgray|e4e4e4)    __color='\033[90m';;
    darkgray|4c4c4c)     __color='\033[91m';;
    lightgreen|00fe00)   __color='\033[92m';;
    lightyellow|f8fe00)  __color='\033[93m';;
    lightblue|3a80b5)    __color='\033[94m';;
    lightmagenta|fe00fe) __color='\033[95m';;
    lightcyan|00fefe)    __color='\033[96m';;
  esac
  if test "$2"; then
    echo -en "$__color$2$__end"
  else
    echo -en "$__color"
  fi
}

# Background
##
function cs-bg-color {
  local __end='\033[49m'
  local __color='\033[40m' # black by default
  case "$1" in
    end|off|reset)       __color=${__end};;
    red|F00BAF)          __color='\033[41m';;
    green|00CD00)        __color='\033[42m';;
    yellow|CDCD00)       __color='\033[43m';;
    blue|0286fe)         __color='\033[44m';;
    magenta|e100cc)      __color='\033[45m';;
    cyan|00d3cf)         __color='\033[46m';;
    lightgray|e4e4e4)    __color='\033[47m';;
    darkgray|4c4c4c)     __color='\033[100m';;
    lightred)            __color='\033[101m';;
    lightgreen|00fe00)   __color='\033[102m';;
    lightyellow|f8fe00)  __color='\033[103m';;
    lightblue|3a80b5)    __color='\033[104m';;
    lightmagenta|fe00fe) __color='\033[105m';;
    lightcyan|00fefe)    __color='\033[106m';;
    white|fffff)         __color='\033[107m';;
  esac

  if test "$2"; then
    echo -en "$__color$2$__end"
  else
    echo -en "$__color"
  fi
}

## Color Bar
function cs-color-bar {
  if test "$2"; then
    for i in "$@"; do
      echo -en "`cs-bg-color "$i" " "`"
    done; echo
  else
    for i in {16..21}{21..16}; do
      echo -en "\033[48;5;${i}m \033[0m"
    done; echo
  fi
}

## Attributes
##
function cs-attribute {
  local __end='\033[0m'
  local __attr='\033[1m' # bold by default
  case "$1" in
    end|off|reset) __attr=$__end;; # End Attribute Style
    dim)           __attr='\033[2m';;
    italic)        __attr='\033[4m';;
    blink)         __attr='\033[5m';;
    invert)        __attr='\033[7m';;
    hidden)        __attr='\033[8m';;
  esac
  if test "$2"; then
    echo -en "$__attr$2$__end"
  else
    echo -en "$__attr"
  fi
}

## Elements
function cs-br {
  echo '\n'
}

function cs-tab {
  echo '\t'
}

function cs-hr {
  local __len=60
  local __char='-'
  if ! test "$2"; then
    re='^[0-9]+$'
    if [[ $1 =~ $re ]] ; then
      __len=$1
    fi
  else
    __len=$2
    __char=$1
  fi
  while [ $__len -gt 0 ]; do
    echo -n "$__char"
     __len=$(( $__len - 1 ))
  done
}

function cs-icon {
  case "$1" in
    check|checkmark) echo -n '✓';;
    X|x|xmark) echo -n '✘';;
    '<3'|heart) echo -n '❤';;
    sun) echo -n '☀';;
    '*'|star) echo -n '★';;
    darkstar) echo -n '☆';;
    umbrella) echo -n '☂';;
    flag) echo -n '⚑';;
    snow|snowflake) echo -n '❄';;
    music) echo -n '♫';;
    scissors) echo -n '✂';;
    tm|trademark) echo -n '™';;
    copyright) echo -n '©';;
    apple) echo -n '';;
    ':-)'|':)'|smile|face) echo -n '☺';;
  esac
}

# Aliases
##
function cs.color {
  cs-color $@
}
function cs.bg.color {
  cs-bg-color $@
}
function cs-background {
  cs-bg-color $@
}
function cs.background {
  cs-bg-color $@
}
function cs.color.bar {
  cs-bg-color $@
}
function cs-attr {
  cs-attribute $@
}
function cs.attribute {
  cs-attribute $@
}
function cs.attr {
  cs-attribute $@
}
function cs.br {
  cs-br $@
}
function cs.hr {
  cs-hr $@
}
function cs.icon {
  cs-icon $@
}

## Animations

# brew install bar or http://www.theiling.de/projects/bar.html
#cs_loadingbar='bar -c'

# http://fitnr.com/showing-a-bash-spinner.html
#cs_spinner()
#{
    #local pid=$1
    #local delay=0.75
    #local spinstr='|/-\'
    #while [ "$(ps a | awk '{print $1}' | grep $pid 2 > /dev/null)" ]; do
        #local temp=${spinstr#?}
        #printf " [%c]  " "$spinstr"
        #local spinstr=$temp${spinstr%"$temp"}
        #sleep $delay
        #printf "\b\b\b\b\b\b"
    #done
    #printf "    \b\b\b\b"
#}

# vim: ft=sh:
