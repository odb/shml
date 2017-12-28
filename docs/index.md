---
layout: home
title: Home
---

### Why
HTML has CSS, Unix-like shells have ANSI/VT100 Control Sequences. SHML makes is easy to apply style to your shell scripts without trying to remember that **yellow** is `\033[33m` instead it's `$(color yellow)`.

### 1-liner Install
```bash
# Unix-like
$ sudo bash -c 'curl -L https://raw.githubusercontent.com/odb/shml/latest/shml.sh -o /usr/local/bin/shml && chmod +x /usr/local/bin/shml'

# Darwin (Homebrew)
$ brew install shml

# NPM
$ npm install -g shml
```

<div align="center">
<small>Currently v{{site.version}}
<br><a href="getting-started/">Please be responsible &amp; RTFM</a>
</small>
<br><br>
<iframe src="slideshow.html" width="100%" height="250" frameborder="0"></iframe>
</div>
<hr>

{% include footer.html %}
