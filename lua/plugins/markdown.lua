return {
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = "markdown",
        lazy = true,
        cmd = "MarkdownPreview"
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
        "'preservim/vim-markdown'",
        ft = "markdown",
        lazy = true,
        config = function()
            vim.g.vim_markdown_folding_disabled        = 1
            vim.g.vim_markdown_no_default_key_mappings = 0
            vim.g.vim_markdown_conceal_code_blocks     = 0
            vim.g.vim_markdown_math                    = 1
            vim.g.vim_markdown_toc_autofit = 1
        end,
    },
}
