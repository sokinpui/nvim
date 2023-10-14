return {
  {
    "mg979/vim-visual-multi",
    keys = {
      {"<C-n>"},
      {"<C-n>",mode = "v"},
      {"<C-down>"},
      {"<C-up>"},
      {"u"},
      {"<C-r>"},
    },
    branch = "master",
    init = function()
      vim.g.VM_maps = {
        ['Find Under'] = '<C-n>',
        ['Find Subword Under'] = '<C-n>',
        ['Add Cursor Down'] = '<C-down>',
        ['Add Cursor Up'] = '<C-up>',
        ["Undo"] = 'u',
        ["Redo"] = '<C-r>',
      }
      vim.g.VM_quit_after_leaving_insert_mode = 1
      vim.g.VM_highlight_matches = 'red'
      vim.g.VM_highlight_matches = 'hi! Search ctermfg=228 cterm=underline'
      vim.g.VM_custom_remaps = { s = 'c' }
    end,
  },
}
