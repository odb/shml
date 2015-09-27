<hr>
<a name="Color-Bar"></a>
# Color Bar

To add a color bar you need to call the `color-bar` method followed by an (optional) argument.

### Arguments

Fifteen different colors to choose from:

`black` `red` `green` `yellow` `blue` `magenta` `cyan` `gray`
`white` `darkgray` `lightgreen` `lightyellow` `lightblue`
`lightmagenta` `lightcyan`

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
![Color Bar Demo](../public/images/color-bar-demo.png)
</center>
