return {
    {
        "rhysd/clever-f.vim",
        keys = { "f", "F", "t", "T" },
        config = function()
            vim.cmd([[
            let g:clever_f_smart_case              = 1
            let g:clever_f_across_no_line          = 0
            let g:clever_f_chars_match_any_signs   = "\<TAB>"
            let g:clever_f_repeat_last_char_inputs = [ "\<CR>" ]
            ]])
        end,
    },
}
