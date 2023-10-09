# Merge to new machine

## Remove the Old nvim runtime
```sh
[ -f $HOME/.config/nvim ] && mv $HOME/.config/nvim-old
```

## Use this Repo
```sh
git clone https://github.com/sokinpui/init.lua.git $HOME/.config/nvim
```
