## To set from the other side:

```lua
package.path = "/Users/obaranovskyi/my-configs/neovim/?.lua;" .. package.path
require "init"
```

## Add lazy.nvim symlink to see the plugins

In order lazy.vim to work, I've created symlink

```bash
mkdir ~/.config/nvim/lua
cd ~/.config/nvim/lua/
ln -s ~/my-configs/neovim/plugins plugins
```

## To use telescope image you have to install `ueberzug`

```bash
pip install ueberzug
```

## Top lua/nvim plugins

Can be found here: https://github.com/rockerBOO/awesome-neovim

## To use the cheatsheet.txt file run the following command:

```bash
cp  ~/my-configs/neovim/cheatsheet/cheatsheet.txt  ~/.config/neovim/cheatsheet/cheatsheet.txt
```
