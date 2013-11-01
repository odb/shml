#!/usr/bin/env bash

#CLISTYLE:START
#************************************************#
#    CLIstyle - Style Framework for The Terminal
#                    Beta
#        by Justin Dorfman - @jdorfman
#        && Joshua Mervine - @mervinej
#
#               Inspired by:
#
#       Kiyor Cia, Jeff Foard FLOZz' MISC,
#           Mark Otto & Dave Gandy
#
#
#     https://github.com/jdorfman/sTre-lang
#************************************************#

# Foreground (Text)
##
function color {
  local __end='\033[39m'
  local __color=$__end # end by default
  case "$1" in
    end|off|reset)       __color=$__end;;
    black|000000)        __color='\033[30m';;
    red|F00BAF)          __color='\033[31m';;
    green|00CD00)        __color='\033[32m';;
    yellow|CDCD00)       __color='\033[33m';;
    blue|0286fe)         __color='\033[34m';;
    magenta|e100cc)      __color='\033[35m';;
    cyan|00d3cf)         __color='\033[36m';;
    gray|e4e4e4)         __color='\033[90m';;
    darkgray|4c4c4c)     __color='\033[91m';;
    lightgreen|00fe00)   __color='\033[92m';;
    lightyellow|f8fe00)  __color='\033[93m';;
    lightblue|3a80b5)    __color='\033[94m';;
    lightmagenta|fe00fe) __color='\033[95m';;
    lightcyan|00fefe)    __color='\033[96m';;
    white|ffffff)        __color='\033[97m';;
  esac
  if test "$2"; then
    echo -en "$__color$2$__end"
  else
    echo -en "$__color"
  fi
}
function c {
  color "$@"
}

# Background
##
function background {
  local __end='\033[49m'
  local __color=$__end # end by default
  case "$1" in
    end|off|reset)       __color=$__end;;
    black|000000)        __color='\033[40m';;
    red|F00BAF)          __color='\033[41m';;
    green|00CD00)        __color='\033[42m';;
    yellow|CDCD00)       __color='\033[43m';;
    blue|0286fe)         __color='\033[44m';;
    magenta|e100cc)      __color='\033[45m';;
    cyan|00d3cf)         __color='\033[46m';;
    gray|e4e4e4)         __color='\033[47m';;
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
function bg {
  background "$@"
}

## Color Bar
function color-bar {
  if test "$2"; then
    for i in "$@"; do
      echo -en "`background "$i" " "`"
    done; echo
  else
    for i in {16..21}{21..16}; do
      echo -en "\033[48;5;${i}m \033[0m"
    done; echo
  fi
}
function bar {
  color-bar "$@"
}

## Attributes
##
function attribute {
  local __end='\033[0m'
  local __attr=$__end # end by default
  case "$1" in
    end|off|reset) __attr=$__end;;
    bold)          __attr='\033[1m';;
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
function a {
  attribute "$@"
}

## Elements
function br {
  echo '\n'
}

function tab {
  echo '\t'
}

function indent {
  local __len=4
  if test "$1"; then
    if [[ $1 =~ $re ]] ; then
      __len=$1
    fi
  fi
  while [ $__len -gt 0 ]; do
    echo -n " "
     __len=$(( $__len - 1 ))
  done
}
function i {
  indent "$@"
}

function hr {
  local __len=60
  local __char='-'
  if ! test "$2"; then
    re='^[0-9]+$'
    if [[ $1 =~ $re ]] ; then
      __len=$1
    elif test "$1"; then
      __char=$1
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

# Icons
#
# TODO: Replace with codes.
##
function icon {
  case "$1" in
    check|checkmark)       echo -n '✓';;
    X|x|xmark)             echo -n '✘';;
    '<3'|heart)            echo -n '❤';;
    sun)                   echo -n '☀';;
    '*'|star)              echo -n '★';;
    darkstar)              echo -n '☆';;
    umbrella)              echo -n '☂';;
    flag)                  echo -n '⚑';;
    snow|snowflake)        echo -n '❄';;
    music)                 echo -n '♫';;
    scissors)              echo -n '✂';;
    tm|trademark)          echo -n '™';;
    copyright)             echo -n '©';;
    apple)                 echo -n '';;
    ':-)'|':)'|smile|face) echo -n '☺';;
  esac
}

#CLISTYLE:END


# Usage / Examples
##
if [[ "`basename $0`" = "clistyle.sh" ]]; then
I=2
echo -e "
$(a bold 'CLIstyle Usage / Help')
$(hr '=')

$(a bold 'Section 0: Sourcing')
$(hr '-')

$(i $I)When installed in path:
$(i $I)  source \$(which clistyle.sh)

$(i $I)When installed locally:
$(i $I)  source ./clistyle.sh

$(a bold 'Section 1: Foreground')
$(hr '-')

$(i $I)\$(color red \"foo bar\")
$(i $I)$(color red "foo bar")

$(i $I)\$(color blue \"foo bar\")
$(i $I)$(color blue "foo bar")

$(i $I)\$(color green)
$(i $I)  >>foo bar<<
$(i $I)  >>bah boo<<
$(i $I)\$(color end)
$(i $I)$(color green)
$(i $I)>>foo bar<<
$(i $I)>>bah boo<<
$(i $I)$(color end)

$(i $I)Short Hand: $(a italic 'c')

$(i $I)\$(c red 'foo')

$(i $I)Argument list:

$(i $I)black, red, green, yellow, blue, magenta, cyan, gray,
$(i $I)white, darkgray, lightgreen, lightyellow, lightblue,
$(i $I)lightmagenta, lightcyan

$(i $I)Termination: end, off, reset

$(i $I)Default (no arg): end


$(a bold 'Section 2: Background')
$(hr '-')

$(i $I)\$(background red \"foo bar\")
$(i $I)$(background red "foo bar")

$(i $I)\$(background blue \"foo bar\")
$(i $I)$(background blue "foo bar")

$(i $I)\$(background green)
$(i $I)$(i $I)>>foo bar<<
$(i $I)$(i $I)>>bah boo<<
$(i $I)\$(background end)
$(background green)
$(i $I)>>foo bar<<
$(i $I)>>bah boo<<
$(background end)

$(i $I)Short Hand: $(a italic 'bg')

$(i $I)\$(bg red 'foo')

$(i $I)Argument list:

$(i $I)black, red, green, yellow, blue, magenta, cyan, gray,
$(i $I)white, darkgray, lightred, lightgreen, lightyellow,
$(i $I)lightblue, lightmagenta, lightcyan

$(i $I)Termination: end, off, reset

$(i $I)Default (no arg): end


$(a bold 'Section 3: Attributes')
$(hr '-')

$(i $I)$(a bold '!! EXPERMENTAL !!')
$(i $I)$(a italic "AKA It doesn't work for me, but should.")

$(i $I)> Note:
$(i $I)> $(a italic 'attribute end') turns off everything,
$(i $I)> including foreground and background color.

$(i $I)\$(attribute bold \"foo bar\")
$(i $I)$(attribute bold "foo bar")

$(i $I)\$(attribute italic \"foo bar\")
$(i $I)$(attribute italic "foo bar")

$(i $I)\$(attribute dim)
$(i $I)$(i $I)>>foo bar<<
$(i $I)$(i $I)>>bah boo<<
$(i $I)\$(attribute end)
$(i $I)$(attribute dim)
$(i $I)$(i $I)>>foo bar<<
$(i $I)$(i $I)>>bah boo<<
$(i $I)$(attribute end)

$(i $I)Short Hand: $(a italic 'a')

$(i $I)\$(a bold 'foo')

$(i $I)Argument list:

$(i $I)bold, dim, italic, blink, invert, hidden

$(i $I)Termination: end, off, reset

$(i $I)Default (no arg): end


$(a bold 'Section 4: Elements')
$(hr '-')

$(i $I)foo\$(br)\$(tab)bar
$(i $I)foo$(br)$(tab)bar
$(i $I)
$(i $I)foo\$(br)\$(indent)bar\$(br)\$(indent 6)boo
$(i $I)foo$(br)$(indent)bar$(br)$(indent 6)boo
$(i $I)
$(i $I)> Note: short hand for $(a italic 'indent') is $(a italic 'i')
$(i $I)
$(i $I)\$(hr)
$(i $I)$(hr)
$(i $I)
$(i $I)\$(hr 50)
$(i $I)$(hr 50)
$(i $I)
$(i $I)\$(hr '~' 40)
$(i $I)$(hr '~' 40)
$(i $I)
$(i $I)\$(hr '#' 30)
$(i $I)$(hr '#' 30)


$(a bold 'Section 5: Icons')
$(hr '-')

$(i $I)\$(icon check) \$(icon '<3') \$(icon '*') \$(icon ':)')
$(i $I)$(icon check) $(icon '<3') $(icon '*') $(icon ':)')


$(a bold 'Section 6: Mixed Examples')
$(hr '-')

$(i $I)\$(bg white \"\$(c black \"foo bar\")\")
$(i $I)$(bg white "$(c black "foo bar")")
$(i $I)
$(i $I)\$(bg green)\$(c red)\$(a bold)
$(i $I)$(i $I)>>foo bar<<
$(i $I)$(i $I)\$(hr \"\$(i \'darkstar\')\" 11)
$(i $I)$(i $I)>>bah boo<<
$(i $I)\$(a end)\$(c end)\$(bg end)
$(bg green)$(c red)$(a bold)
$(i $I)>>foo bar<<
$(i $I)$(hr "$(i 'darkstar')" 11)
$(i $I)>>bah boo<<
$(a end)$(c end)$(bg end)

$(i $I)Argument list:

$(i $I)check|checkmark, X|x|xmark, <3|heart, sun, *|star,
$(i $I)darkstar, umbrella, flag, snow|snowflake, music,
$(i $I)scissors, tm|trademark, copyright, apple,
$(i $I):-)|:)|smile|face


$(a bold 'Section 7: Color Bar')
$(hr '-')

$(i $I)\$(color-bar)
$(i $I)$(color-bar)
$(i $I)
$(i $I)\$(color-bar red green yellow blue magenta \\
$(i $I)$(i 15)cyan lightgray darkgray lightred \\
$(i $I)$(i 15)lightgreen lightyellow lightblue \\
$(i $I)$(i 15)lightmagenta lightcyan)
$(i $I)$(color-bar red green yellow blue magenta \
                  cyan lightgray darkgray lightred \
                  lightgreen lightyellow lightblue \
                  lightmagenta lightcyan)

$(i $I)Short Hand: $(a italic 'bar')
$(i $I)
$(i $I)\$(bar red red red red)

" | less -r
fi

# vim: ft=sh:
