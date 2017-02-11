<hr>
<a name="Foreground"></a>

# Foreground

To set the foreground color of any string or object you need to call the `fgcolor` method followed by an argument.

### Arguments

#### Colors

Fifteen different colors to choose from:<br>
<code class="color-box-black"       >black</code>
<code class="color-box-red"         >red</code>
<code class="color-box-green"       >green</code>
<code class="color-box-yellow"      >yellow</code>
<code class="color-box-blue"        >blue</code>
<code class="color-box-magenta"     >magenta</code>
<code class="color-box-cyan"       >cyan</code>
<code class="color-box-gray"        >gray</code>
<code class="color-box-white"       >white</code>
<code class="color-box-darkgray"    >darkgray</code>
<code class="color-box-lightgreen"  >lightgreen</code>
<code class="color-box-lightyellow" >lightyellow</code>
<code class="color-box-lightblue"   >lightblue</code>
<code class="color-box-lightmagenta">lightmagenta</code>
<code class="color-box-lightcyan"   >lightcyan</code>

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
<img src="../public/images/foreground-demo.png">
</center>
<center><a href="http://code.runnable.com/Vh_zxUB4ufRnyO_F/shml-foreground-for-shell-bash-and-color" target="_blank"><img src="../public/images/demo-on-runnable.png" border="0"></a></center>
