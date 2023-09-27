--    Appearance
--set background=dark

vim.opt.termguicolors = true

--  statusline setting
vim.opt.statusline = "%<%F %h%m%r%=%-5.(%l,%c-%v%) %p%%"
vim.opt.laststatus = 2

-- I like block blink cursor
vim.opt.guicursor = "i-n-v-c-sm:block,r-cr-o:hor50,a:blinkon100"

-- cursor shape
--let &t_SR = "\e[4 q" "SR = REPLACE mode
--let &t_EI = "\e[2 q" "EI = NORMAL mode (ELSE)
--let &t_SI = "\e[6 q" "SI = INSERT mode

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

-- highlight yanked text
--autocmd! TextYankPost * silent! lua vim.highlight.on_yank()
--autocmd! TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=250}

vim.opt.scrolloff = 8
vim.opt.cursorline = false

-- auto hide and show cursorline when leave windows
--augroup CursorLine
--    au!
--    au VimEnter * setlocal cursorline
--    au WinEnter * setlocal cursorline
--    au BufWinEnter * setlocal cursorline
--    au WinLeave * setlocal nocursorline
--augroup END

vim.opt.listchars = "space:⋅"
