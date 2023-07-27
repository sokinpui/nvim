local M = {}
local h = function(lua_object)
    return vim.inspect(lua_object)
end

local buf = vim.api.nvim_get_current_buf()
local win = vim.api.nvim_get_current_win()

local pair_object = {
    ['"'] = '"',
    ["'"] = "'",
    ["`"] = "`",
    ["<"] = ">",
    ["("] = ")",
    ["{"] = "}",
    ["["] = "]",
}

local function find_pair_left()
    local cursor_line = vim.fn.line('.')
    local cursor_col = vim.fn.col('.')
    local first_turn = true

    for line = cursor_line, vim.fn.line('$') do
        local current_line = vim.fn.getline(line)
        --if first_turn then
        --    current_line = current_line:sub(cursor_col)
        --    first_turn = nil
        --else
        --    cursor_col = 1
        --end
        --    current_line = current_line:sub(0)

        for left, right in pairs(pair_object) do

            local start_pos = current_line:find(left, 1, true)

            if start_pos then
                --local match_left_col = cursor_col + start_pos - 1
                local match_left_col = start_pos
                --print("Found: " .. left .. " at line " .. line .. ", column " .. match_left_col)
                return line, match_left_col, left
            end
        end
    end
end

local function find_pair_right(start_line, start_col, key)
    local cursor_col = start_col + 1
    local first_turn = true

    for line = start_line, vim.fn.line('$') do
        local current_line = vim.fn.getline(line)
        if first_turn then
            current_line = current_line:sub(cursor_col)
            first_turn = nil
        else
            current_line = current_line:sub(0)
            cursor_col = 1
        end

        local end_pos = current_line:find(pair_object[key], 1, true)

        if end_pos then
            local match_right_col = cursor_col + end_pos - 1
            --print("Found: " .. pair_object[key] .. " at line " .. line .. ", column " .. match_right_col)
            return line, match_right_col, key
        end
    end
end

local function get_pair_index()
    local start_line, start_col, key = find_pair_left()
    local end_line, end_col, key = find_pair_right(start_line, start_col, key)
    return start_line, start_col, end_line, end_col 
end



local function inner()
    local start_line, start_col, end_line, end_col = get_pair_index()
    if start_line == nil or start_col == nil or end_line == nil or end_col == nil then
        return
    else
        --vim index is different
        local start_line = start_line - 1
        local end_line = end_line - 1
        local end_col = end_col - 1
        return start_line, start_col, end_line, end_col
    end
end

local function outer()
    local start_line, start_col, end_line, end_col = inner()
    if start_line == nil or start_col == nil or end_line == nil or end_col == nil then
        return
    else
        start_col = start_col - 1
        end_col = end_col + 1
        return start_line, start_col, end_line, end_col
    end
end
    

M.delete_inner = function()
    local start_line, start_col, end_line, end_col = inner()
    if start_line == nil or start_col == nil or end_line == nil or end_col == nil then
        print("No pair found")
        return
    else
        vim.api.nvim_buf_set_text(buf, start_line, start_col, end_line, end_col, {})
        vim.api.nvim_win_set_cursor(win, {start_line + 1, start_col - 1})
        return start_line, start_col, end_line, end_col
    end
end

M.delete_outer = function()
    local start_line, start_col, end_line, end_col = outer()
    if start_line == nil or start_col == nil or end_line == nil or end_col == nil then
        print("No pair found")
        return
    else
        vim.api.nvim_buf_set_text(buf, start_line, start_col, end_line, end_col, {})
        vim.api.nvim_win_set_cursor(win, {start_line + 1, start_col - 1})
        return start_line, start_col, end_line, end_col
    end
end

M.change_inner = function()
    local start_line, start_col, end_line, end_col = inner()
    if start_line == nil or start_col == nil or end_line == nil or end_col == nil then
        print("No pair found")
        return
    else
        vim.api.nvim_buf_set_text(buf, start_line, start_col, end_line, end_col, {})
        vim.api.nvim_win_set_cursor(win, {start_line + 1, start_col})
        vim.cmd('startinsert')
        return start_line, start_col, end_line, end_col
    end
end

M.change_outer = function()
    local start_line, start_col, end_line, end_col = outer()
    if start_line == nil or start_col == nil or end_line == nil or end_col then
        print("No pair found")
        return
    else
        vim.api.nvim_buf_set_text(buf, start_line, start_col, end_line, end_col, {})
        vim.api.nvim_win_set_cursor(win, {start_line + 1, start_col})
        vim.cmd('startinsert')
        return start_line, start_col, end_line, end_col
    end
end

return M
