return {
    {
        'lambdalisue/fern.vim',
        dependencies = {
            {
                'lambdalisue/fern-hijack.vim',
            },
            {
                "lambdalisue/fern-mapping-project-top.vim",
            },
            {
                "sokinpui/my-fern-preview.vim",    
            },
        },
        config = function()
            -- Set the Fern plugin configuration options in Lua
            vim.g["fern#mark_symbol"] = '●'
            vim.g["fern#renderer#default#collapsed_symbol"] = '▷ '
            vim.g["fern#renderer#default#expanded_symbol"] = '▼ '
            vim.g["fern#renderer#default#leading"] = ' '
            vim.g["fern#renderer#default#leaf_symbol"] = ' '
            vim.g["fern#renderer#default#root_symbol"] = '~ '
            vim.g["fern#disable_default_mappings"] = 1
            vim.g["fern#disable_drawer_auto_quit"] = 0
            vim.g["fern#disable_viewer_hide_cursor"] = 1

            -- Define the key mappings
            --vim.api.nvim_set_keymap('i', '<C-e>', '<Esc><Cmd>Fern . -drawer -reveal=% -width=35 -toggle<CR><C-w>=', { noremap = true, silent = true })
            --vim.api.nvim_set_keymap('n', '<C-e>', '<Cmd>Fern . -drawer -reveal=% -width=35 -toggle<CR><C-w>=', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('i', '<C-e>', '<Esc><Cmd>Fern .<cr>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<C-e>', '<Cmd>Fern .<cr>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>t', '<Cmd>Fern .<cr>', { noremap = true, silent = true })
        end,
    },
}
