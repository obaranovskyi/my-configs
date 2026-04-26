# Repository Purpose

Personal developer environment configuration ("dotfiles") repo. Clone into `~/my-configs/`. Each tool's config is sourced or symlinked from its standard location — nothing is copied in place.

Each tool sources from this repo rather than owning its config directly:

```bash
# ~/.config/nvim/init.lua
package.path = "/Users/obaranovskyi/my-configs/nvim/?.lua;" .. package.path
require "init"

# ~/.tmux.conf
source ~/my-configs/tmux/tmux.conf

# ~/.zshrc
source /Users/obaranovskyi/my-configs/zsh/.zshrc
```

Ranger is an exception — its config is copied: `cat ~/my-configs/ranger/rc.conf > ~/.config/ranger/rc.conf`
