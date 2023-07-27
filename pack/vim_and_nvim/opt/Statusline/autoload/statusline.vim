function! statusline#LastSearchCount() abort
    let result = searchcount(#{recompute: 1})
    if empty(result)
        return ''
    endif
    if result.incomplete ==# 1     " timed out
        return printf(' [%s] [?/??]', @/)
    elseif result.incomplete ==# 2 " max count exceeded
        if result.total > result.maxcount &&
                    \  result.current > result.maxcount
            return printf(' [%s] [>%d/>%d]', @/,
                        \             result.current, result.total)
        elseif result.total > result.maxcount
            return printf(' [%s] [%d/>%d]', @/,
                        \             result.current, result.total)
        endif
    endif
    return printf(' [%s] [%d/%d]', @/,
                \             result.current, result.total)
endfunction
