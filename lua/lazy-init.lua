--lazy.nvim
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
vim.g.maplocalleader = "="

require("lazy").setup({
  require("plugins.nerdfont"),
  require("plugins.appearance"),
  require("plugins.treesitter"),
  require("plugins.cleverf"),
  require("plugins.harpoon"),
  require("plugins.comments"),
  require("plugins.lsp"),
  require("plugins.sandwich"),
  require("plugins.visual-multi"),
  require("plugins.auto-pairs"),
  require("plugins.nvim-cmp"),
  require("plugins.fzf"),
  require("plugins.markdown"),
  require("plugins.oil"),
  require("plugins.undo"),
  require("plugins.orgmode"),
  { "dstein64/vim-startuptime", cmd = "StartupTime", },
  { "kmonad/kmonad-vim", ft = "kbd"},
  { 'alohaia/fcitx.nvim', config = function () require 'fcitx' { } end },

  --require("plugins.fern"),
  --require("plugins.flit"),
  --require("plugins.neorg"),
  --require("plugins.which-key"),
  --require("plugins.telescope"),
  --'wellle/targets.vim',
}, {})


