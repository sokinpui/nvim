let g:mapleader = " "

inoremap <C-k> <Esc>k

" delete whole word via Ctrl+backspace
inoremap <C-H> <C-w>
cnoremap <C-H> <C-w>
tnoremap <C-H> <C-w>

" copy and paste
if has("linux")
    nnoremap <leader>y "+y
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

noremap ( )
noremap ) (
nnoremap <c-d> <c-d>zz
nnoremap <c-u> <c-u>zz 

nnoremap n nzzzv
nnoremap N Nzzzv

noremap J 5j
noremap K 5k

"nnoremap <expr> n (v:searchforward ? 'nzzzv' : 'Nzzzv')
"nnoremap <expr> N (v:searchforward ? 'Nzzzv' : 'nzzzv')

nnoremap * *zzzv
nnoremap # #zzzv
vnoremap * y/<c-r>0<cr>zzzv  
vnoremap # y?<c-r>0<cr>zzzv  

" Texts
vnoremap < <gv
vnoremap > >gv

" indention formation
nnoremap =<leader> gg=G''zz

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

set guicursor=i-n-v-c-sm:block,r-cr-o:hor50
