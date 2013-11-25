#!/usr/bin/env bash

#SHML:START
#************************************************#
#        shml - Shell Markup Framework
#                    Beta
#        by Justin Dorfman - @jdorfman
#        && Joshua Mervine - @mervinej
#
#               Inspired by:
#
#      Kiyor Cia, Jeff Foard FLOZz' MISC,
#           Mark Otto & Dave Gandy
#
#          https://github.com/odb/shml
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
      echo -en "$(background "$i" " ")"
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
    underline)     __attr='\033[4m';;
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
  echo -e "\n\r"
}

function tab {
  echo -e "\t"
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
##
declare -A entities=()
entities[quot]='\u0022'
entities[amp]='\u0026'
entities[lt]='\u003C'
entities[gt]='\u003E'
entities[nbsp]=' '
entities[pi]='\u03C0'
entities[ndash]='\u2013'
entities[mdash]='\u2014'
entities[lsquo]='\u2018'
entities[rsquo]='\u2019'
entities[sbquo]='\u201A'
entities[ldquo]='\u201C'
entities[rdquo]='\u201D'
entities[dagger]='\u2020'
entities[bullet]='\u2022'
entities[lsaquo]='\u2039'
entities[rasquo]='\u203A'
entities[oline]='\u203E'
entities[frasl]='\u2044'
entities[euro]='\u20AC'
entities[larr]='\u2190'
entities[uarr]='\u2191'
entities[rarr]='\u2192'
entities[darr]='\u2193'
entities[harr]='\u2194'
entities[cararr]='\u21B5'
entities[lArr]='\u21D0'
entities[uArr]='\u21D1'
entities[rArr]='\u21D2'
entities[dArr]='\u21D3'
entities[hArr]='\u21D4'
entities[empty]='\u2205'
entities[sum]='\u2211'
entities[minus]='\u2212'
entities[spades]='\u2660'
entities[clubs]='\u2663'
entities[hearts]='\u2665'
entities[diams]='\u2666'
function _entity_list {
  local w=0
  for i in "${!entities[@]}"; do
    if [ $w -lt 3 ]; then
      printf "  %07s:  %s   " "$i" "$( echo -e "${entities[$i]}")"
      w="$(expr $w + 1)"
    else
      printf "  %07s:  %s   \n" "$i" "$( echo -e "${entities[$i]}")"
      w=0
    fi
  done
  echo " "
}
function entity {
  echo -ne "${entities[$1]}"
}
function icon {
  local i='';
  case "$1" in
    check|checkmark)       i='\xE2\x9C\x93';;
    X|x|xmark)             i='\xE2\x9C\x98';;
    '<3'|heart)            i='\xE2\x9D\xA4';;
    sun)                   i='\xE2\x98\x80';;
    '*'|star)              i='\xE2\x98\x85';;
    darkstar)              i='\xE2\x98\x86';;
    umbrella)              i='\xE2\x98\x82';;
    flag)                  i='\xE2\x9A\x91';;
    snow|snowflake)        i='\xE2\x9D\x84';;
    music)                 i='\xE2\x99\xAB';;
    scissors)              i='\xE2\x9C\x82';;
    tm|trademark)          i='\xE2\x84\xA2';;
    copyright)             i='\xC2\xA9';;
    apple)                 i='\xEF\xA3\xBF';;
    skull|bones)           i='\xE2\x98\xA0';;
    ':-)'|':)'|smile|face) i='\xE2\x98\xBA';;
    *)
      entity $1; return 0;;
  esac
  echo -ne "$i";
}

#SHML:END


# Usage / Examples
##
if [[ "$(basename -- "$0")" = "shml.sh" ]]; then
I=2
echo -e "

$(a bold 'SHML Usage / Help')
$(hr '=')

$(a bold 'Section 0: Sourcing')
$(hr '-')

$(i $I)When installed in path:
$(i $I)  source \$(which shml.sh)

$(i $I)When installed locally:
$(i $I)  source ./shml.sh

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

$(i $I)Short Hand: $(a underline 'c')

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

$(i $I)Short Hand: $(a underline 'bg')

$(i $I)\$(bg red 'foo')

$(i $I)Argument list:

$(i $I)black, red, green, yellow, blue, magenta, cyan, gray,
$(i $I)white, darkgray, lightred, lightgreen, lightyellow,
$(i $I)lightblue, lightmagenta, lightcyan

$(i $I)Termination: end, off, reset

$(i $I)Default (no arg): end


$(a bold 'Section 3: Attributes')
$(hr '-')

$(i $I)$(a bold "Attributes only work on vt100 compatible terminals.")

$(i $I)> Note:
$(i $I)> $(a underline 'attribute end') turns off everything,
$(i $I)> including foreground and background color.

$(i $I)\$(attribute bold \"foo bar\")
$(i $I)$(attribute bold "foo bar")

$(i $I)\$(attribute underline \"foo bar\")
$(i $I)$(attribute underline "foo bar")

$(i $I)\$(attribute blink \"foo bar\")
$(i $I)$(attribute blink "foo bar")

$(i $I)\$(attribute invert \"foo bar\")
$(i $I)$(attribute invert "foo bar")

$(i $I)\$(attribute dim)
$(i $I)$(i $I)>>foo bar<<
$(i $I)$(i $I)>>bah boo<<
$(i $I)\$(attribute end)
$(i $I)$(attribute dim)
$(i $I)$(i $I)>>foo bar<<
$(i $I)$(i $I)>>bah boo<<
$(i $I)$(attribute end)

$(i $I)Short Hand: $(a underline 'a')

$(i $I)\$(a bold 'foo')

$(i $I)Argument list:

$(i $I)bold, dim, underline, blink, invert, hidden

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
$(i $I)> Note: short hand for $(a underline 'indent') is $(a underline 'i')
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


$(a bold 'Section 5: Icons / Entities')
$(hr '-')

$(i $I)Icons
$(i $I)$(hr '-' 10)

$(i $I)\$(icon check) \$(icon '<3') \$(icon '*') \$(icon ':)')

$(i $I)$(icon check) $(icon '<3') $(icon '*') $(icon 'smile')

$(i $I)Argument list:

$(i $I)check|checkmark, X|x|xmark, <3|heart, sun, *|star,
$(i $I)darkstar, umbrella, flag, snow|snowflake, music,
$(i $I)scissors, tm|trademark, copyright, apple,
$(i $I):-)|:)|smile|face

$(i $I)Entities
$(i $I)$(hr '-' 10)

$(i $I)A limited implementation of browser HTML Entities.

$(i $I)\$(entity spades) \$(entity clubs) \$(entity hearts) \$(entity diams)

$(i $I)$(entity spades) $(entity clubs) $(entity hearts) $(entity diams)

$(i $I)Entities can also be referenced via 'icon':

$(i $I)\$(icon spades) \$(icon clubs) \$(icon hearts) \$(icon diams)

$(i $I)$(icon spades) $(icon clubs) $(icon hearts) $(icon diams)

$(i $I)Argument list:

$(_entity_list)


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

$(i $I)Short Hand: $(a underline 'bar')
$(i $I)
$(i $I)\$(bar red red red red)

" | less -r
fi

# vim: ft=sh:
