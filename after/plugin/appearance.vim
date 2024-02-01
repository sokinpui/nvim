"    Appearance
"set background=dark

"syntax on

set termguicolors

"  statusline setting
set statusline=%<%F\ %h%m%r%=%-5.(%l,%c-%v%)\ %p%% " more setting in pack directory
set laststatus=2

" I like block blink cursor
set guicursor=i-n-v-c-sm:block,r-cr-o:hor50,a:blinkon100

" cursor shape
"let &t_SR = "\e[4 q" "SR = REPLACE mode
"let &t_EI = "\e[2 q" "EI = NORMAL mode (ELSE)
"let &t_SI = "\e[6 q" "SI = INSERT mode

"    Highlight
"  Search
set incsearch
set hlsearch
set ignorecase
set smartcase
augroup AutoHighlighting
    au!
    autocmd insertenter * set nohlsearch
    autocmd textchanged * set nohlsearch
    autocmd CmdlineEnter /,\? set hlsearch
augroup END

highlight Visual ctermbg=242 guibg=#3e6452
highlight MatchParen ctermbg=6 gui=bold guifg=#ff0000 guibg=#31353f
highlight Search ctermfg=0 ctermbg=11 gui=bold,italic guifg=#080808 guibg=#61afef
highlight IncSearch cterm=reverse gui=bold,italic guifg=#31353f guibg=#e5c07b
highlight CurSearch gui=bold,italic guifg=#080808 guibg=#d19a66
highlight Comment gui=bold,italic guifg=#808080
highlight @comment gui=bold,italic guifg=#808080

set scrolloff=8
set signcolumn=yes
set listchars=space:⋅

set nocursorline
" auto hide and show cursorline when leave windows
"augroup CursorLine
"    au!
"    au VimEnter * setlocal cursorline
"    au WinEnter * setlocal cursorline
"    au BufWinEnter * setlocal cursorline
"    au WinLeave * setlocal nocursorline
"augroup END


