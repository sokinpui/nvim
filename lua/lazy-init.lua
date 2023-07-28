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
    require("plugins/cleverf"),
    require("plugins/lsp"),
    require("plugins/markdown"),
    require("plugins/multi_cursor"),
    require("plugins/nerdfont"),
    require("plugins/sandwich"),
    require("plugins/treesitter"),
    require("plugins/fzf"),
    require("plugins/fern").config,
    require("plugins/autocompletion").config,
    require("plugins/colorscheme"),
    require("plugins/pairs"),
},{})
