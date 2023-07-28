return {
    {
        "rhysd/clever-f.vim",
        key = { "f", "F", "t", "T" },
        config = function()
            vim.g.clever_f_smart_case              = 1
            vim.g.clever_f_across_no_line          = 0
            vim.g.clever_f_chars_match_any_signs   = "\<TAB>"
            vim.g.clever_f_repeat_last_char_inputs = [ "\<CR>" ]
        end,
    },
}
