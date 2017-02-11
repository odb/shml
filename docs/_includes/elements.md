<hr>
<a name="Elements"></a>

# Elements

Elements are methods that work a lot like `<hr>` & `<br>` HTML element tags. There is also a `tab` & `indent` method that acts like a `&nbsp;` character entity. They are empty which means that they have no termination ends like the foreground `color`, `background` and `attribute` methods.

### Arguments

The only method that allows arguments is `hr`:

`~` `#` `*` `+` and/or any number e.g. `50`

### Code Samples (hr)
```bash
echo "$(hr)"
```
```bash
echo "$(hr 40)"
```
```bash
echo "$(hr '~' 30)"
```
```bash
echo "$(hr '#' 20)"
```
```bash
echo "$(hr '*' 10)"
```
```bash
echo "$(hr '+' 5)"
```

### Results (hr)
<center>
<img src="../public/images/elements-hr-demo.png">
</center>

### Code Samples (br, indent, tab)

Break Line

```bash
echo "Wu$(br)Wu Tang$(br)Wu Tang$(br)Killah Beez$(br)We on a swarm"
```
Indent

```bash
echo "W$(indent)U$(indent)T$(indent)A$(indent)N$(indent)G"
```

You can also use `i` as an alias for `indent`

```bash
echo "F$(i)O$(i)R$(i)E$(i)V$(i)A"
```

Tab

```bash
echo "W$(tab)U$(tab)T$(tab)A$(tab)N$(tab)G"
```

### Results (br, indent, tab)
<center>
<img src="../public/images/elements-other-demo.png">
</center>
<center><a href="http://code.runnable.com/ViKAzLgQjHx6yn8U/shml-elements-for-shell-bash-hr-br-indent-and-tab" target="_blank"><img src="../public/images/demo-on-runnable.png" border="0"></a></center>
