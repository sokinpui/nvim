local function append_at_EOL()
    -- Move the cursor to the end of the line
    vim.cmd("normal! g$")

    -- Get the character at the cursor position
    local char = vim.fn.getline("."):sub(vim.fn.col(".") - 1, vim.fn.col(".") - 1)

    if char == "\t" or char == " " then
        -- Move the cursor one character to the left
        vim.cmd("normal! gel")
        -- Start insert mode
        vim.cmd("startinsert")
    else
        -- Start insert mode at the current cursor position
        vim.cmd("startinsert!")
    end
end

