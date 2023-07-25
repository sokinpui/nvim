function CompileRun#CompileRun()
    execute "w"
    if &filetype == 'c'
        execute "silent !clear"
        execute "!make %< && time %<"
    elseif &filetype == 'python'
        execute "!clear ; time python3 %"
    elseif &filetype == 'markdown'
        execute "MarkdownPreview"
    elseif &filetype == 'java'
        execute "silent !clear"
        execute "!java %"
    endif
endfunction
