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
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
    require("plugins.colorscheme"),
    require("plugins.treesitter"),
    require("plugins.tree_explorer"),
    require("plugins.markdown"),
    require("plugins.sandwich"),
    require("plugins.cleverf"),
    require("plugins.multi_cursor"),
    require("plugins.pairs"),
    require("plugins.fzf"),
    require("plugins.autocompletion"),
    require("plugins.lsp"),
})
