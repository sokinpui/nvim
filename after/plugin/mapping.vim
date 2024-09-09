inoremap <C-k> <Esc>k
nnoremap <C-q> <Cmd>q<cr>

nnoremap <Esc> <Cmd>nohlsearch<CR><Esc>

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
    cnoremap <C-v> <C-r><C-o>+
    nnoremap gy <Cmd>%y+<cr>
elseif has("mac")
    nnoremap <leader>y "*y
    nnoremap <leader>d "*d
    nnoremap <leader>Y "*Y
    vnoremap Y "*y
    vnoremap <Space><Space> "*y
    vnoremap X "*xgv<esc>
    vnoremap <C-c> "*ygv<esc>
    nnoremap <leader>P "*p']
    vnoremap <leader>P "*p']
    inoremap <C-v> <C-r><C-o>*
    cnoremap <C-v> <C-r><C-o>*
    nnoremap gy <Cmd>%y*<cr>
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
noremap <c-d> <c-d>zz
noremap <c-u> <c-u>zz

"make {count}j/k become jumps
nnoremap <expr> j (v:count > 2 ? "m'" . v:count . "j" : "j")
nnoremap <expr> k (v:count > 2 ? "m'" . v:count . "k" : "k")

nnoremap Q @q

"noremap <leader>K K

" search
"nnoremap <expr> n (v:searchforward ? 'nzzzv' : 'Nzzzv')
"nnoremap <expr> N (v:searchforward ? 'Nzzzv' : 'nzzzv')

nnoremap n <Cmd>set hlsearch<Cr>nzzzv
nnoremap N <Cmd>set hlsearch<Cr>Nzzzv
nnoremap * <Cmd>set hlsearch<Cr>*zzzv
nnoremap # <Cmd>set hlsearch<Cr>#zzzv
vnoremap * y<Cmd>set hlsearch<Cr>/<c-r>0<cr>zzzv
vnoremap # y<Cmd>set hlsearch<Cr>?<c-r>0<cr>zzzv
nnoremap g* <Cmd>set hlsearch<Cr>g*zzzv
nnoremap g# <Cmd>set hlsearch<Cr>g#zzzv
nnoremap <c-o> <c-o>zz
nnoremap <c-i> <c-i>zz


" exact search
nnoremap <leader>/ /\<\><Left><Left>

" indention formation
nnoremap =<leader> gg=G`'

" formating code
"nnoremap <leader>gq gggqG<C-o>zz

" should be leverge the built in . repeat
vnoremap < <gv
vnoremap > >gv

" shortcut
"nnoremap <C-q> <C-w>q
"nnoremap <C-f> <C-w>w

" nnoremap <c-w>d <Cmd>bd<cr>
" nnoremap =q <C-w>q
" nnoremap =h <C-w>h
" nnoremap =j <C-w>j
" nnoremap =k <C-w>k
" nnoremap =l <C-w>l

" update current file
"nnoremap <leader>e :edit! %<cr>

" buffer switch
" nnoremap <Bs> <Cmd>bn<cr>
" nnoremap <C-H> <Cmd>bp<cr>
" This is same as C-^, the alternative file
"nnoremap <leader><bs> <Cmd>b#<cr>
"nnoremap =<Bs> <Cmd>ls<cr>

" file explorer
" nnoremap <C-e> :Explore<cr>

"   Command alias
cnoreabbrev <expr> W getcmdtype() == ':' && getcmdline() =~# '^W' ? 'w' : 'W'
cnoreabbrev <expr> WQ getcmdtype() == ':' && getcmdline() =~# '^WQ' ? 'wqa' : 'WQ'
cnoreabbrev <expr> Wq getcmdtype() == ':' && getcmdline() =~# '^Wq' ? 'wqa' : 'Wq'
cnoreabbrev <expr> wQ getcmdtype() == ':' && getcmdline() =~# '^wQ' ? 'wqa' : 'wQ'
cnoreabbrev <expr> wq getcmdtype() == ':' && getcmdline() =~# '^wq' ? 'wqa' : 'wq'
cnoreabbrev <expr> Q getcmdtype() == ':' && getcmdline() =~# '^Q' ? 'q' : 'Q'

"nnoremap <leader><leader> <Cmd>source<Cr>

" scrolling
map <ScrollWheelUp> <nop>
map <S-ScrollWheelUp> <nop>
map <C-ScrollWheelUp> <nop>
map <ScrollWheelDown> <nop>
map <S-ScrollWheelDown> <nop>
map <C-ScrollWheelDown> <nop>
map <ScrollWheelLeft> <nop>
map <S-ScrollWheelLeft> <nop>
map <C-ScrollWheelLeft> <nop>
map <ScrollWheelRight> <nop>
map <S-ScrollWheelRight> <nop>
map <C-ScrollWheelRight> <nop>

" change tmux pane focus
nnoremap <A-h> <Cmd>silent !tmux select-pane -L<cr>
nnoremap <A-j> <Cmd>silent !tmux select-pane -D<cr>
nnoremap <A-k> <Cmd>silent !tmux select-pane -U<cr>
nnoremap <A-l> <Cmd>silent !tmux select-pane -R<cr>
