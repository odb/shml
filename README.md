<div align="center">
	<img width="400" src="docs/public/images/odb-shml-logo-readme.svg" alt="SHML by ODB">
</div>

SHML v.1.1.0
====

[![Build Status](https://travis-ci.org/odb/shml.svg)](https://travis-ci.org/odb/shml)

SHML is a shell framework for faster and easier script development.

### Why

HTML has CSS, terminals have "ANSI/VT100 Control Sequences". SHML makes is easy to apply some style to your shell scripts without trying to remember that Yellow = `\033[33m` instead Yellow is `$(color yellow)`.

### 1-liner Install
```bash
# Unix-like
$ sudo bash -c 'curl -L https://raw.githubusercontent.com/odb/shml/1.1.0/shml.sh -o /usr/local/bin/shml && chmod +x /usr/local/bin/shml'

# Homebrew
$ brew install shml

# npm
$ npm install -g shml
```

### Download

> You can just download SHML without installing it...

#### Git

`$ git clone https://github.com/odb/shml.git`

#### wget

`$ wget https://raw.githubusercontent.com/odb/shml/master/shml.sh`

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

View all examples: [https://odb.github.io/shml/getting-started/](https://odb.github.io/shml/getting-started/)

### Contributing

Contributions are more than welcome. Before submitting ANY new features please read the [Contribution Guidelines](https://github.com/odb/shml/blob/master/CONTRIBUTING.md).

To report any bugs or if you have a feature request feel free to [open an issue](https://github.com/odb/shml/issues).

#### Updating The Docs
Updating the docs requires Ruby/Jekyll to generate & view locally.

**Run once:**
```
$ cd docs/
$ gem install bundler
$ bundle install
```

**Generate and serve:**
```
$ bundle exec jekyll s --watch
```
Then go to: `http://localhost:4000/shml/`
