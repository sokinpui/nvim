return {
    {
        'lambdalisue/fern.vim',
        config = function()
            vim.cmd([[
            let g:fern#mark_symbol                       = '●'
            let g:fern#renderer#default#collapsed_symbol = '▷ '
            let g:fern#renderer#default#expanded_symbol  = '▼ '
            let g:fern#renderer#default#leading          = ' '
            let g:fern#renderer#default#leaf_symbol      = ' '
            let g:fern#renderer#default#root_symbol      = '~ '
            let g:fern#disable_default_mappings   = 1
            let g:fern#disable_drawer_auto_quit   = 0
            let g:fern#disable_viewer_hide_cursor = 1
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
