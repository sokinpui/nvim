return {
    {
        "mg979/vim-visual-multi",
        branch = "master",
        config = function()
            vim.g.VM_quit_after_leaving_insert_mode = 1
            vim.g.VM_highlight_matches = 'red'
            vim.g.VM_highlight_matches = 'hi! Search ctermfg=228 cterm=underline'

            vim.cmd([[
            let g:VM_leader = '<space>'
            let g:VM_maps = {}
            let g:VM_maps['Find Under']         = '<leader>n'  
            let g:VM_maps['Find Subword Under']         = '<leader>n'  
            let g:VM_custom_remaps = { 's': 'c' }
            ]])
        end
    },
}
