---
layout: home
title: Home
---

> Shimmy shimmy ya, shimmy yam, shimmy yay - O.D.B. '95

`SHML` is a shell framework for faster and easier script development.

## Why
HTML has CSS, terminals have `ANSI/VT100 Control Sequences`. SHML makes is easy to apply some style to your shell scripts without trying to remember that `Yellow = \033[33m` instead Yellow is `$(color yellow)`.

<div align="center">
<img src="public/images/terminal-home.png">
</div>

## Install
```bash
$ sh -c "curl https://raw.githubusercontent.com/maxcdn/shml/master/shml.sh -o /usr/local/bin/shml && chmod +x /usr/local/bin/shml"
```
## Run
```bash
$ shml "$(color yellow)Couldn't peep it with a pair of 👓$(color end)"
```
`Couldn't peep it with a pair of 👓`
