return {
    {
        'junegunn/fzf.vim',
        config = function()
            vim.cmd([[
                let g:fzf_preview_window = [ 'right,50%', 'ctrl-/' ]
                let g:fzf_layout         = {'window': { 'width': 0.9, 'height': 1 }}
                let g:fzf_buffers_jump   = 1
                nnoremap <leader>ff :Files<cr>
                nnoremap <leader>fa :Files $HOME<cr>
                nnoremap <leader>fr :ProjectFiles<cr>

                nnoremap <leader>fb :Buffers<cr>
                nnoremap <leader>fs :Lines<cr>

                nnoremap <leader>fp :Rg<cr>

                nnoremap <leader>f. :History<cr>
                nnoremap <leader>f/ :History/<cr>
                nnoremap <leader>f: :History:<cr>

                nnoremap <leader>fh :Helptags<cr>
                nnoremap <leader>fc :Commands<cr>

                "insert relative path of file in project
                "inoremap <expr> <C-l> fzf#vim#complete#path('fd --type=file . $(git rev-parse --show-cdup 2> /dev/null)')
                "inoremap <expr> <C-f> fzf#vim#complete#path('fd --type=file . $(git rev-parse --show-toplevel 2> /dev/null)')
            ]])
        end,
    },
}
