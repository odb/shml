clistrap
========

`clistrap.sh` is a command-line interface style framework for faster and easier shell script development.

**Please Note**: This is a work in progress, naming conventions will change.  Also feel free to contribute by making a pull request.

## Why

HTML has CSS, CLI has "ANSI/VT100 Control Sequences".  Clistrap makes is easy to apply some style to your shell scripts without trying to remember that Yellow = `\033[33m` instead Yellow is `cs_f_yellow`. If you couldn't tell, Clistrap is heavily inspired by [Bootstrap](http://getbootstrap.com).

## How

Run `./clistyle.sh` for usage.
```
CLIstyle Usage / Help
============================================================

Section 0: Sourcing
------------------------------------------------------------

  When installed in path:
    source $(which clistyle.sh)

  When installed locally:
    source ./clistyle.sh

Section 1: Foreground
------------------------------------------------------------

  $(color red "foo bar")

  $(color blue "foo bar")

  $(color green)
    >>foo bar<<
    >>bah boo<<
  $(color end)

  Short Hand: c

  $(c red 'foo')

  Argument list:

  black, red, green, yellow, blue, magenta, cyan, gray,
  white, darkgray, lightgreen, lightyellow, lightblue,
  lightmagenta, lightcyan

  Termination: end, off, reset

  Default (no arg): end


Section 2: Background
------------------------------------------------------------

  $(background red "foo bar")

  $(background blue "foo bar")

  $(background green)
    >>foo bar<<
    >>bah boo<<
  $(background end)

  Short Hand: bg

  $(bg red 'foo')

  Argument list:

  black, red, green, yellow, blue, magenta, cyan, gray,
  white, darkgray, lightred, lightgreen, lightyellow,
  lightblue, lightmagenta, lightcyan

  Termination: end, off, reset

  Default (no arg): end


Section 3: Attributes
------------------------------------------------------------

  !! EXPERMENTAL !!
  AKA It doesn't work for me, but should.

  > Note:
  > attribute end turns off everything,
  > including foreground and background color.

  $(attribute bold "foo bar")

  $(attribute italic "foo bar")

  $(attribute dim)
    >>foo bar<<
    >>bah boo<<
  $(attribute end)

  Short Hand: a

  $(a bold 'foo')

  Argument list:

  bold, dim, italic, blink, invert, hidden

  Termination: end, off, reset

  Default (no arg): end


Section 4: Elements
------------------------------------------------------------

  foo$(br)$(tab)bar

  foo$(br)$(indent)bar$(br)$(indent 6)boo

  > Note: short hand for `indent` is `i`

  $(hr)

  $(hr 50)

  $(hr '~' 40)

  $(hr '#' 30)


Section 5: Icons
------------------------------------------------------------

  $(icon check) $(icon '<3') $(icon '*') $(icon ':)')


Section 6: Mixed Examples
------------------------------------------------------------

  $(bg white "$(c black "foo bar")")

  $(bg green)$(c red)$(a bold)
    >>foo bar<<
    $(hr "$(i \'darkstar\')" 11)
    >>bah boo<<
  $(a end)$(c end)$(bg end)

  Argument list:

  check|checkmark, X|x|xmark, <3|heart, sun, *|star,
  darkstar, umbrella, flag, snow|snowflake, music,
  scissors, tm|trademark, copyright, apple,
  :-)|:)|smile|face


Section 7: Color Bar
------------------------------------------------------------

  $(color-bar)

  $(color-bar red green yellow blue magenta \
                 cyan lightgray darkgray lightred \
                 lightgreen lightyellow lightblue \
                 lightmagenta lightcyan)

  Short Hand: bar

  $(bar red red red red)

```
## Dev

Run tests with `make`.

## Extras

To include the core of `clistyle.sh` in to another project (and be able to update it) via a script do the following...

1. Add the following to `your_script.sh`

```
#CLISTYLE:START

#CLISTYLE:END
```

2. Create `update_clistyle.sh` with the following (replacing `your_script.sh` with your actual script name):

```
#!/usr/bin/env bash
SCRIPT_NAME="your_script.sh"
set -xue
curl -L https://raw.github.com/jdorfman/clisyle/master/clistyle.sh > clistyle.sh
awk '/CLISTYLE:START/,/CLISTYLE:END/' clistyle.sh | grep -v "CLISTYLE:\(START\|END\)" > tmp
mv tmp clistyle.sh
awk 'FNR==NR{ _[++d]=$0;next}; /CLISTYLE:START/{ print; for(i=1;i<=d;i++){ print _[i] }; f=1;next; }; /CLISTYLE:END/{f=0}!f' clistyle.sh $SCRIPT_NAME > tmp
mv tmp $SCRIPT_NAME
chmod 755 $SCRIPT_NAME
rm clistyle.sh
```

3. Run: `bash ./update_clistyle.sh` any time you want the latest code.

> Note: While this isn't offically supported, any tweaks/improvments to this method are welcome via an issue labeled 'Enhancment' or by a PR to the readme. Thanks!
