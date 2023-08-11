return {
    {
        "rhysd/clever-f.vim",
        keys = { "f", "F", "t", "T" },
        init = function()
            vim.g.clever_f_smart_case = 1
            vim.g.clever_f_across_no_line = 0
            vim.g.clever_f_chars_match_any_signs = '\t'
            vim.g.clever_f_repeat_last_char_inputs = { '\r' }
            vim.g.clever_f_fix_key_direction = 1
        end,
        config = function()
            vim.api.nvim_set_keymap('', ';', '<Plug>(clever-f-repeat-forward)', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('', ',', '<Plug>(clever-f-repeat-back)', { noremap = true, silent = true })
        end
    },
}
