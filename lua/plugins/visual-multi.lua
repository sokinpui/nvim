return {
  {
    "mg979/vim-visual-multi",
    keys = {
      {"<C-n>"},
      {"<C-n>",mode = "v"},
      {"<C-down>"},
      {"<C-up>"},
      {"<C-S-j>"},
      {"<C-S-k>"},
      {"u"},
      {"<C-r>"},
    },
    branch = "master",
    init = function()
      vim.g.VM_maps = {
        ['Find Under'] = '<C-n>',
        ['Find Subword Under'] = '<C-n>',
        ['Add Cursor Up'] = '<C-S-k>',
        ['Add Cursor Down'] = '<C-S-j>',
        --['Add Cursor Up'] = '<C-up>',
        --['Add Cursor Down'] = '<C-down>',
        ["Undo"] = 'u',
        ["Redo"] = '<C-r>',
      }
      vim.g.VM_quit_after_leaving_insert_mode = 1
      vim.g.VM_highlight_matches = 'red'
      vim.g.VM_highlight_matches = 'hi! Search ctermfg=228 cterm=underline'
      vim.g.VM_custom_remaps = { s = 'c' }
    end,
  },
  {
    'kevinhwang91/nvim-hlslens',
    keys = {
      "n",
      "N",
      "*",
      "#",
      "g*",
      "g#",
    },
    config = function ()
      require('hlslens').setup()

      local kopts = {noremap = true, silent = true}

      vim.keymap.set('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR>zzzv<Cmd>lua require('hlslens').start()<CR>]],
      kopts)
      vim.keymap.set('n', 'N',
      [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR>zzzv<Cmd>lua require('hlslens').start()<CR>]],
      kopts)
      vim.keymap.set('n', '*', [[*zzzv<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.keymap.set('n', '#', [[#zzzv<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.keymap.set('n', 'g*', [[g*zzzv<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.keymap.set('n', 'g#', [[g#zzzv<Cmd>lua require('hlslens').start()<CR>]], kopts)

      -- vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)
    end
  }
}
