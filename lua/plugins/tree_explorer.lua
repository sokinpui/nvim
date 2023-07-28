return {
    {
        'lambdalisue/fern.vim',
        config = function()
            vim.g.fern#mark_symbol                       = '●'
            vim.g.fern#renderer#default#collapsed_symbol = '▷ '
            vim.g.fern#renderer#default#expanded_symbol  = '▼ '
            vim.g.fern#renderer#default#leading          = ' '
            vim.g.fern#renderer#default#leaf_symbol      = ' '
            vim.g.fern#renderer#default#root_symbol      = '~ '
            vim.g.fern#disable_default_mappings   = 1
            vim.g.fern#disable_drawer_auto_quit   = 0
            vim.g.fern#disable_viewer_hide_cursor = 1
            vim.cmd([[
            inoremap <C-e>   <ESC>:Fern . -drawer -reveal=% -width=35 -toggle<CR><C-w>=
            nnoremap <C-e>   :Fern . -drawer -reveal=% -width=35 -toggle<CR><C-w>=
            ]])
        end,
    },
    'lambdalisue/fern-hijack.vim',
    'lambdalisue/fern-mapping-project-top.vim', 
    'sokinpui/my-fern-preview.vim', 
}

-- TODO move the configuration from pack to here
