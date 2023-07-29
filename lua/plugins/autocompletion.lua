local M = {}

M.config = {
    {
        'SirVer/ultisnips',
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-buffer',
            'FelipeLema/cmp-async-path',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-calc',
            'onsails/lspkind-nvim',
            {
                "quangnguyen30192/cmp-nvim-ultisnips",
                config = function()
                    -- optional call to setup (see customization section)
                    require("cmp_nvim_ultisnips").setup{}
                end,
            },
        },
        after = "SirVer/ultisnips",
        config = function()
            local t = function(str)
                return vim.api.nvim_replace_termcodes(str, true, true, true)
            end

            local has_words_before = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local cmp = require 'cmp'
            --local lspkind = require('lspkind')

            cmp.setup {
                snippet = {
                    expand = function(args)
                        vim.fn["UltiSnips#Anon"](args.body)
                    end,
                },
                sources = {
                    { name = "ultisnips" },
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    --{ name = 'cmdline' },
                    { name = 'async_path' },
                    { name = 'calc' },
                },
                mapping = cmp.mapping.preset.insert({
                    ['<c-e>'] = cmp.mapping({
                        i = function(fallback)
                            cmp.close()
                            fallback()
                        end
                    }),
                    ["<Tab>"] = cmp.mapping({
                        i = function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                            elseif has_words_before() then
                                cmp.complete()
                            else
                                fallback()
                            end
                        end,
                    }),
                    ["<S-Tab>"] = cmp.mapping({
                        i = function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                            else
                                fallback()
                            end
                        end,
                    }),
                    ['<C-n>'] = cmp.mapping({
                        c = function()
                            if cmp.visible() then
                                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                            else
                                vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
                            end
                        end,
                        i = function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                            else
                                fallback()
                            end
                        end
                    }),
                    ['<C-p>'] = cmp.mapping({
                        c = function()
                            if cmp.visible() then
                                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                            else
                                vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
                            end
                        end,
                        i = function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                            else
                                fallback()
                            end
                        end
                    }),
                }),
            }
            cmp.setup.cmdline(':', {
                completion = { autocomplete = false },
                sources = cmp.config.sources({
                    { name = 'async_path' }
                }, {
                    { name = 'cmdline' }
                })
            })
        end
    },
}

vim.cmd([[
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
]])

return M
