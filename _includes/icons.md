<hr>
<a name="Icons"></a>
## Icons
Icons are flat ascii characters that are supported by most unix-like systems.  If you run into compatibility issues please [report it here](https://github.com/MaxCDN/shml/issues).

### Arguments

`checkmark` `xmark` `heart` `sun` `star`
`darkstar` `umbrella` `flag` `snowflake` `music`
`scissors` `trademark` `copyright` `apple` `smile`

### Code Samples

Peter, a software engineer likes to use the `xmark` icon in his programs:

```bash
echo "$(icon xmark)TPS Report $(icon xmark)Lumberg $(icon xmark)Working"
```

When he is in a better mood, he tends to use the `check` icon:

```bash
echo "$(icon check)Kung Fu $(icon check)Fishing $(icon check)Sleep"
```

Sometimes he even uses the foreground `color` method to add some emphasis:

```bash
echo "$(color red)$(icon xmark)$(color end)TPS Report $(color green)$(icon check)$(color end)Fishing"
```

### Results
