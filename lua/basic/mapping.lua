vim.g.mapleader = " "
vim.keymap.set("i", "<C-k>", "<Esc>k")

-- delete whole word via Ctrl+backspace
vim.keymap.set("i", "<C-H>", "<C-w>")
vim.keymap.set("c", "<C-H>", "<C-w>")
vim.keymap.set("t", "<C-H>", "<C-w>")

-- copy and paste
if vim.fn.has("linux") then
  vim.keymap.set("n", "<leader>y", "\"+y")
  vim.keymap.set("n", "<leader>d", "\"+d")
  vim.keymap.set("n", "<leader>Y", "\"+Y")
  vim.keymap.set("v", "Y", "\"+ygv<esc>")
  vim.keymap.set("v", "X", "\"+xgv<esc>")
  vim.keymap.set("v", "<C-c>", "\"+ygv<esc>")
  vim.keymap.set("n", "<leader>P", "\"+p']")
  vim.keymap.set("v", "<leader>P", "\"+p']")
  vim.keymap.set("i", "<C-v>", "<C-r><C-o>+")
  vim.keymap.set("c", "<C-v>", "<C-r><C-o>+")
  vim.keymap.set("n", "gY <Cmd>1,$y", "\"+<cr>")
else
  vim.keymap.set("n", "<leader>y", "\"*y")
  vim.keymap.set("n", "<leader>d", "\"*d")
  vim.keymap.set("n", "<leader>Y", "\"*Y")
  vim.keymap.set("v", "Y", "\"*ygv<esc>")
  vim.keymap.set("v", "X", "\"*xgv<esc>")
  vim.keymap.set("v", "<C-c>", "\"*ygv<esc>")
  vim.keymap.set("n", "<leader>P", "\"*p']")
  vim.keymap.set("v", "<leader>P", "\"*p']")
  vim.keymap.set("i", "<C-v>", "<C-r><C-o>*")
  vim.keymap.set("c", "<C-v>", "<C-r><C-o>*")
  vim.keymap.set("n", "gY <Cmd>1,$y", "\"*<cr>")
end

vim.keymap.set("x", "<leader>p", "\"_dP")

-- select the last pasted text
vim.keymap.set("n", "gp", "\'[v']")

-- increment and decrement of characters
--set nrformats+=alpha

--   Motion
-- Vertical
vim.keymap.set({"n", "i", "v", "o"}, "(", ")")
vim.keymap.set({"n", "i", "v", "o"}, ")", "(")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz ")

--noremap <leader>K K

-- search
--vim.keymap.set("n", "<expr> n (v:searchforward ? 'nzzzv' :", "'Nzzzv')")
--vim.keymap.set("n", "<expr> N (v:searchforward ? 'Nzzzv' :", "'nzzzv')")

vim.keymap.set("n", "n <Cmd>set", "hlsearch<Cr>nzzzv")
vim.keymap.set("n", "N <Cmd>set", "hlsearch<Cr>Nzzzv")
vim.keymap.set("n", "* <Cmd>set", "hlsearch<Cr>*zzzv")
vim.keymap.set("n", "# <Cmd>set", "hlsearch<Cr>#zzzv")
vim.keymap.set("v", "* y<Cmd>set hlsearch<Cr>/<c-r>0<cr>zzzv", " ")
vim.keymap.set("v", "# y<Cmd>set hlsearch<Cr>?<c-r>0<cr>zzzv", " ")

-- indention formation
vim.keymap.set("n", "=<leader>", "gg=G''zz")

-- formating code
vim.keymap.set("n", "<leader>gq", "gggqG<C-o>zz")

-- should be leverge the built in . repeat
--vim.keymap.set("v", "<", "<gv")
--vim.keymap.set("v", ">", ">gv")

-- shortcut
--vim.keymap.set("n", "<C-q>", "<C-w>q")
--vim.keymap.set("n", "<C-f>", "<C-w>w")

vim.keymap.set("n", "=d", "<Cmd>bd<cr>")
vim.keymap.set("n", "=q", "<C-w>q")
vim.keymap.set("n", "=h", "<C-w>h")
vim.keymap.set("n", "=j", "<C-w>j")
vim.keymap.set("n", "=k", "<C-w>k")
vim.keymap.set("n", "=l", "<C-w>l")

-- update current file
--vim.keymap.set("n", "<leader>e :edit!", "%<cr>")

-- buffer switch
vim.keymap.set("n", "<Bs>", "<Cmd>bn<cr>")
vim.keymap.set("n", "<C-H>", "<Cmd>bp<cr>")
-- This is same as C-^, the alternative file
--vim.keymap.set("n", "<leader><bs>", "<Cmd>b#<cr> ")
vim.keymap.set("n", "=<Bs>", "<Cmd>ls<cr>")

--   Command alias
vim.cmd([[
cnoreabbrev <expr> W getcmdtype() == ':' && getcmdline() =~# '^W' ? 'w' : 'W'
cnoreabbrev <expr> WQ getcmdtype() == ':' && getcmdline() =~# '^WQ' ? 'wqa' : 'WQ'
cnoreabbrev <expr> Wq getcmdtype() == ':' && getcmdline() =~# '^Wq' ? 'wqa' : 'Wq'
cnoreabbrev <expr> wQ getcmdtype() == ':' && getcmdline() =~# '^wQ' ? 'wqa' : 'wQ'
cnoreabbrev <expr> wq getcmdtype() == ':' && getcmdline() =~# '^wq' ? 'wqa' : 'wq'
cnoreabbrev <expr> Q getcmdtype() == ':' && getcmdline() =~# '^Q' ? 'q' : 'Q'
]])

