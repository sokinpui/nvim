setlocal textwidth=0 wrap formatoptions=tc2n linebreak
nnoremap <leader><C-l> :setlocal formatoptions=tcw2n textwidth=80 linebreak<cr> 

noremap <buffer> j gj
noremap <buffer> k gk
noremap <buffer> $ g$
noremap <buffer> ^ g^
noremap <buffer> 0 g0

nnoremap <buffer> dd g0vg$D
nnoremap <buffer> D g0vg$D

nnoremap <buffer> I g^i

nnoremap <buffer> A :call markdown#IsBlank()<cr>

nnoremap <buffer> V g0vg$
call markdown_latex#MDSettings()
