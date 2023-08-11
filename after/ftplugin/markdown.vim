setlocal textwidth=0 wrap formatoptions=tc2n linebreak iskeyword+=\-
set foldmethod=manual
nnoremap <leader><C-l> :setlocal formatoptions=tcw2n textwidth=80 linebreak<cr> 

noremap <buffer> j gj
noremap <buffer> k gk
noremap <buffer> $ g$
noremap <buffer> ^ g^
noremap <buffer> 0 g0

nnoremap <buffer> dd g0vg$D
nnoremap <buffer> D g0vg$D

nnoremap <buffer> G Gg_

nnoremap <buffer> I g^i

nnoremap <buffer> A :call markdown#IsBlank()<cr>

nnoremap <buffer> V g0vg$
"call markdown_latex#MDSettings()

nnoremap <buffer> gl :LazyList<cr>
vnoremap <buffer> gl :LazyList<cr>

" coachshea/vim-textobj-markdown
"" codeblock
onoremap <buffer> ic <plug>(textobj-markdown-Bchunk-i)
onoremap <buffer> ac <plug>(textobj-markdown-Bchunk-a)
vnoremap <buffer> ic <plug>(textobj-markdown-Bchunk-i)
vnoremap <buffer> ac <plug>(textobj-markdown-Bchunk-a)

"" text block between code block
onoremap <buffer> im <plug>(textobj-markdown-Btext-i)
onoremap <buffer> am <plug>(textobj-markdown-Btext-a)
vnoremap <buffer> im <plug>(textobj-markdown-Btext-i)
vnoremap <buffer> am <plug>(textobj-markdown-Btext-a)

"AckslD/nvim-FeMaco.lua",
nnoremap <buffer> <leader>e <Cmd>FeMaco<cr>

highlight! Conceal gui=bold cterm=bold

