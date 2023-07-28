source ~/.config/nvim/vimL/plugins.vim

if has('nvim')
    lua require("config.nvim-treesitter")
endif
