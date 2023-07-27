-- myplugin/init.lua

local pair_object = { "{", "[", "<", '"', "'" }

function _G.search_line_for_pair_object()
    local cursor_line = vim.fn.line('.')
    local cursor_col = vim.fn.col('.')
    local current_line = vim.fn.getline(cursor_line)

    -- Check current line from the cursor position onward
    local line_after_cursor = current_line:sub(cursor_col)

    for _, obj in ipairs(pair_object) do
        local start_pos = line_after_cursor:find(obj)
        if start_pos then
            local match_col = cursor_col + start_pos - 1
            print("Found: " .. obj .. " at line " .. cursor_line .. ", column " .. match_col)
            return
        end
    end

    -- Check subsequent lines
    for line = cursor_line + 1, vim.fn.line('$') do
        local line_content = vim.fn.getline(line)
        for _, obj in ipairs(pair_object) do
            local start_pos = line_content:find(obj)
            if start_pos then
                print("Found: " .. obj .. " at line " .. line .. ", column " .. start_pos)
                return
            end
        end
    end

    print("No pair object found after the cursor.")
end

