let g:mapleader = " "

"" highlight search
vnoremap / "9y/<C-r>9<cr>
xnoremap / "9y/<C-r>9<cr>
nnoremap <Leader>n /\d\+<cr>zz

"" copy and paste
nnoremap <leader>Y "+yy
nnoremap <leader>X "+dd
vnoremap Y "+y
vnoremap X "+x
vnoremap <C-c> "+y
nnoremap <leader>P "+p
vnoremap <leader>P "+p
inoremap <C-v> <esc>"+pa
"nnoremap gy :1,$y +<cr>
xnoremap <leader>p "_dP
nnoremap <leader>v g^vg$

"" motion
nnoremap ( )
nnoremap ) (

vnoremap < <gv
vnoremap > >gv
