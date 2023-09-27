--    Indention
vim.opt.softtabstop = -1
vim.opt.tabstop = 8
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smartindent = true

--set iskeyword+=\-,\.,\*

--    Text width and line wrapping

vim.cmd([[
augroup ftTextwidthWrap
    au!
    au filetype zsh,sh setlocal textwidth=0 wrap formatoptions=tcq linebreak shiftwidth=2
    au filetype vim,lua setlocal textwidth=0 wrap formatoptions=tcq linebreak
    au filetype yaml,conf setlocal textwidth=0 wrap formatoptions=tcq linebreak
    au filetype c,python setlocal textwidth=0 wrap formatoptions=tcq linebreak
    au filetype text,markdown setlocal textwidth=0 wrap formatoptions=tcq2n linebreak iskeyword+=\-
    "au filetype text,markdown setlocal formatoptions=tcaw2n textwidth=80 linebreak 
augroup END
]])
