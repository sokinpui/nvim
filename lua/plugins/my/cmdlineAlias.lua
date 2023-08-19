local M = {}

function _G.abbreviate_or_noop(input, output)
  local cmdtype = vim.fn.getcmdtype()
  local cmdline = vim.fn.getcmdline()

  if (cmdtype == ":" and cmdline == input) then 
    return output
  else
    return input
  end
end

M.SetupCommandAlias = function(input, output)
    vim.cmd([[
    let b:buf_keywords = &iskeyword
    setlocal iskeyword=
    ]])
    vim.api.nvim_command("cabbrev <expr> " .. input .. " " .. "v:lua.abbreviate_or_noop('" .. input .. "', '" .. output .. "')")
    vim.opt_local.iskeyword:append(vim.b.buf_keywords)
end

return M
