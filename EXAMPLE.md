### Real-world Example

Taking from CLIstyle Usage

``` bash
source ./clistyle.sh
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
```
