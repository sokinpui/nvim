vim.cmd([[
"    Appearance
set background=dark

" True color
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

syntax on

set termguicolors
"let g:onedark_config = {
"    \ 'style': 'dark',
"\}
"colorscheme onedark

"set concealcursor=""
set conceallevel=2

"  statusline setting
set statusline=%<%F\ %h%m%r%=%-5.(%l,%c-%v%)\ %p%% " more setting in pack directory
set laststatus=2

" cursor shape
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

" buffer split
augroup Init_buffer
    au!
    au BufEnter * if &buftype == 'terminal' | exec 'normal! i' | endif
    au BufEnter *.txt if &buftype == 'help' | if winnr('$') <= 2 | wincmd H | endif | endif  
augroup END

" lualine, beauty statusline
"lua require('config.nvim-lualine')

]])
