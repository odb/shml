clistrap
========

Clistrap is a command-line interface style framework for faster and easier shell script development.

## Why

HTML has CSS, CLI has "ANSI/VT100 Control Sequences".  Clistrap makes is easy to apply some style to your shell scripts without trying to remember that Yellow = `\033[33m` instead Yellow is `cs_f_yellow`. If you couldn't tell, Clistrap is heavily inspired by [Bootstrap](http://getbootstrap.com).

## What

Before getting started lets review the naming conventions:

### Colors
* `cs` == clistrap
* `f`  == Foreground
* `b`  == Background
* `g`  == Gradient
* `l`  == Light
* `d`  == Dark
* `e`  == End

### Color Examples

## How

It is easy to get started with Clistrap.  Download (and Copy) `clistrap.sh` into your project folder:

`$ wget https://raw.github...`

Next open your Shell script and type the following at the top: 

`source clistrap.sh`

Now that you have included `clistrap.sh` in your shell script you can start using the framework.  Here is a sample:

```shell

#!/usr/bin/env bash

source clistrap.sh

while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) make install; break;;
        [Nn]* ) exit;;
        * ) echo -e "Please answer ${cs_f_green}yes${cs_e_fc} or ${cs_f_red}no${cs_e_fc}.";;
    esac
done

```
![Clistrap Example](http://jdorfman.cdnconnect.com/tmp/clistrap/clistrap-example.gif)

In the example above we are prompting the user to make a decision: **Yes** or **No**.  Before Clistrap, the original exception handler was just a simple string that looked similar to the `read` prompt.  Now the exception handler will display the string with style applied.  `Yes` will be **Green** `No` will be **Red**.

But what if you didn't want to change the foreground color, instead you want to change the background color?  Simple just replace `${cs_f_green}` with `${cs_b_green}`.  You also need to make sure to replace the "end" sequence from `${cs_e_fc}` to `${cs_e_bc}`. 