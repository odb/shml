<hr>
<a name="Foreground"></a>
# Foreground

To set the foreground color of any string or object you need to call the `fgcolor` method followed by an argument.

### Arguments

#### Colors

Fifteen different colors to choose from:

`black` `red` `green` `yellow` `blue` `magenta` `cyan` `gray`
`white` `darkgray` `lightgreen` `lightyellow` `lightblue`
`lightmagenta` `lightcyan`


#### Termination
Following a string or object you must terminate the `fgcolor` method to ensure color doesn't bleed.  You can use any of the following termination arguments:

`end` `off` or `reset`

### Code Samples

Here we will demonstrate how the `fgcolor` method can be used on a single line.

```bash
echo $(fgcolor green "RZA GZA") $(fgcolor end)
```
Some times one-line is not enough.

```bash
echo "
$(fgcolor yellow)
Inspectah Deck
Ghostface Killah
$(fgcolor end)
"
```

You can also use `fgc` as an alias for `fgcolor`.

```bash
echo $(fgc red "Killa Beez on a swarm") $(fgc end)
```

### Results
Here is what the output should look like.  Style may differ slightly depending on your terminal emulator settings.
<center>
![Foreground Demo](../public/images/foreground-demo.png)
</center>
Give it a try, we'll wait here for you.
