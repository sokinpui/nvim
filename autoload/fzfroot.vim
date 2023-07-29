function! fzfroot#find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
