#!/usr/bin/env bash

#SHML:START
#************************************************#
#    SHML - Shell Markup Language Framework
#                   v1.0.4
#                    (MIT)
#        by Justin Dorfman - @jdorfman
#        && Joshua Mervine - @mervinej
#
#        https://maxcdn.github.io/shml/
#************************************************#
SHML_VERSION="1.0.4"

# Progress Bar
##
# options:
# SHML_PROGRESS_CHAR     - width of progress bar, default '#'
# SHML_PROGRESS_WIDTH    - width of progress bar, default 60
# SHML_PROGRESS_MAX      - maximum progress value, default 100
# SHML_PROGRESS_BREAK    - put a new line at the end of the output, default 'true'
# SHML_PROGRESS_CLEAR    - clear line at the end of the output, default 'false'
# SHML_PGOGRESS_NOCURSOR - hide the cursor, default 'true'

progress() {
  [[ -z $SHML_PROGRESS_WIDTH ]]    && SHML_PROGRESS_WIDTH=60
  [[ -z $SHML_PROGRESS_BREAK ]]    && SHML_PROGRESS_BREAK=true
  [[ -z $SHML_PROGRESS_CLEAR ]]    && SHML_PROGRESS_CLEAR=false
  [[ -z $SHML_PROGRESS_NOCURSOR ]] && SHML_PROGRESS_NOCURSOR=true
  # defaults
  local __title="Progress"
  local __steps=10
  local __char="#"

  # arg parser
  [[ ! -z $1 ]] && __title=$1
  [[ ! -z $2 ]] && __steps=$2
  [[ ! -z $3 ]] && __char="$3"

  local __width=${SHML_PROGRESS_WIDTH}
  local __break=${SHML_PROGRESS_BREAK}
  local __clear=${SHML_PROGRESS_CLEAR}
  local __ncursor=${SHML_PROGRESS_NOCURSOR}
  local __pct=0
  local __num=0
  local __len=0
  local __bar=''
  local __line=''

  # ensure terminal
  [[ -t 1 ]] || return 1

  # ensure tput
  if test "$(which tput)"; then
    if $__ncursor; then
      # hide cursor
      tput civis
      trap 'tput cnorm; exit 1' SIGINT
    fi
  fi

  while read __value; do
    # compute pct
    __pct=$(( __value * 100 / __steps ))

    # compute number of blocks to display
    __num=$(( __value * __width / __steps ))

    # create bar string
    if [ $__num -gt 0 ]; then
      __bar=$(printf "%0.s${__char}" $(seq 1 $__num))
    fi

    __line=$(printf "%s [%-${__witdth}s] (%d%%)" "$__title" "$__bar" "$__pct")

    # print bar
    echo -en "${__line}\r"
  done

  # clear line if requested
  if $__clear; then
    __len=$(echo -en "$__line" | wc -c)
    printf "%$((__len + 1))s\r" " "
  fi

  # new line if requested
  $__break && echo

  # show cursor again
  test "$(which tput)" && $__ncursor && tput cnorm
}

# Foreground (Text)
##
fgcolor() {
  local __end='\033[39m'
  local __color=$__end # end by default
  case "$1" in
    end|off|reset)       __color=$__end;;
    black|000000|000)    __color='\033[30m';;
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
    white|ffffff|fff)    __color='\033[97m';;
  esac
  if test "$2"; then
    echo -en "$__color$2$__end"
  else
    echo -en "$__color"
  fi
}

# Backwards Compatibility
color() {
  fgcolor "$@"
}

# Aliases
fgc() {
  fgcolor "$@"
}

c() {
  fgcolor "$@"
}

# Background
##
bgcolor() {
  local __end='\033[49m'
  local __color=$__end # end by default
  case "$1" in
    end|off|reset)       __color=$__end;;
    black|000000|000)    __color='\033[40m';;
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
    white|fffff|fff)     __color='\033[107m';;
  esac

  if test "$2"; then
    echo -en "$__color$2$__end"
  else
    echo -en "$__color"
  fi
}

#Backwards Compatibility
background() {
  bgcolor "$@"
}

#Aliases
bgc() {
  bgcolor "$@"
}

bg() {
  bgcolor "$@"
}

## Color Bar
color-bar() {
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

#Alises
cb() {
  color-bar "$@"
}

bar() {
  color-bar "$@"
}

## Attributes
##
attribute() {
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
a() {
  attribute "$@"
}

## Elements
br() {
  echo -e "\n\r"
}

tab() {
  echo -e "\t"
}

indent() {
  local __len=4
  local __int='^[0-9]+$'
  if test "$1"; then
    if [[ $1 =~ $__int ]] ; then
      __len=$1
    fi
  fi
  while [ $__len -gt 0 ]; do
    echo -n " "
     __len=$(( $__len - 1 ))
  done
}

i() {
  indent "$@"
}

hr() {
  local __len=60
  local __char='-'
  local __int='^[0-9]+$'
  if ! test "$2"; then
    if [[ $1 =~ $__int ]] ; then
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
icon() {
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
  esac
  echo -ne "$i";
}

# Emojis
##
emoji() {
  local i=""
  case "$1" in
    1F603|smiley|'=)'|':-)'|':)')       i='😃';;
    1F607|innocent|halo)                i='😇';;
    1F602|joy|lol|laughing)             i='😂';;
    1F61B|tongue|'=p'|'=P')             i='😛';;
    1F60A|blush|'^^'|blushing)          i='😊';;
    1F61F|worried|sadface|sad)          i='😟';;
    1F622|cry|crying|tear)              i='😢';;
    1F621|rage|redface)                 i='😡';;
    1F44B|wave|hello|goodbye)           i='👋';;
    1F44C|ok_hand|perfect|okay|nice|ok) i='👌';;
    1F44D|thumbsup|+1|like)             i='👍';;
    1F44E|thumbsdown|-1|no|dislike)     i='👎';;
    1F63A|smiley_cat|happycat)          i='😺';;
    1F431|cat|kitten|:3|kitty)          i='🐱';;
    1F436|dog|puppy)                    i='🐶';;
    1F41D|bee|honeybee|bumblebee)       i='🐝';;
    1F437|pig|pighead)                  i='🐷';;
    1F435|monkey_face|monkey)           i='🐵';;
    1F42E|cow|happycow)                 i='🐮';;
    1F43C|panda_face|panda|shpanda)     i='🐼';;
    1F363|sushi|raw|sashimi)            i='🍣';;
    1F3E0|home|house)                   i='🏠';;
    1F453|eyeglasses|bifocals)          i='👓';;
    1F6AC|smoking|smoke|cigarette)      i='🚬';;
    1F525|fire|flame|hot|snapstreak)    i='🔥';;
    1F4A9|hankey|poop|poo|shit)         i='💩';;
    1F37A|beer|homebrew|brew)           i='🍺';;
    1F36A|cookie|biscuit|chocolate)     i='🍪';;
    1F512|lock|padlock|secure)          i='🔒';;
    1F513|unlock|openpadlock)           i='🔓';;
    2B50|star|yellowstar)               i='⭐';;
    1F0CF|black_joker|joker|wild)       i='🃏';;
    2705|white_check_mark|check)        i='✅';;
    274C|x|cross|xmark)                 i='❌';;
    1F6BD|toilet|restroom|loo)          i='🚽';;
    1F514|bell|ringer|ring)             i='🔔';;
    1F50E|mag_right|search|magnify)     i='🔎';;
    1F3AF|dart|bullseye|darts)          i='🎯';;
    1F4B5|dollar|cash|cream)            i='💵';;
    1F4AD|thought_balloon|thinking)     i='💭';;
    1F340|four_leaf_clover|luck)        i='🍀';;
  esac
  echo -ne "$i"
}

function e {
  emoji "$@"
}

#SHML:END


# Usage / Examples
##
if [ "$0" == "$BASH_SOURCE" ]; then

if [[ $@ =~ .*-v.* ]]; then
  echo "shml version ${SHML_VERSION}"
  exit 0
fi

I=2
echo -e "
$(color "lightblue")
#$(hr "*" 48)#
#    SHML - Shell Markup Language Framework
#                   v${SHML_VERSION}
#                    (MIT)
#        by Justin Dorfman - @jdorfman
#        && Joshua Mervine - @mervinej
#
#        https://maxcdn.github.io/shml/
#$(hr "*" 48)#
$(color "end")

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

$(i $I)\$(fgcolor green)
$(i $I)  >>foo bar<<
$(i $I)  >>bah boo<<
$(i $I)\$(fgcolor end)
$(i $I)$(fgcolor green)
$(i $I)>>foo bar<<
$(i $I)>>bah boo<<
$(i $I)$(fgcolor end)

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

$(i $I)\$(bgcolor red \"foo bar\")
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


$(a bold 'Section 5: Icons')
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


$(a bold 'Section 6: Emojis')
$(hr '-')

$(i $I)Couldn't peep it with a pair of \$(emoji bifocals)
$(i $I)Couldn't peep it with a pair of $(emoji bifocals)
$(i $I)
$(i $I)I'm no \$(emoji joker) play me as a \$(emoji joker)
$(i $I)I'm no $(emoji joker) play me as a $(emoji joker)
$(i $I)
$(i $I)\$(emoji bee) on you like a \$(emoji house) on \$(emoji fire), \$(emoji smoke) ya
$(i $I)$(emoji bee) on you like a $(emoji house) on $(emoji fire), $(emoji smoke) ya
$(i $I)
$(i $I)$(a bold 'Each Emoji has 1 or more alias')
$(i $I)
$(i $I)\$(emoji smiley) \$(emoji 1F603) \$(emoji '=)') \$(emoji ':-)') \$(emoji ':)')
$(i $I)$(emoji smiley) $(emoji 1F603) $(emoji '=)') $(emoji ':-)') $(emoji ':)')

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
$(i $I)\$(bar black yellow black yellow black yellow)
$(i $I)$(bar black yellow black yellow black yellow)

$(a bold "Section 8: $(color red "[EXPERIMENTAL]") Progress Bar")
$(hr '-')

$(i $I)Usage: progress [title] [steps] [char]

$(i $I) - 'title' defines the progress bar title
$(i $I) - 'steps' defines the number of steps for the progress bar to act upon
$(i $I) - 'char' defines the character to be displayed in the progress bar

$(i $I)echo "\$\(color green\)"
$(i $I)for i in \$(seq 0 10); do echo \$i; sleep .25; done | progress
$(i $I)echo "\$\(color end\)"

$(color green)
$(i $I)Example  [####################                    ] (50%)
$(color end)

$(i $I)'progress' supports overriding default values by setting the following
$(i $I)variables:

$(i $I) - SHML_PROGRESS_WIDTH    - width of progress bar, default 60
$(i $I) - SHML_PROGRESS_BREAK    - put a new line at the end of the output, default 'true'
$(i $I) - SHML_PROGRESS_CLEAR    - clear line at the end of the output, default 'false'
$(i $I) - SHML_PGOGRESS_NOCURSOR - hide the cursor, default 'true'

$(i $I)NOTE: These variables $(a bold 'must') be defined before sourcing 'shml'!

" | less -r
fi

# vim: ft=sh:
