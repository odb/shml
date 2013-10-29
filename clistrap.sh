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

## Adjectives

cs_f[end]='\033[39m' #End Foreground Color
cs_f[black]='\033[30m'
cs_f[red]='\033[31m'
cs_f[green]='\033[32m'
cs_f[yellow]='\033[33m'
cs_f[blue]='\033[34m'
cs_f[magenta]='\033[35m'
cs_f[cyan]='\033[36m'
cs_f[lightgray]='\033[90m'
cs_f[darkgray]='\033[91m'
cs_f[lightgreen]='\033[92m'
cs_f[lightyellow]='\033[93m'
cs_f[lightblue]='\033[94m'
cs_f[lightmagenta]='\033[95m'
cs_f[lightcyan]='\033[96m'
cs_f[white]='\033[97m'

# HEX
# todo make function with switch
#
# function cs_f[hex]() { }
#
#cs_f[000000]='\033[30m'
#cs_f[F00BAF]='\033[31m'
#cs_f[00CD00]='\033[32m'
#cs_f[CDCD00]='\033[33m'
#cs_f[0286fe]='\033[34m'
#cs_f[e100cc]='\033[35m'
#cs_f[00d3cf]='\033[36m'
#cs_f[e4e4e4]='\033[90m'
#cs_f[4c4c4c]='\033[91m'
#cs_f[00fe00]='\033[92m'
#cs_f[f8fe00]='\033[93m'
#cs_f[3a80b5]='\033[94m'
#cs_f[fe00fe]='\033[95m'
#cs_f[00fefe]='\033[96m'
#cs_f[ffffff]='\033[97m'

## Background
# cs == Clistrap
# b  == Background

cs_b[end]='\033[49m' #End Background Color
cs_b[black]='\033[40m'
cs_b[red]='\033[41m'
cs_b[green]='\033[42m'
cs_b[yellow]='\033[43m'
cs_b[blue]='\033[144m'
cs_b[magenta]='\033[45m'
cs_b[cyan]='\033[46m'
cs_b[lightgray]='\033[47m'
cs_b[darkgray]='\033[100m'
cs_b[lightred]='\033[101m'
cs_b[lightgreen]='\033[102m'
cs_b[lightyellow]='\033[103m'
cs_b[lightblue]='\033[104m'
cs_b[lightmagenta]='\033[105m'
cs_b[lightcyan]='\033[106m'
cs_b[white]='\033[107m'

## Gradients
# g == Gradient

cs_g[rainbow]="`for i in {16..21}{21..16}; do echo -en '\033[48;5;${i}m \033[0m'; done; echo`"
cs_g[yellow]="`for i in {226..229}{229..226}; do echo -en '\033[48;5;${i}m \033[0m'; done; echo`"

## Attributes

cs_a[end]='\033[0m' # End Attribute Style
cs_a[reset]='\033[0m'
cs_a[bold]='\033[1m'
cs_a[dim]='\033[2m'
cs_a[italic]='\033[4m'
cs_a[blink]='\033[5m'
cs_a[invert]='\033[7m'
cs_a[hidden]='\033[8m'

## Elements

cs_br='\n'
cs_hr='---------------------------------'
cs_hr[star]='*********************************'
cs_hr[pound]='#################################'
cs_hr[tilde]='~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
cs_hr[dot]='.................................'

## Animations

# brew install bar or http://www.theiling.de/projects/bar.html
cs_loadingbar='bar -c'

# http://fitnr.com/showing-a-bash-spinner.html
cs_spinner()
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

# vim: ft=sh:
