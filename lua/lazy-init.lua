---lazy.nvim
---install plugin if missed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

require("lazy").setup({
    require("plugins.nerdfont"),
    require("plugins.appearance"),
    require("plugins.treesitter"),
    require("plugins.cleverf"),
    require("plugins.lsp"),
    require("plugins.sandwich").config,
    require("plugins.multi_cursor").config,
    require("plugins.pairs"),
    require("plugins.autocompletion").config,
    require("plugins.fzf"),
    require("plugins.markdown"),
    require("plugins.fern"),
    { 
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
    },
},{})
