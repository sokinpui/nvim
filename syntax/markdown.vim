"highlight the entire block quote
syntax match QuoteBlockText "^> .*"

highlight QuoteBlockText ctermfg=14 gui=bold,italic guifg=#808080

highlight def link QuoteBlockText Comment

