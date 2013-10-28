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

`$ wget https://raw.github.com/jdorfman/clistrap/beta/clistrap.sh`

Next open your Shell script and type the following at the top: 

`source clistrap.sh`

Now that you have included `clistrap.sh` in your shell script you can start using the framework.  Here is a sample:

```sh
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
![Clistrap Foreground Example](http://jdorfman.cdnconnect.com/tmp/clistrap/clistrap-example.png)

In the example above we are prompting the user to make a decision: **Yes** or **No**.  Before Clistrap, the original exception handler was just a simple string that looked similar to the `read` prompt.  Now the exception handler will display the string with style applied.  `Yes` will be **Green** `No` will be **Red**.

But what if you didn't want to change the foreground color, instead you want to change the background color?  Simple just replace `${cs_f_green}` with `${cs_b_green}`.  You also need to make sure to replace the "end" sequence from `${cs_e_f}` to `${cs_e_b}`. 

![Clistrap Background Example](http://jdorfman.cdnconnect.com/tmp/clistrap/clistrap_example_2.png)

Changing Foreground and Background colors are great but that isn't everything Clistrap can do.  For example you can add icons, make text bold among other things:

![Clistrap Attributes Example](http://jdorfman.cdnconnect.com/tmp/clistrap/clistrap_example_officespace.png)

Let's see how this was done shall we?

```sh
fake_install_yes() {
	
	echo -e "\nCreating Coversheet for TPS Reports... ${cs_f_green}${cs_checkmark} Pass${cs_e_f}"
	sleep 1;
	echo -e "Misplaced decimal check... ${cs_f_red}${cs_xmark} Fail${cs_e_f}"
	sleep 1;
	echo -e "Divert fractions of pennies into a bank account... ${cs_f_green}${cs_checkmark} Pass${cs_e_f}"
	sleep 1;
	echo -e "${cs_f_green}${cs_checkmark} Program installed${cs_e_f}"
	sleep 1;
	echo -e "Account Balance: ${cs_bold}${cs_f_red}\$305,326.13 ${cs_e_f}${cs_e_a}"
	sleep 1;
	echo -e "${cs_hr}${cs_br}"
	echo -e "${cs_bold}${cs_f_red}CALL MICHAEL! ${cs_e_f}${cs_e_a}"
}
```
