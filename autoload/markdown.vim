function! func#IsBlank()
    normal! g$
    let char = getline(".")[col(".") - 1]
    if char == "\t" || char == " "
        normal! gel
        startinsert
    else
        startinsert!
    endif
endfunction
