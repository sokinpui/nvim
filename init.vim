" variable
let g:markdown_fenced_languages = ['c', 'sh', 'python', 'java']
let g:mapleader = " "

let $PAGER = ''
let &t_TI = "\<Esc>[>4;2m"
let &t_TE = "\<Esc>[>4;m"

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

filetype plugin on
filetype plugin indent on
packadd! matchit

set mouse=a
"set concealcursor=""
set conceallevel=2

"    Appearance
set background=dark
" True color
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
syntax on
set termguicolors
let g:onedark_config = {
    \ 'style': 'dark',
\}
colorscheme onedark

set splitbelow
set history=1000
set number
set showcmd
set ruler
set relativenumber

set wildmenu
set wildoptions = ""

"  statusline setting
set statusline=%<%F " more setting in pack directory
set laststatus=2

"   Cursor style
" Mode 
let &t_SR = "\e[4 q" "SR = REPLACE mode
let &t_EI = "\e[2 q" "EI = NORMAL mode (ELSE)
let &t_SI = "\e[6 q" "SI = INSERT mode

"    Highlight
"  Search
set incsearch
set ignorecase
set smartcase
autocmd insertenter * set nohlsearch
autocmd textchanged * set nohlsearch
nnoremap / :set hlsearch<cr>/
nnoremap ? :set hlsearch<cr>?
nnoremap n n:set hlsearch<cr>
nnoremap N N:set hlsearch<cr>
nnoremap * :set hlsearch<cr>*
nnoremap # :set hlsearch<cr>#

"vnoremap / "9y:set hlsearch<cr>/<C-r>9<cr>
"xnoremap / "9y:set hlsearch<cr>/<C-r>9<cr>

" search in split window
noremap <c-w>/ :set hlsearch<cr><c-w>v<c-w>l/
noremap <c-w>? :set hlsearch<cr><c-w>v<c-w>l?
noremap <c-w>* :set hlsearch<cr><c-w>v<c-w>l*
noremap <c-w># :set hlsearch<cr><c-w>v<c-w>l#

" next full digit
"nnoremap <Leader>n :set hlsearch<cr>/\d\+<cr>zz

" Cursorline
set scrolloff=5
set cursorline
" auto hide and show cursorline when leave windows
augroup CursorLine
    au!
    au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

"    Indention
set softtabstop=-1
set tabstop=8     
set expandtab     
set shiftwidth=4  
set autoindent    
set smartindent   
set smartindent   

"       Mapping
"   Copy & paste

if has("linux")
    nnoremap <leader>Y "+yy
    nnoremap <leader>X "+dd
    vnoremap Y "+y
    vnoremap X "+x
    vnoremap <C-c> "+y
    nnoremap <leader>P "+p
    vnoremap <leader>P "+p
    inoremap <C-v> <esc>"+pa
    nnoremap gy :1,$y +<cr>
else
    nnoremap <leader>Y "*yy
    nnoremap <leader>X "*dd
    vnoremap Y "*y
    vnoremap C "*y
    vnoremap X "*x
    nnoremap <leader>P "*p
    vnoremap <leader>P "*p
    vnoremap <leader>P "*p
    nnoremap gy :1,$y *<cr>
    set pastetoggle=π
    nnoremap å <c-a>
    nnoremap ≈ <c-x>
    vnoremap gå g<c-a>
    vnoremap g≈ g<c-x>
endif
xnoremap <leader>p "_dP
nnoremap D dd
nnoremap <leader>v g^vg$

" increment and decrement of characters
"set nrformats+=alpha

"   Motion
" Vertical
nnoremap ( )
nnoremap ) (
nnoremap <c-d> <c-d>zz
nnoremap <c-u> <c-u>zz 

noremap J }
noremap K {

noremap <C-j> J
noremap <C-k> K

" Horizontial

" Texts
vnoremap < <gv
vnoremap > >gv

" Jumps
nnoremap <c-i> <c-i>

"    Split windows
" Naviagation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>w <C-w>w
nnoremap <leader>q <C-w>q

" resize windows
"nnoremap <leader>= <c-w>=
nnoremap <c-right> <c-w>>
nnoremap <c-left> <c-w><
nnoremap <c-up> <c-w>=
nnoremap <c-down> <c-w>-

" run command in split window
nnoremap <leader>s :VimuxPromptCommand<CR>

"    Completion
" Parethesises
inoremap {<cr> {<cr>}<esc>%o

" Language
" set omnifunc=syntaxcomplete#Complete

"    Text width and line wrapping
augroup ftTextwidthWrap
    au!
    au filetype zsh,sh setlocal textwidth=0 wrap formatoptions=tcq linebreak shiftwidth=2
    au filetype vim setlocal textwidth=0 wrap formatoptions=tcq linebreak
    au filetype yaml,conf setlocal textwidth=0 wrap formatoptions=tcq linebreak
    au filetype c,python setlocal textwidth=0 wrap formatoptions=tcq linebreak
    au filetype text,markdown setlocal formatoptions=tcaw2n textwidth=80 linebreak 
augroup END

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
nnoremap <leader>S :source ~/.vim/vimrc<cr>
" nnoremap <C-z> :shell<cr>

" update current file
noremap <leader>e :edit! %<cr>

" buffer switch
nnoremap <Bs> :bn<cr> 
nnoremap <Del> :bp<cr> 
nnoremap <leader><bs> :b#<cr> 
nnoremap <CR> :ls<cr>
" keep <cr> function in cli window and quickfix
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

" buffer split
augroup Init_buffer
    au!
    au BufEnter * if &buftype == 'terminal' | exec 'normal! i' | endif
    au BufEnter *.txt if &buftype == 'help' | if winnr('$') <= 2 | wincmd H | endif | endif  
augroup END

"   Command alias
" example
"command Test echo "12312"
"cnoreabbrev <expr> test getcmdtype() == ':' && getcmdline() =~# '^test' ? 'Test' : 'test'
cnoreabbrev <expr> W getcmdtype() == ':' && getcmdline() =~# '^W' ? 'w' : 'W'
cnoreabbrev <expr> Q getcmdtype() == ':' && getcmdline() =~# '^Q' ? 'q' : 'Q'

" VimPlug
nnoremap \i :w<cr>:source ~/.config/nvim/init.vim<cr>:PlugInstall<cr>
nnoremap \c :w<cr>:source ~/.config/nvim/init.vim<cr>:PlugClean<cr>
nnoremap \u :w<cr>:source ~/.config/nvim/init.vim<cr>:PlugUpdate<cr>

source ~/.config/nvim/plugins.vim

lua require('plugin-config/nvim-treesitter')
