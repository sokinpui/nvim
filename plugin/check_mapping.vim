command! -nargs=1 -complete=command -bar -range CheckMapping silent execute Redir map
command! CheckMapping execute "Redir map"
