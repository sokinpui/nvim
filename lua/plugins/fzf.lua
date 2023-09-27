return {
    {
        'junegunn/fzf.vim',
        dependencies = {
            'junegunn/fzf',
        },
        keys = {
            {"<leader>f"},
            {"<C-p>"},
            {"<C-f>"},
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
            let g:fzf_preview_window = [ 'right,50%', 'ctrl-/' ]
            let g:fzf_layout         = {'window': { 'width': 0.95, 'height': 1 }}
            let g:fzf_buffers_jump   = 1
            nnoremap <C-f> <Cmd>Files<cr>
            nnoremap <leader>ff <Cmd>execute 'Files' system('git rev-parse --show-toplevel 2> /dev/null')[:-2]<cr>

            nnoremap <leader>fb <Cmd>Buffers<cr>
            nnoremap <leader>fs <Cmd>Lines<cr>

            nnoremap <C-p> <Cmd>Rg<cr>

            nnoremap <leader>fo <Cmd>History<cr>

            nnoremap <leader>fm <Cmd>Marks<cr>

            nnoremap <leader>fh <Cmd>Helptags<cr>
            nnoremap <leader>fc <Cmd>Commands<cr>

            "insert relative path of file in project
            " inoremap <expr> <C-l> fzf#vim#complete#path('fd --type=file . $(git rev-parse --show-cdup 2> /dev/null)')
            " inoremap <expr> <C-f> fzf#vim#complete#path('fd --type=file . $(git rev-parse --show-toplevel 2> /dev/null)')
            ]])
        end,
    },
}
