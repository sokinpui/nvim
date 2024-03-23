return {
  {
    "mg979/vim-visual-multi",
    keys = {
      {"<C-n>"},
      {"<space><C-n>"},
      {"<C-n>",mode = "v"},
      {"<down>"},
      {"<up>"},
      {"u"},
      {"<C-r>"},
    },
    branch = "master",
    init = function()
      vim.g.VM_maps = {
        ['Find Under'] = '<C-n>',
        ['Find Subword Under'] = '<C-n>',
        ['Add Cursor Up'] = '<up>',
        ['Add Cursor Down'] = '<down>',
        ["Undo"] = 'u',
        ["Redo"] = '<C-r>',
        -- ["Find Operator"] = 'm',
        -- ["Run Last Visual"] = '<space><C-n>',
        -- ["Surround"] = 'gs',
      }
      vim.g.VM_quit_after_leaving_insert_mode = 1
      vim.g.VM_highlight_matches = 'red'
      vim.g.VM_highlight_matches = 'hi! Search ctermfg=228 cterm=underline'
      vim.g.VM_custom_remaps = { s = 'c' }
    end,
  },

  {
    'kevinhwang91/nvim-hlslens',
    config = function ()
      require('hlslens').setup({
        override_lens = function(render, posList, nearest, idx, relIdx)
          local sfw = vim.v.searchforward == 1
          local indicator, text, chunks
          local absRelIdx = math.abs(relIdx)
          if absRelIdx > 1 then
            indicator = ('%d%s'):format(absRelIdx, sfw ~= (relIdx > 1) and '▲' or '▼')
          elseif absRelIdx == 1 then
            indicator = sfw ~= (relIdx == 1) and '▲' or '▼'
          else
            indicator = ''
          end

          local lnum, col = unpack(posList[idx])
          if nearest then
            local cnt = #posList
            if indicator ~= '' then
              text = ('%s'):format('', idx, cnt)
            else
              text = ('[%d/%d]'):format(idx, cnt)
            end
            chunks = {{' ', 'Ignore'}, {text, 'HlSearchLensNear'}}
          -- else
          --   text = ('[%s]'):format(indicator, idx)
          --   chunks = {{' ', 'Ignore'}, {text, 'HlSearchLens'}}
          end
          render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
        end
      })

      local kopts = {noremap = true, silent = true}

      vim.keymap.set('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR>zv<Cmd>lua require('hlslens').start()<CR>]],
      kopts)
      vim.keymap.set('n', 'N',
      [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR>zv<Cmd>lua require('hlslens').start()<CR>]],
      kopts)
      vim.keymap.set('n', '*', [[*zv<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.keymap.set('n', '#', [[#zv<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.keymap.set('n', 'g*', [[g*zv<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.keymap.set('n', 'g#', [[g#zv<Cmd>lua require('hlslens').start()<CR>]], kopts)

      -- vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)
    end
  }

}
