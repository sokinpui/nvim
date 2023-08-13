-- basis setting
vim.g.markdown_fenced_languages  =  { 'c', 'sh', 'python', 'java', 'lisp' }
vim.g.mapleader  =  " "

vim.cmd([[
let $PAGER  =  ''

let &t_TI  =  "\<Esc>[>4;2m"
let &t_TE  =  "\<Esc>[>4;m"

filetype plugin on
filetype plugin indent on
packadd! matchit
]])

vim.opt.path = "$PWD/**"
--vim.opt.undodir = ~/.local/state/nvim/undo//
--vim.opt.directory = ~/.local/state/nvim/swap//

vim.opt.undofile = true
vim.opt.compatible = false
vim.opt.paste = false
vim.opt.autoread = true

vim.opt.backspace = "indent,eol,start"
vim.opt.ttimeoutlen = 0
vim.opt.encoding = "utf-8"

vim.opt.mouse = "a"

vim.opt.splitbelow = true
vim.opt.history = 1000
vim.opt.number = true
vim.opt.showcmd = true
vim.opt.ruler = true
vim.opt.relativenumber = true

vim.opt.wildmenu = true
vim.opt.wildoptions  =  ""

vim.opt.mousescroll = "ver:5,hor:5"

--       Buffer and file editing
--   File buffer
-- enable editing multi buffer without saving
vim.opt.hidden = true
-- keep the current woring directory same as the editin file
vim.opt.autochdir = true
-- Back to the last curosr when open new buffer
vim.cmd([[
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
]])
