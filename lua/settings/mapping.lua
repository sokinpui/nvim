local map = function(mode, rhs, lhs)
    vim.api.nvim_set_keymap(mode, rhs, lhs, { noremap = true, silent = true })
end

-- delete whole word
map("i", "<C-H>", "<C-w>")
--map("c", "<C-H>", "<C-w>")
vim.cmd("cnoremap <C-H> <c-w>")
map("t", "<C-H>", "<C-w>")

--copy and paste
if vim.fn.has("linux") ==  1 then
    map("n", "<leader>y", "\"+y")
    map("v", "<leader>y", "\"+y")
    map("n", "<leader>Y", "\"+Y")
    map("v", "Y", "\"+y")
    map("v", "X", "\"+x")
    map("v", "<C-c>", "\"+y")
    map("n", "<leader>P", "\"+p")
    map("v", "<leader>P", "\"+p")
    map("i", "<C-v>", "<C-r><C-o>+")
    map("c", "<C-v>", "<C-r><C-o>+")
    map("n", "gy", "<Cmd>1,$y +<cr>")
elseif vim.fn.has("mac") == 1  then
    map("n", "<leader>y", "\"*y")
    map("v", "<leader>y", "\"+y")
    map("n", "<leader>Y", "\"*Y")
    map("v", "Y", "\"*y")
    map("v", "X", "\"*x")
    map("v", "<C-c>", "\"*y")
    map("n", "<leader>P", "\"*p")
    map("v", "<leader>P", "\"*p")
    map("i", "<C-v>", "<C-r><C-o>*")
    map("c", "<C-v>", "<C-r><C-o>*")
    map("n", "gy", "<Cmd>1,$y *<cr>")
end

-- paste without update register
map("x", "<leader>p", "\"_dP")

--motion
---vertical
map("n", "(", ")")
map("n", ")", "(")
map("n", "<c-d>", "<c-d>zz")
map("n", "<c-u>", "<c-u>zz") 

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "J", "5j")
map("n", "K", "5k")

---horizontial
map("n", "H", "^")
map("n", "L", "$")

---pair
map("n", "<leader>m", "%")

-- help
map("n", "<leader>K", "K")

--search
map("n", "*", "*zzzv")
map("n", "#", "#zzzv")
map("v", "*", "y/<c-r>0<cr>zzzv")  
map("v", "#", "y?<c-r>0<cr>zzzv")  

function search_direction()
    return vim.v.searchforward == 1
end
vim.api.nvim_set_keymap('n', 'n', 'v:lua.search_direction() ? "nzzzv" : "Nzzzv"', { expr = true, noremap = true })
vim.api.nvim_set_keymap('n', 'N', 'v:lua.search_direction() ? "Nzzzv" : "nzzzv"', { expr = true, noremap = true })

--Indention
map("v", "<", "<gv")
map("v", ">", ">gv")

--Indent whole file
map("n", "=<leader>", "gg=G''") 

map("n", "<C-q>", "<C-w>q")
map("n", "<C-f>", "<C-w>w")

--buffer
map("n", "<Bs>", "<Cmd>:bn<cr>") 
map("n", "<C-H>", "<Cmd>:bp<cr>") 
map("n", "<leader><bs>", "<Cmd>:b#<cr>") 
map("n", "<CR>", "<Cmd>:ls<cr>")

vim.cmd([[
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>
]])

vim.cmd([[
"   Command alias
" example
"command Test echo "12312"
cnoreabbrev <expr> test getcmdtype() == ':' && getcmdline() =~# '^test' ? 'Test' : 'test'
cnoreabbrev <expr> W getcmdtype() == ':' && getcmdline() =~# '^W' ? 'w' : 'W'
cnoreabbrev <expr> WQ getcmdtype() == ':' && getcmdline() =~# '^WQ' ? 'wqa' : 'WQ'
cnoreabbrev <expr> Wq getcmdtype() == ':' && getcmdline() =~# '^Wq' ? 'wqa' : 'Wq'
cnoreabbrev <expr> wQ getcmdtype() == ':' && getcmdline() =~# '^wQ' ? 'wqa' : 'wQ'
cnoreabbrev <expr> wq getcmdtype() == ':' && getcmdline() =~# '^wq' ? 'wqa' : 'wq'
cnoreabbrev <expr> Q getcmdtype() == ':' && getcmdline() =~# '^Q' ? 'q' : 'Q'
cnoreabbrev toc Toc
]])

map("n", "\\", "<Cmd>w<cr><Cmd>Lazy<cr>")
