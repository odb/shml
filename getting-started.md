---
layout: page
title: 'Getting Started'
---

<p class="message">
  An overview of SHML, how to download, install and use, syntax overview with examples.
</p>

To use SHML you must have unix-like (Darwin/OS X, Linux, etc.) POSIX-compliant operating system that supports ANSI/VT100 Control Sequences.  If you are using an up to date version of OS X or any Linux distribution you should be good to go.  If you run into issues please [report it here](https://github.com/MaxCDN/shml/issues).

<hr>
<a name="Install"></a>
# Install

#### 1-liner
```bash
$ curl -s https://raw.githubusercontent.com/maxcdn/shml/master/shml.sh -o /usr/local/bin/shml && chmod +x /usr/local/bin/shml
```

<p class="message">
You can also just download SHML without installing it...
</p>

#### Git
```bash
$ git clone git@github.com:MaxCDN/shml.git
```

#### Wget
```bash
$ wget https://github.com/MaxCDN/shml/archive/master.zip
```

<hr>
<a name="Sourcing"></a>
# Sourcing
In order to use SHML you must tell your shell environment where it is located.  Lets assume that we are writing a BASH script and want to use SHML.

If you installed in using the 1-liner above you would do:

```bash
#!/usr/bin/env bash
source $(which shml)
```

If you downloaded SHML using git or wget you would do:

```bash
#!/usr/bin/env bash
source ./shml.sh
```
<hr>
<a name="Foreground"></a>
# Foreground

To set the foreground color of any string or object you need to call the `color` function followed by an argument.

### Arguments

#### Colors

Fifteen different colors to choose from:

`black` `red` `green` `yellow` `blue` `magenta` `cyan` `gray`
`white` `darkgray` `lightgreen` `lightyellow` `lightblue`
`lightmagenta` `lightcyan`


#### Termination
Following a string or object you must terminate the function to ensure color doesn't bleed.  You can use any of the following termination arguments:

`end` `off` or `reset`

### Code Samples

Here we will demonstrate how SHML can be used on a single line.

```bash
echo "$(color green) RZA GZA $(color end)"
```
Some times one-line is not enough.

```bash
echo "
$(color yellow)
Inspectah Deck
Ghostface Killah
$(color end)
"
```

You can also use `c` as an alias for `color`.

```bash
echo "$(c red) Killa Beez on a swarm $(c end)"
```

### Results
Here is what the output should look like.  Style may differ slightly depending on your particular terminal emulator settings.
<center>
![Foreground Demo](/public/images/foreground-demo.png)
</center>
Give it a try, we'll wait here for you.
<hr>

<a name="Background"></a>
## Background

`$(background lightgreen "I'm the O-D-B")`

```
$(background green)
...as you can see
$(background end)
```

Tip: you can also use `bg` as an alias for `background`

`$(bg green 'CREAM')`

### Argument List

<p class="message">
black, red, green, yellow, blue, magenta, cyan, gray,
white, darkgray, lightred, lightgreen, lightyellow,
lightblue, lightmagenta, lightcyan
</p>

### Termination
`end` `off` `reset`

<a name="Attributes"></a>
## Attributes

    Attributes only work on vt100 compatible terminals.

    > Note:
    > attribute end turns off everything,
    > including foreground and background color.

    $(attribute bold "foo bar")
    foo bar

    $(attribute underline "foo bar")
    foo bar

    $(attribute blink "foo bar")
    foo bar

    $(attribute invert "foo bar")
    foo bar

    $(attribute dim)
foo
    $(attribute end)

Short Hand: a

`$(a bold 'foo')`

Argument list:

bold, dim, underline, blink, invert, hidden

Termination: end, off, reset

Default (no arg): end

<a name="Elements"></a>
## Elements

    foo$(br)$(tab)bar
    foo
        bar

    foo$(br)$(indent)bar$(br)$(indent 6)boo
    foo
    bar
    boo

    > Note: short hand for indent is i
```
    $(hr)
    ------------------------------------------------------------

    $(hr 50)
    --------------------------------------------------

    $(hr '~' 40)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    $(hr '#' 30)
    ##############################
```

<a name="Icons"></a>
## Icons

`$(icon check) $(icon '<3') $(icon '*') $(icon ':)')`

✓ ❤ ★ ☺

### Argument List

<p class ="method">
check|checkmark, X|x|xmark, <3|heart, sun, *|star,
darkstar, umbrella, flag, snow|snowflake, music,
scissors, tm|trademark, copyright, apple,
:-)|:)|smile|face
</p>
<hr>
<a name="Emojis"></a>
## Emojis

`$(color yellow 'My name is Dirt') $(emoji dog)`

`My name is Dirt 🐶`

### Argument List

<p class="message">
panda, dog|woof, cookie, secure|lock, *|star,
poop, monkey, cry|crying|=*(, =)|:-)|:)|smile|face
</p>


<a name="Color-Bar"></a>
## Color Bar

```
$(color-bar)

$(color-bar red green yellow blue magenta \
    cyan lightgray darkgray lightred \
    lightgreen lightyellow lightblue \
    lightmagenta lightcyan)


Short Hand: bar

$(bar red red red red)
```
