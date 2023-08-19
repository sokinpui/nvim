return {
  {
    'simnalamburt/vim-mundo',
    cmd = "MundoToggle",
    init = function()
      vim.api.nvim_set_keymap('n', '<leader>u', '<Cmd>MundoToggle<cr>', { noremap = true, silent = true })
    end
  },
}
