<hr>
<a name="Color-Bar"></a>

# Color Bar

To add a color bar you need to call the `color-bar` method followed by an (optional) argument.

### Arguments

Fifteen different colors to choose from:

<code>black</code>
<code class="bg-color-box-red"         >red</code>
<code class="bg-color-box-green"       >green</code>
<code class="bg-color-box-yellow"      >yellow</code>
<code class="bg-color-box-blue"        >blue</code>
<code class="bg-color-box-magenta"     >magenta</code>
<code class="bg-color-box-cyan"       >cyan</code>
<code class="bg-color-box-gray"        >gray</code>
<code class="bg-color-box-white"       >white</code>
<code class="bg-color-box-darkgray"    >darkgray</code>
<code class="bg-color-box-lightgreen"  >lightgreen</code>
<code class="bg-color-box-lightyellow" >lightyellow</code>
<code class="bg-color-box-lightblue"   >lightblue</code>
<code class="bg-color-box-lightmagenta">lightmagenta</code>
<code class="bg-color-box-lightcyan"   >lightcyan</code>

### Code Samples

```bash
echo "$(color-bar)"

echo "
$(color-bar red green yellow blue magenta \
cyan lightgray darkgray lightred \
lightmagenta lightcyan)
"

echo "Yeah ahuh, you know what it is $(color-bar black yellow black yellow)"
```

You can also use `bar` as an alias for `color-bar`

```bash
echo "I put it down from the whip to my diamonds, I'm in $(bar black yellow black yellow)"
```

### Results
<center>
<img src="../public/images/color-bar-demo.png">
</center>
<center><a href="http://code.runnable.com/Viu7kFttuDkzWnHs/shml-color-bar-for-shell-and-bash" target="_blank"><img src="../public/images/demo-on-runnable.png" border="0"></a></center>
