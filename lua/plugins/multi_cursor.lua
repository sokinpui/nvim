local M = {}

M.config = {
    {
        "mg979/vim-visual-multi",
        branch = "master",
        config = function()
            vim.g.VM_quit_after_leaving_insert_mode = 1
            vim.g.VM_highlight_matches = 'red'
            vim.g.VM_highlight_matches = 'hi! Search ctermfg=228 cterm=underline'
            vim.g.VM_custom_remaps = { s = 'c' }
        end
    },
}

vim.cmd([[
let g:VM_maps = {}
let g:VM_maps['Find Under']                  = '<space>n'
let g:VM_maps['Find Subword Under']          = '<space>n'
let g:VM_maps["Add Cursor Down"]             = '<C-j>'
let g:VM_maps["Add Cursor Up"]               = '<C-k>'
]])

return M
