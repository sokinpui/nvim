source ~/.config/nvim/vimL/setting.vim
source ~/.config/nvim/vimL/appearance.vim
source ~/.config/nvim/vimL/format.vim
source ~/.config/nvim/vimL/mapping.vim

if has('nvim')
    lua require("lazy-init")
else
    source ~/.config/nvim/vimL/plugins.vim
endif

"if exists("g:neovide")
"    lua require("neovide")
"endif
