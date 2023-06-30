
vim.api.nvim_set_var("mapleader", " ")

vim.api.nvim_set_keymap("n", "j", "gj", { noremap = false })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = false })
vim.api.nvim_set_keymap("n", "$", "g$", { noremap = false })
vim.api.nvim_set_keymap("n", "0", "g0", { noremap = false })

-- Highlight search
vim.api.nvim_set_keymap("v", "/", [["9y/<C-r>9<cr>]], { noremap = true })
vim.api.nvim_set_keymap("x", "/", [["9y/<C-r>9<cr>]], { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>n", "/\\d\\+<cr>zz", { noremap = true })

-- Copy and paste
vim.api.nvim_set_keymap("n", "<leader>Y", [["+yy]], { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>X", [["+dd]], { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>Y", [["+y]], { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>X", [["+x]], { noremap = true })
vim.api.nvim_set_keymap("v", "<C-c>", [["+y]], { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>P", [["+p]], { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>P", [["+p]], { noremap = true })
vim.api.nvim_set_keymap("i", "<C-v>", "<esc>\"+pa", { noremap = true })
-- vim.api.nvim_set_keymap("n", "gy", ":1,$y +<cr>", { noremap = true })
vim.api.nvim_set_keymap("x", "<leader>p", "\"_dP", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>v", "g^vg$", { noremap = true })

-- Motion
vim.api.nvim_set_keymap("n", "(", ")", { noremap = true })
vim.api.nvim_set_keymap("n", ")", "(", { noremap = true })
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true })
