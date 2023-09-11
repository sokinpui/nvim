local npairs = require'nvim-autopairs'
local Rule   = require'nvim-autopairs.rule'
local cond = require'nvim-autopairs.conds'


npairs.get_rules("'")[1].not_filetypes = { "scheme", "lisp" }
npairs.get_rules("'")[1]:with_pair(cond.not_after_text("["))

-- Add spaces between parentheses
npairs.add_rules {
    Rule('=', '', {"-zsh","-sh","-vim","-markdown"})
    :with_pair(cond.not_inside_quote())
    :with_pair(function(opts)
        local last_char = opts.line:sub(opts.col - 1, opts.col - 1)
        if last_char:match('[%w%=%s]') then
            return true
        end
        return false
    end)
    :replace_endpair(function(opts)
        local prev_2char = opts.line:sub(opts.col - 2, opts.col - 1)
        local next_char = opts.line:sub(opts.col, opts.col)
        next_char = next_char == ' ' and '' or ' '
        if prev_2char:match('%w$') then
            return '<bs> =' .. next_char
        end
        if prev_2char:match('%=$') then
            return next_char
        end
        if prev_2char:match('=') then
            return '<bs><bs>=' .. next_char
        end
        return ''
    end)
    :set_end_pair_length(0)
    :with_move(cond.none())
    :with_del(cond.none())
}

-- math block in markdown
npairs.add_rules({
    Rule("$", "$", "markdown")
    :with_move(cond.done()),
})


-- disable in escaped chararcter
for _, char in ipairs {
  "'",
  '"',
  '`',
} do
for _, r in ipairs(npairs.get_rule(char)) do
  r:with_move(cond.not_before_text('\\'))
  :with_del(function(opts)
    local prev_col = vim.api.nvim_win_get_cursor(0)[2] - 1
    return opts.line:sub(prev_col, prev_col) ~= '\\'
  end)
end
end
