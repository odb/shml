<hr>
<a name="Emojis"></a>
# Emojis

To add an emoji you need to call the `emoji` method followed by an argument. Each emoji added to SHML was approved as part of [Unicode&reg; 6.0.0 Standard](http://unicode.org/versions/Unicode6.0.0/) in 2010.

### Arguments

| Argument  	| Alias(es) 	| Result  	|
|---	|---	|---	|
|   `smiley`	|   `1F603` `'=)'` `':-)'` `':)'`	|   😄	|
|   `innocent`	|   `1F607` `halo`	|   😇	|
|   `joy`	|   `1F602` `lol` `laughing`	|   😂	|
|   `=p`|   `1F61B` `stuck_out_tongue` `=P`	|   😛	|
|   `worried`|   `1F61F` `sadface` `sad`	|   😟	|
|   `cry`|   `1F622` `crying` `tear`	|   😢	|
|   `rage`|   `1F621` `redface`	|   😡	|
|   `wave`|   `1F44B` `hello` `goodbye`	|   👋	|
|   `ok_hand`|   `1F44C` `perfect` `okay` `nice`	|   👌	|
|   `thumbsup`|   `1F44D` `+1` `like`	|   👍	|
|   `thumbsdown`|   `1F44E` `-1` `no` `dislike`	|   👎	|
| `smiley_cat` 	|  `1F63A` `happycat`	|   😺	|
| `cat` 	|   `1F431` `kitten` `:3` `kitty`	|   🐱	|
| `dog` 	|   `1F436` `puppy`	|   🐶	|
| `bee` 	|   `1F41D` `honeybee` `bumblebee`	|   🐝	|
| `pig` 	|   `1F437` `pighead`	|   🐷	|
| `monkey` 	|   `1F437` `monkey_face`	|   🐵	|
| `cow` 	|   `1F42E` `happycow`	|   🐮	|
| `panda` 	|  `1F43C` `panda_face` `shpanda`	|   🐼	|
|  `sushi`	|   `1F363` `raw` `sashimi`	|  🍣	|
|   `home`	|   `1F3E0` `house`	|   🏠	|
|   `eyeglases`	|   `1F453` `bifocals` `eyeglasses`	|   👓	|
|   `smoke`	|   `1F6AC` `smoking` `cigarette`	|   🚬	|
|   `fire`	|   `1F525` `flame` `hot`	|   🔥	|
|   `hankey`	|   `1F4A9` `poop` `shit`	|   💩	|
|   `beer`	|   `1F37A` `homebrew` `brew`	|   🍺	|
|   `cookie`	|   `1F36A` `biscuit` `chocolate`	|   🍪	|
|   `lock`	|   `1F512` `padlock` `secure`	|   🔒	|
|   `unlock`	|   `1F513` `openpadlock`	|   🔓	|
|   `star`	|   `2B50` `yellowstar`	|   ⭐	|
|   `joker`	|   `1F0CF` `black_joker` `wild`	|   🃏	|
|   `check`	|   `2705` `white_check_mark`	|   ✅	|
|   `x`	|   `274C` `cross` `xmark`	|   ❌	|
|   `toilet`	|   `1F6BD` `restroom` `loo`	|   🚽	|
|   `bell`	|   `1F514` `ringer` `ring`	|   🔔	|
|   `search`	|   `1F50E` `mag_right` `magnify`	|   🔎	|
|   `dart`	|  `1F3AF` `bullseye` `darts`	|   🎯	|
|   `cash`	|   `1F4B5` `dollar` `cream`	|   💵	|
|   `thinking`	|   `1F4AD` `thought_balloon`	|   💭	|
|   `luck`	|   `1F340` `four_leaf_clover`	|   🍀	|

### Code Samples

```bash
echo "Couldn't peep it with a pair of $(emoji bifocals)"
echo "I'm no $(emoji joker) play me as a $(emoji joker)"
echo "$(emoji bee) on you like a $(emoji house) on $(emoji fire), $(emoji smoke) ya"
```

### Results
<center>
![Emojis Demo](../public/images/emojis-demo.png)
</center>
<center><a href="http://code.runnable.com/Viu5vP4l21kzxZI2/shml-emojis-for-shell-bash-and-icons" target="_blank"><img src="../public/images/demo-on-runnable.png" border="0"></a></center>
