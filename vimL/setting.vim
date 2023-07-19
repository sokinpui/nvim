" basis setting
let g:markdown_fenced_languages = ['c', 'sh', 'python', 'java']
let g:mapleader = " "

let $PAGER = ''

let &t_TI = "\<Esc>[>4;2m"
let &t_TE = "\<Esc>[>4;m"

filetype plugin on
filetype plugin indent on
packadd! matchit

set path=$PWD/**
set undodir=$HOME/.config/nvim/undo
set directory=/tmp//

set undofile
set nocompatible
set nopaste
set autoread

set backspace=indent,eol,start 
set ttimeoutlen=0
set encoding=utf-8

set mouse=a

set splitbelow
set history=1000
set number
set showcmd
set ruler
set relativenumber

set wildmenu
set wildoptions = ""

set mousescroll=ver:5,hor:5

"       Buffer and file editing
"   File buffer
" enable editing multi buffer without saving
set hidden
" keep the current woring directory same as the editin file
set autochdir
" Back to the last curosr when open new buffer
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" auto source .vimrc
autocmd! bufwritepost .vimrc ++nested source %