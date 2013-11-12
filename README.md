shml
====

`shml.sh` is a shell framework for faster and easier script development.

## Why

HTML has CSS, terminals have "ANSI/VT100 Control Sequences". SHML makes is easy to apply some style to your shell scripts without trying to remember that Yellow = `\033[33m` instead Yellow is `$(color yellow)`.

## How

Run `./shml.sh` for usage/help.

## Examples

### Font Color
For the first example we are going to make the text red.

```sh
#!/usr/bin/env bash
source ./shml.sh

echo "
$(color red)
Couldn’t peep it with a pair of bi-focals.
$(color end)
"
```
### Result

![Red Text](http://jdorfman.cdnconnect.com/odb/images/odb-red-text.jpg)

### Background Color
For the second example we are going to make the background red.

```sh
echo "
$(background red "I'm no joker, play me as a joker")
"
```
### Result

![Red Text](http://jdorfman.cdnconnect.com/odb/images/odb-bkg-red.jpg)

### Icons
In this example we are going to illustrate Pass and Fail Messages using colors and icons

```sh
echo "
$(color green) Pass $(icon check) $(color end)
$(color red) Fail $(icon xmark) $(color end)
"
```
### Result

![Pass Fail](http://jdorfman.cdnconnect.com/odb/images/odb-pass-fail.jpg)

### Horizontal Rule Element
In this example we are going to create 5 hr elements.

```sh
echo "
$(color green)
10 $(hr '-' 10)
20 $(hr '*' 20)
30 $(hr '~' 30)
40 $(hr '#' 40)
50 $(hr '_' 50)
$(color end)
"
```
### Result

![Green HR](http://jdorfman.cdnconnect.com/odb/images/odb-green-hr.jpg)

## Dev

Run tests with `make`.

## Extras

To include the core of `shml.sh` in to another project (and be able to update it) via a script do the following...

1. Add the following to `your_script.sh`

```
#SHML:START

#SHML:END
```

2. Create `update_shml.sh` with the following (replacing `your_script.sh` with your actual script name):

```sh
#!/usr/bin/env bash
SCRIPT_NAME="your_script.sh"
set -xue
curl -L https://raw.github.com/odb/shml/master/shml.sh > shml.sh
awk '/SHML:START/,/SHML:END/' shml.sh | grep -v "SHML:\(START\|END\)" > tmp
mv tmp shml.sh
awk 'FNR==NR{ _[++d]=$0;next}; /SHML:START/{ print; for(i=1;i<=d;i++){ print _[i] }; f=1;next; }; /SHML:END/{f=0}!f' shml.sh $SCRIPT_NAME > tmp
mv tmp $SCRIPT_NAME
chmod 755 $SCRIPT_NAME
rm shml.sh
```

3. Run: `bash ./update_shml.sh` any time you want the latest code.

> Note: While this isn't offically supported, any tweaks/improvments to this method are welcome via an issue labeled 'Enhancment' or by a PR to the readme. Thanks!
