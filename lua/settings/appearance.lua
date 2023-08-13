--    Appearance
vim.opt.background = "dark"

vim.cmd("syntax on")

vim.opt.termguicolors = true

--set concealcursor = ""
vim.opt.conceallevel = 2

--  statusline setting
vim.opt.statusline = "%<%F %h%m%r%=%-5.(%l,%c-%v%) %p%%"
vim.opt.laststatus = 2

-- I like block cursor
vim.opt.guicursor = "i-n-v-c-sm:block,r-cr-o:hor50"

--    Highlight
--  Search
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.cmd([[
autocmd insertenter * set nohlsearch
autocmd textchanged * set nohlsearch
]])

-- Cursorline
vim.opt.scrolloff = 5
vim.opt.cursorline = true

-- auto hide and show cursorline when leave windows
vim.cmd([[
augroup CursorLine
    au!
    au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END
]])

-- buffer split
vim.cmd([[
" buffer split
augroup Init_buffer
    au!
    au FileType help wincmd H
    au FileType man wincmd H
augroup END
]])
