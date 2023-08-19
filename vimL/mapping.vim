inoremap <C-k> <Esc>k

" delete whole word via Ctrl+backspace
inoremap <C-H> <C-w>
cnoremap <C-H> <C-w>
tnoremap <C-H> <C-w>

" copy and paste
if has("linux")
    nnoremap <leader>y "+y
    nnoremap <leader>d "+d
    vnoremap <leader>y "+y
    nnoremap <leader>Y "+Y
    vnoremap Y "+y
    vnoremap X "+x
    vnoremap <C-c> "+y
    nnoremap <leader>P "+p']
    vnoremap <leader>P "+p']
    inoremap <C-v> <C-r><C-o>+
    "inoremap <C-v> <C-o>"+p
    cnoremap <C-v> <C-r><C-o>+
    nnoremap gy <Cmd>1,$y +<cr>
else
    nnoremap <leader>y "*y
    nnoremap <leader>d "*d
    vnoremap <leader>y "+y
    nnoremap <leader>Y "*Y
    vnoremap Y "*y
    vnoremap X "*x
    vnoremap <C-c> "*y
    nnoremap <leader>P "*p
    vnoremap <leader>P "*p
    inoremap <C-v> <C-r><C-o>*
    cnoremap <C-v> <C-r><C-o>*
    nnoremap gy <Cmd>1,$y *<cr>
endif

xnoremap <leader>p "_dP

" increment and decrement of characters
"set nrformats+=alpha

"   Motion
" Vertical
noremap ( )
noremap ) (
nnoremap <c-d> <c-d>zz
nnoremap <c-u> <c-u>zz 

nnoremap n nzzzv
nnoremap N Nzzzv

noremap <leader>K K
noremap <leader>J J

nnoremap <expr> n (v:searchforward ? 'nzzzv' : 'Nzzzv')
nnoremap <expr> N (v:searchforward ? 'Nzzzv' : 'nzzzv')

nnoremap * *zzzv
nnoremap # #zzzv
vnoremap * y/<c-r>0<cr>zzzv  
vnoremap # y?<c-r>0<cr>zzzv  

" Texts
vnoremap < <gv
vnoremap > >gv

" indention formation
nnoremap =<leader> gg=G''zz

nnoremap <C-q> <C-w>q
nnoremap <C-f> <C-w>w

" update current file
"nnoremap <leader>e :edit! %<cr>

" buffer switch
nnoremap <Bs> <Cmd>bn<cr> 
nnoremap <C-H> <Cmd>bp<cr> 
nnoremap <leader><bs> <Cmd>b#<cr> 
nnoremap <CR> <Cmd>ls<cr>
" keep <cr> function in cli window and quickfix
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

"   Command alias
" example
"command Test echo "12312"
"cnoreabbrev <expr> test getcmdtype() == ':' && getcmdline() =~# '^test' ? 'Test' : 'test'
cnoreabbrev <expr> W getcmdtype() == ':' && getcmdline() =~# '^W' ? 'w' : 'W'
cnoreabbrev <expr> WQ getcmdtype() == ':' && getcmdline() =~# '^WQ' ? 'wqa' : 'WQ'
cnoreabbrev <expr> Wq getcmdtype() == ':' && getcmdline() =~# '^Wq' ? 'wqa' : 'Wq'
cnoreabbrev <expr> wQ getcmdtype() == ':' && getcmdline() =~# '^wQ' ? 'wqa' : 'wQ'
cnoreabbrev <expr> wq getcmdtype() == ':' && getcmdline() =~# '^wq' ? 'wqa' : 'wq'
cnoreabbrev <expr> Q getcmdtype() == ':' && getcmdline() =~# '^Q' ? 'q' : 'Q'

" very magic subtitutions
"cnoreabbrev <expr> s/ getcmdtype() == ':' && getcmdline() =~# '^s/' ? 's/\v' : 's/'
"cnoreabbrev <expr> %s/ getcmdtype() == ':' && getcmdline() =~# '^%s/' ? '%s/\v' : '%s/'

" VimPlug
if has('nvim')
    "nnoremap \ <Cmd>w<cr><Cmd>Lazy<cr>
else
    nnoremap \i <Cmd>w<cr><Cmd>source ~/.config/nvim/init.vim<cr><Cmd>PlugInstall<cr>
    nnoremap \c <Cmd>w<cr><Cmd>source ~/.config/nvim/init.vim<cr><Cmd>PlugClean<cr>
endif
