if  ! exists('g:loaded_fzf_vim')
  finish
endif

command! ProjectFiles execute 'Files' fzfroot#find_git_root()
