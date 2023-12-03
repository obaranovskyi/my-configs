## Include external config


```bash
# ~/.config/ranger/rc.conf

# Include external configuration file
source /path/to/external_conf.rc
```

```bash
# In my case
source ~/my-configs/ranger/rc.conf
```

## Colorschemes

More: https://github.com/ranger/ranger/blob/master/doc/colorschemes.md

Clone this one:
https://github.com/ranger/colorschemes

## Z-Jumper integration

https://github.com/ask1234560/ranger-zjumper/tree/master

```python
# this line might be updated
z_loc = getenv("_Z_SRC") or '~/.z.sh'
```

## FZF Integration

https://github.com/cjbassi/ranger-fzf
