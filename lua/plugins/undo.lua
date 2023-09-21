return {
  --{
  --  'simnalamburt/vim-mundo',
  --  cmd = "MundoToggle",
  --  init = function()
  --    vim.api.nvim_set_keymap('n', '<leader>U', '<Cmd>MundoToggle<cr>', { noremap = true, silent = true })
  --  end
  --},
  {
    'mbbill/undotree',
    cmd = "UndotreeToggle",
    init = function()
      vim.keymap.set('n', '<leader>u', '<Cmd>UndotreeToggle<cr>', { noremap = true, silent = true })
    end,
    config = function()
      vim.g.undotree_SetFocusWhenToggle = 1
      vim.g.undotree_HelpLine = 0
      vim.g.undotree_ShortIndicators = 1
    end
  }
}
