source ./clistrap.sh

echo -e "
Example 1: Foreground

  \$(cs-color red \"foo bar\")
  $(cs-color red "foo bar")

  \$(cs-color blue \"foo bar\")
  $(cs-color blue "foo bar")

  \$(cs-color green)
    >>foo bar<<
    >>bah boo<<
  \$(cs-color end)
  $(cs-color green)
  >>foo bar<<
  >>bah boo<<
  $(cs-color end)

  Aliases:
  - cs.color

Example 2: Background

  \$(cs-bg-color red \"foo bar\")
  $(cs-bg-color red "foo bar")

  \$(cs-bg-color blue \"foo bar\")
  $(cs-bg-color blue "foo bar")

  \$(cs-bg-color green)
    >>foo bar<<
    >>bah boo<<
  \$(cs-bg-color end)
$(cs-bg-color green)
  >>foo bar<<
  >>bah boo<<
$(cs-bg-color end)

  Aliases:
  - cs-background
  - cs.bg.color
  - cs.background

Example 3: Attributes

  !! EXPERMENTAL !!
  (AKA It doesn't work for me, but should.)

  Note:
  'cs-attribute end' turns off everything, including
  foreground and background color.

  \$(cs-attribute bold \"foo bar\")
  $(cs-attribute bold "foo bar")

  \$(cs-attribute italic \"foo bar\")
  $(cs-attribute italic "foo bar")

  \$(cs-attribute dim)
    >>foo bar<<
    >>bah boo<<
  \$(cs-attribute end)
  $(cs-attribute dim)
  >>foo bar<<
  >>bah boo<<
  $(cs-attribute end)

  Aliases:
  - cs-attr
  - cs.attribute
  - cs.attr

Example 4: Elements

  foo\$(cs-br)\$(cs-tab)bar
  foo$(cs-br)$(cs-tab)bar

  \$(cs-hr)
  $(cs-hr)

  \$(cs-hr 50)
  $(cs-hr 50)

  \$(cs-hr '~' 40)
  $(cs-hr '~' 40)

  \$(cs-hr '#' 30)
  $(cs-hr '#' 30)

  Aliases:
  - cs.br
  - cs.tab
  - cs.hr

Example 5: Icons

  \$(cs-icon check) \$(cs-icon '<3') \$(cs-icon '*') \$(cs-icon ':)')
  $(cs-icon check) $(cs-icon '<3') $(cs-icon '*') $(cs-icon ':)')

  Aliases:
  - cs.icon

Example 6: Mixed

  \$(cs-bg-color white \"\$(cs-color black \"foo bar\")\")
  $(cs-bg-color white "$(cs-color black "foo bar")")

  \$(cs-bg-color green)\$(cs-color red)\$(cs-attribute bold)
    >>foo bar<<
    \$(cs-hr \"\$(cs-icon \'star\')\" 11)
    >>bah boo<<
  \$(cs-attribute end)\$(cs-color end)\$(cs-bg-color end)
$(cs-bg-color green)$(cs-color red)$(cs-attribute bold)
  >>foo bar<<
  $(cs-hr "$(cs-icon 'star')" 11)
  >>bah boo<<
$(cs-attribute end)$(cs-color end)$(cs-bg-color end)

Example 7: Color Bar

  \$(cs-color-bar)
  $(cs-color-bar)

  \$(cs-color-bar red green yellow blue magenta \\
                  cyan lightgray darkgray lightred \\
                  lightgreen lightyellow lightblue \\
                  lightmagenta lightcyan)
  $(cs-color-bar red green yellow blue magenta \
                  cyan lightgray darkgray lightred \
                  lightgreen lightyellow lightblue \
                  lightmagenta lightcyan)

"
