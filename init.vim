source ~/.config/nvim/vimL/setting.vim
source ~/.config/nvim/vimL/appearance.vim
source ~/.config/nvim/vimL/format.vim
source ~/.config/nvim/vimL/mapping.vim

if !has('nvim')
    source ~/.config/nvim/vimL/plugins.vim
endif

if has('nvim')
    lua require("plugins")
endif
