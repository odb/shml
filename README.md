SHML v.1.0.4
====

[![Build Status](https://travis-ci.org/MaxCDN/shml.svg)](https://travis-ci.org/MaxCDN/shml)

SHML is a shell framework for faster and easier script development.

### Why

HTML has CSS, terminals have "ANSI/VT100 Control Sequences". SHML makes is easy to apply some style to your shell scripts without trying to remember that Yellow = `\033[33m` instead Yellow is `$(color yellow)`.

### 1-liner Install
```bash
# Unix-like
$ sudo bash -c 'curl -L https://raw.githubusercontent.com/maxcdn/shml/latest/shml.sh -o /usr/local/bin/shml && chmod +x /usr/local/bin/shml'

# Darwin (Homebrew)
$ brew install shml

# NPM
$ npm install -g shml
```

### Download

> You can just download SHML without installing it...

#### Git

`$ git clone https://github.com/MaxCDN/shml.git`

#### wget

`$ wget https://raw.githubusercontent.com/maxcdn/shml/latest/shml.sh`

### Sourcing

In order to use SHML you must tell your shell environment where it is located. Lets assume that we are writing a BASH script and want to use SHML.

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
### Examples

```bash
#!/usr/bin/env bash
source "$(which shml)"

echo "
$(fgcolor red)
This will make the text red...
$(fgcolor end)
"
```

View all examples: [https://maxcdn.github.io/shml/getting-started/](https://maxcdn.github.io/shml/getting-started/)
<center><a href="http://code.runnable.com/u/jdorfman" target="_blank"><img src="https://maxcdn.github.io/shml/public/images/demo-on-runnable.png" border="0"></a></center>

### Contributing

Contributions are more than welcome. Before submitting ANY new features please read the [Contribution Guidelines](https://github.com/MaxCDN/shml/blob/master/CONTRIBUTING.md).

To report any bugs or if you have a feature request feel free to [open an issue](https://github.com/MaxCDN/shml/issues).

You can also email: **jdorfman at maxcdn dot com** with any questions, suggestion or concerns.

Thanks!
