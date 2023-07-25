nmap <buffer><expr>
            \ <Plug>(fern-my-open-expand-collapse)
            \ fern#smart#leaf(
            \   "\<Plug>(fern-action-open:select)",
            \   "\<Plug>(fern-action-expand)",
            \   "\<Plug>(fern-action-collapse)",
            \ )

nmap <buffer> <Plug>(fern-new-and-edit)
      \ <Plug>(fern-action-new-file)
      \ <Plug>(fern-action-open:select)

nnoremap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
nnoremap <buffer> <TAB> <Plug>(fern-my-open-expand-collapse)
nnoremap <buffer> h <Plug>(fern-action-collapse)
nnoremap <buffer> l <Plug>(fern-action-expand)
nnoremap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)

nnoremap <buffer> o <Plug>(fern-new-and-edit)
nnoremap <buffer> nd <Plug>(fern-action-new-dir)
nnoremap <buffer> D <Plug>(fern-action-remove)
nnoremap <buffer> rn <Plug>(fern-action-rename)l

nnoremap <buffer> s <Plug>(fern-action-open:split)
nnoremap <buffer> v <Plug>(fern-action-open:vsplit)
nnoremap <buffer> r <Plug>(fern-action-reload)
nnoremap <buffer> <nowait> . <Plug>(fern-action-hidden:toggle)
nnoremap <buffer> <nowait> < <Plug>(fern-action-leave)
nnoremap <buffer> <nowait> > <Plug>(fern-action-enter)

"enter project root, contain .git
nnoremap <buffer> ^ <Plug>(fern-action-project-top)

" preview file
"nnoremap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
nnoremap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
nnoremap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
nnoremap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)

"smart [q]uit
nnoremap <silent> <buffer> <expr> <Plug>(fern-quit-or-close-preview) fern_preview#smart_preview("\<Plug>(fern-action-preview:close)", ":q\<CR>")
nnoremap <silent> <buffer> q <Plug>(fern-quit-or-close-preview)
