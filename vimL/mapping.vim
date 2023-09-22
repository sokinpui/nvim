inoremap <C-k> <Esc>k

" delete whole word via Ctrl+backspace
inoremap <C-H> <C-w>
cnoremap <C-H> <C-w>
tnoremap <C-H> <C-w>

" copy and paste
if has("linux")
    nnoremap <leader>y "+y
    nnoremap <leader>d "+d
    nnoremap <leader>Y "+Y
    vnoremap Y "+ygv<esc>
    vnoremap X "+xgv<esc>
    vnoremap <C-c> "+ygv<esc>
    nnoremap <leader>P "+p']
    vnoremap <leader>P "+p']
    inoremap <C-v> <C-r><C-o>+
    "inoremap <C-v> <C-o>"+p
    cnoremap <C-v> <C-r><C-o>+
    nnoremap gy <Cmd>1,$y +<cr>
else
    nnoremap <leader>y "*y
    nnoremap <leader>d "*d
    nnoremap <leader>Y "*Y
    vnoremap Y "*ygv<esc>
    vnoremap X "*xgv<esc>
    vnoremap <C-c> "*ygv<esc>
    nnoremap <leader>P "*p']
    vnoremap <leader>P "*p']
    inoremap <C-v> <C-r><C-o>*
    cnoremap <C-v> <C-r><C-o>*
    nnoremap gy <Cmd>1,$y *<cr>
endif

xnoremap <leader>p "_dP

" select the last pasted text
nnoremap gp '[v']

" increment and decrement of characters
"set nrformats+=alpha

"   Motion
" Vertical
noremap ( )
noremap ) (
nnoremap <c-d> <c-d>zz
nnoremap <c-u> <c-u>zz 

"noremap <leader>K K

" search
"nnoremap <expr> n (v:searchforward ? 'nzzzv' : 'Nzzzv')
"nnoremap <expr> N (v:searchforward ? 'Nzzzv' : 'nzzzv')

nnoremap * *zzzv
nnoremap # #zzzv
vnoremap * y/<c-r>0<cr>zzzv  
vnoremap # y?<c-r>0<cr>zzzv  

" indention formation
nnoremap =<leader> gg=G''zz

" should be leverge the built in . repeat
"vnoremap < <gv
"vnoremap > >gv

" shortcut
"nnoremap <C-q> <C-w>q
"nnoremap <C-f> <C-w>w

nnoremap =d <Cmd>bd<cr>
nnoremap =q <C-w>q
nnoremap =h <C-w>h
nnoremap =j <C-w>j
nnoremap =k <C-w>k
nnoremap =l <C-w>l

" update current file
"nnoremap <leader>e :edit! %<cr>

" buffer switch
nnoremap <Bs> <Cmd>bn<cr> 
nnoremap <C-H> <Cmd>bp<cr> 
" This is same as C-^, the alternative file
"nnoremap <leader><bs> <Cmd>b#<cr> 
nnoremap =<Bs> <Cmd>ls<cr>

"   Command alias
cnoreabbrev <expr> W getcmdtype() == ':' && getcmdline() =~# '^W' ? 'w' : 'W'
cnoreabbrev <expr> WQ getcmdtype() == ':' && getcmdline() =~# '^WQ' ? 'wqa' : 'WQ'
cnoreabbrev <expr> Wq getcmdtype() == ':' && getcmdline() =~# '^Wq' ? 'wqa' : 'Wq'
cnoreabbrev <expr> wQ getcmdtype() == ':' && getcmdline() =~# '^wQ' ? 'wqa' : 'wQ'
cnoreabbrev <expr> wq getcmdtype() == ':' && getcmdline() =~# '^wq' ? 'wqa' : 'wq'
cnoreabbrev <expr> Q getcmdtype() == ':' && getcmdline() =~# '^Q' ? 'q' : 'Q'

" VimPlug
if has('nvim')
    "nnoremap \ <Cmd>w<cr><Cmd>Lazy<cr>
else
    nnoremap \i <Cmd>w<cr><Cmd>source ~/.config/nvim/init.vim<cr><Cmd>PlugInstall<cr>
    nnoremap \c <Cmd>w<cr><Cmd>source ~/.config/nvim/init.vim<cr><Cmd>PlugClean<cr>
endif

