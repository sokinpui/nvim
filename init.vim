if !has('nvim')
    source ~/.config/nvim/vimL/plugins.vim
endif

if has('nvim')
    lua require("lazy-init")
endif
