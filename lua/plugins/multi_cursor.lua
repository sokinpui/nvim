return {
    { 
        "mg979/vim-visual-multi",
        keys = {
            {"<leader>n"},
            {"<leader>n",mode = "v"},
            {"<c-j>"},
            {"<c-k>"},
        },
        branch = "master",
        init = function()
            vim.g.VM_maps = {
                ['Find Under'] = '<space>n',
                ['Find Subword Under'] = '<space>n',
                ['Add Cursor Down'] = '<C-j>',
                ['Add Cursor Up'] = '<C-k>',
            }
            vim.g.VM_quit_after_leaving_insert_mode = 1
            vim.g.VM_highlight_matches = 'red'
            vim.g.VM_highlight_matches = 'hi! Search ctermfg=228 cterm=underline'
            vim.g.VM_custom_remaps = { s = 'c' }
        end,
    },
}
