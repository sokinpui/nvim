# Merge to new machine

## Remove the Old nvim runtime and Install
```sh
[ -f $HOME/.config/nvim ] && mv $HOME/.config/nvim-old
git clone https://github.com/sokinpui/init.lua.git $HOME/.config/nvim
```
## Dependencies
* ripgrep
* fd

