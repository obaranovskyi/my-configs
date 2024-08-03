# INFO

If you want your python script to be executed by the system you need to create folder with your app name with `main.py` inside it.

For instance,

```
my-app/
  main.py
```

Then you can run your app by typing `my-app` in the terminal.

If the script has dependencies, put it in `package-setup.py` and run it:

```bash
package-setup
```

## Aliases

Python aliases are setup in `~/my-configs/zsh/scripts/aliases.sh`.

## Symlink

To use `util` module in your python script, you need to create a symlink to it inside of the python command folder.
Here is an example for the `structure` module:

```bash
ln -s ~/my-configs/python/util ~/my-configs/python/structure/util
```

## Dependencies

If there program uses dependencies, you can install them by running `package-setup.py` script.
But first you need to create a `requirements.txt` file with the dependencies listed.

```bash

```
