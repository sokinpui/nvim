let &statusline ..= '%=%-50.{statusline#LastSearchCount()} %(%l,%c-%v%) %p%%'
autocmd CursorMoved,CursorMovedI *
            \ let s:searchcount_timer = timer_start(
            \   200, function('s:update_searchcount'))

function! s:update_searchcount(timer) abort
    if a:timer ==# s:searchcount_timer
        call searchcount(#{
                    \ recompute: 1, maxcount: 0, timeout: 100})
        redrawstatus
    endif
endfunction
