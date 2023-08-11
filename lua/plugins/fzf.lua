return {
    {
        'junegunn/fzf.vim',
        dependencies = {
            'junegunn/fzf',
        },
        keys = {
            {"<leader>f"},
            {"<leader>gp"},
            { "<c-l>", mode = "i" },
            { "<c-f>", mode = "i" },
        },
        cmd = {
            "Files",
            "GFiles",
            "Buffers",
            "Colors",
            "Ag",
            "Rg",
            "RG",
            "Lines",
            "BLines",
            "Tags",
            "BTags",
            "Marks",
            "Jumps",
            "Windows",
            "Locate",
            "History",
            "Snippets",
            "Commits",
            "BCommits",
            "Commands",
            "Maps",
            "Helptags",
            "Filetypes",
        },
        build = "./install --all",
        config = function()
            vim.cmd([[
            let g:fzf_preview_window = [ 'right,60%', 'ctrl-/' ]
            let g:fzf_layout         = {'window': { 'width': 0.95, 'height': 1 }}
            let g:fzf_buffers_jump   = 1
            nnoremap <leader>ff :Files<cr>
            nnoremap <leader>fa :Files $HOME<cr>
            nnoremap <leader>fp :<cr>
            nnoremap <leader>fp :execute 'Files' system('git rev-parse --show-toplevel 2> /dev/null')[:-2]<cr>

            nnoremap <leader>fb :Buffers<cr>
            nnoremap <leader>fs :Lines<cr>

            nnoremap <leader>gp :Rg<cr>

            nnoremap <leader>f. :History<cr>
            nnoremap <leader>f/ :History/<cr>
            nnoremap <leader>f: :History:<cr>

            nnoremap <leader>fh :Helptags<cr>
            nnoremap <leader>fc :Commands<cr>

            "insert relative path of file in project
            inoremap <expr> <C-l> fzf#vim#complete#path('fd --type=file . $(git rev-parse --show-cdup 2> /dev/null)')
            inoremap <expr> <C-f> fzf#vim#complete#path('fd --type=file . $(git rev-parse --show-toplevel 2> /dev/null)')
            ]])
        end,
    },
}
