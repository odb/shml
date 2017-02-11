<hr>
<a name="Sourcing"></a>

# Sourcing
In order to use SHML you must tell your shell environment where it is located.  Lets assume that we are writing a BASH script and want to use SHML.

If you installed in using the 1-liner above you would do:

```bash
#!/usr/bin/env bash
source $(which shml)
```

If you downloaded SHML using git or wget you would do:

```bash
#!/usr/bin/env bash
source ./shml.sh
```
