return {
    { 
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = "markdown",
        cmd = "MarkdownPreview",
        config = function()
            vim.g.mkdp_auto_close = false
            vim.g.mkdp_open_to_the_world = false
            vim.g.mkdp_open_ip = "127.0.0.1"
            vim.g.mkdp_port = "8888"
            vim.g.mkdp_browser = "chromium-browser"
            vim.g.mkdp_echo_preview_url = true
            vim.g.mkdp_page_title = "${name}"
        end,
    },
    {
        "preservim/vim-markdown",
        ft = "markdown",
        config = function()
            vim.g.vim_markdown_folding_disabled        = 1
            vim.g.vim_markdown_no_default_key_mappings = 0
            vim.g.vim_markdown_conceal_code_blocks     = 0
            vim.g.vim_markdown_math                    = 1
            vim.g.vim_markdown_conceal = 1
            vim.g.vim_markdown_toc_autofit = 1
            vim.g.vim_markdown_follow_anchor = 0
        end,
    },
    {
        "epwalsh/obsidian.nvim",
        --lazy = true,
        event = { "BufReadPre /home/so/Dropbox/note/**.md" },
        ft = "markdown",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            dir = "/home/so/Dropbox/note",  -- no need to call 'vim.fn.expand' here
            completion = {
                nvim_cmp = true,
                min_chars = 1,
                -- Where to put new notes created from completion. Valid options are
                --  * "current_dir" - put new notes in same directory as the current buffer.
                --  * "notes_subdir" - put new notes in the default notes subdirectory.
                new_notes_location = "current_dir",

                -- Whether to add the output of the node_id_func to new notes in autocompletion.
                -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
                prepend_note_id = false
            },
        },
    },
}
