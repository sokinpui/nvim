" delete whole word via Ctrl+backspace
inoremap <C-H> <C-w>
cnoremap <C-H> <C-w>
tnoremap <C-H> <C-w>

" Highlight search
nnoremap / :set hlsearch<cr>/
nnoremap ? :set hlsearch<cr>?
nnoremap n :set hlsearch<cr>n
nnoremap N :set hlsearch<cr>N
nnoremap * :set hlsearch<cr>*
nnoremap # :set hlsearch<cr>#
vnoremap * *:set hlsearch<cr>
vnoremap # #:set hlsearch<cr>

"vnoremap / "9y:set hlsearch<cr>/<C-r>9<cr>
"xnoremap / "9y:set hlsearch<cr>/<C-r>9<cr>

" search in split window
nnoremap <c-w>/ :set hlsearch<cr><c-w>v<c-w>l/
nnoremap <c-w>? :set hlsearch<cr><c-w>v<c-w>l?
nnoremap <c-w>* :set hlsearch<cr><c-w>v<c-w>l*
nnoremap <c-w># :set hlsearch<cr><c-w>v<c-w>l#

" next full digit
"nnoremap <Leader>n :set hlsearch<cr>/\d\+<cr>zz

" copy and paste
if has("linux")
    nnoremap <leader>Y "+yy
    nnoremap <leader>X "+dd
    vnoremap Y "+y
    vnoremap X "+x
    vnoremap <C-c> "+y
    nnoremap <leader>P "+p
    vnoremap <leader>P "+p
    inoremap <C-v> <C-o>:set paste<CR><C-r>+<C-o>:set nopaste<CR>
    cnoremap <C-v> <C-r>+
    nnoremap gy :1,$y +<cr>
else
    nnoremap <leader>Y "*yy
    nnoremap <leader>X "*dd
    vnoremap Y "*y
    vnoremap X "*x
    vnoremap <C-c> "*y
    nnoremap <leader>P "*p
    vnoremap <leader>P "*p
    inoremap <C-v> <C-o>:set paste<CR><C-r>*<C-o>:set nopaste<CR>
    cnoremap <C-v> <C-r>*
    nnoremap gy :1,$y *<cr>
endif
xnoremap <leader>p "_dP
"nnoremap D dd
nnoremap <leader>v g^vg$

" increment and decrement of characters
"set nrformats+=alpha

"   Motion
" Vertical
nnoremap ( )
nnoremap ) (
nnoremap <c-d> <c-d>zz
nnoremap <c-u> <c-u>zz 

noremap J 5j
noremap K 5k

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
nnoremap <C-f> <C-w>w
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>w <C-w>w
nnoremap <leader>q <C-w>q
nnoremap <C-q> <C-w>q

" resize windows
"nnoremap <leader>= <c-w>=
"nnoremap <c-right> <c-w>>
"nnoremap <c-left> <c-w><
"nnoremap <c-up> <c-w>+
"nnoremap <c-down> <c-w>-

"    Completion
" Parethesises
"inoremap {<cr> {<cr>}<esc>%o

" update current file
nnoremap <leader>e :edit! %<cr>

" buffer switch
nnoremap <Bs> :bn<cr> 
nnoremap <C-H> :bp<cr> 
nnoremap <leader><bs> :b#<cr> 
nnoremap <CR> :ls<cr>
" keep <cr> function in cli window and quickfix
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

"   Command alias
" example
"command Test echo "12312"
"cnoreabbrev <expr> test getcmdtype() == ':' && getcmdline() =~# '^test' ? 'Test' : 'test'
cnoreabbrev <expr> W getcmdtype() == ':' && getcmdline() =~# '^W' ? 'w' : 'W'
cnoreabbrev <expr> Wq getcmdtype() == ':' && getcmdline() =~# '^Wq' ? 'wqa' : 'Wq'
cnoreabbrev <expr> WQ getcmdtype() == ':' && getcmdline() =~# '^WQ' ? 'wqa' : 'WQ'
cnoreabbrev <expr> Q getcmdtype() == ':' && getcmdline() =~# '^Q' ? 'q' : 'Q'
cnoreabbrev wq wqa

cnoreabbrev toc Toc

" VimPlug
if has('nvim')
    nnoremap \i :w<cr>:Lazy install<cr>
    nnoremap \c :w<cr>:Lazy clean<cr>
else
    nnoremap \i :w<cr>:source ~/.config/nvim/init.vim<cr>:PlugInstall<cr>
    nnoremap \c :w<cr>:source ~/.config/nvim/init.vim<cr>:PlugClean<cr>
endif
