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

## Foreground (Text)
# cs == clistrap
# f  == Foreground
# l  == Light
# d  == Dark
# e  == End

## Adjectives

cs_e_f='\033[39m' #End Foreground Color
cs_f_black='\033[30m'
cs_f_red='\033[31m'
cs_f_green='\033[32m'
cs_f_yellow='\033[33m'
cs_f_blue='\033[34m'
cs_f_magenta='\033[35m'
cs_f_cyan='\033[36m'
cs_f_l_gray='\033[90m'
cs_f_d_gray='\033[91m'
cs_f_l_green='\033[92m'
cs_f_l_yellow='\033[93m'
cs_f_l_blue='\033[94m'
cs_f_l_magenta='\033[95m'
cs_f_l_cyan='\033[96m'
cs_f_white='\033[97m'

# HEX

cs_f_000000='\033[30m'
cs_f_F00BAF='\033[31m'
cs_f_00CD00='\033[32m'
cs_f_CDCD00='\033[33m'
cs_f_0286fe='\033[34m'
cs_f_e100cc='\033[35m'
cs_f_00d3cf='\033[36m'
cs_f_e4e4e4='\033[90m'
cs_f_4c4c4c='\033[91m'
cs_f_00fe00='\033[92m'
cs_f_f8fe00='\033[93m'
cs_f_3a80b5='\033[94m'
cs_f_fe00fe='\033[95m'
cs_f_00fefe='\033[96m'
cs_f_ffffff='\033[97m'

## Background
# cs == Clistrap
# b  == Background
# l  == Light
# d  == Dark
# e  == End

cs_e_b='\033[49m' #End Background Color
cs_b_black='\033[40m'
cs_b_red='\033[41m'
cs_b_green='\033[42m'
cs_b_yellow='\033[43m'
cs_b_blue='\033[144m'
cs_b_magenta='\033[45m'
cs_b_cyan='\033[46m'
cs_b_l_gray='\033[47m'
cs_b_d_gray='\033[100m'
cs_b_l_red='\033[101m'
cs_b_l_green='\033[102m'
cs_b_l_yellow='\033[103m'
cs_b_l_blue='\033[104m'
cs_b_l_magenta='\033[105m'
cs_b_l_cyan='\033[106m'
cs_b_white='\033[107m'

## Gradients
# g == Gradient

cs_g_rainbow="`for i in {16..21}{21..16}; do echo -en "\033[48;5;${i}m \033[0m"; done; echo`"
cs_g_yellow="`for i in {226..229}{229..226}; do echo -en "\033[48;5;${i}m \033[0m"; done; echo`"

## Attributes

cs_e_a='\033[0m' # End Attribute Style
cs_reset='\033[0m'
cs_bold='\033[1m'
cs_dim='\033[2m'
cs_italic='\033[4m'
cs_blink='\033[5m'
cs_invert='\033[7m'
cs_hidden='\033[8m'

## Elements

cs_br='\n'
cs_hr='---------------------------------'
cs_hr_stars='*********************************'

## Animations

# brew install bar or http://www.theiling.de/projects/bar.html
cs_loadingbar='bar -c'

# http://fitnr.com/showing-a-bash-spinner.html
spinner()
{
    local pid=$1
    local delay=0.75
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid 2 > /dev/null)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}


## Icons

cs_checkmark='✓'
cs_xmark='✘'
cs_heart='❤'
cs_sun='☀'
cs_star='★'
cs_star_empty='☆'
cs_umbrella='☂'
cs_flag='⚑'
cs_snowflake='❄'
cs_music='♫'
cs_scissors='✂'
cs_trademark='™'
cs_copyright='©'
cs_apple=''
cs_smile_face="☺"

