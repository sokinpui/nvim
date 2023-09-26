vim.loader.enable()
vim.cmd[[
source ~/.config/nvim/vimL/setting.vim 
source ~/.config/nvim/vimL/appearance.vim 
source ~/.config/nvim/vimL/format.vim 
source ~/.config/nvim/vimL/mapping.vim
]]

require("lazy-init")
