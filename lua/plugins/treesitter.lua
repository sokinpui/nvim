return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function ()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        -- 安装 language parser
        -- :TSInstallInfo 命令查看支持的语言
        ensure_installed = {
          "html",
          "css",
          "vim",
          "lua",
          "javascript",
          "typescript",
          "python",
          "c",
          "java",
          "julia",
          "query",
          "markdown",
          "org",
          "bash",
        },
        -- 启用代码高亮功能
        highlight = {
          enable = true,
          --additional_vim_regex_highlighting = false
          additional_vim_regex_highlighting = { "markdown", "org" },
        },
        -- 启用增量选择
        incremental_selection = {
          enable = true,
          keymaps = {
            --- init_selection = '<TAB>',
            node_incremental = '<TAB>',
            node_decremental = '<S-TAB>',
            --- scope_incremental = '<TAB>',
          }
        },
        -- 启用基于Treesitter的代码格式化(=) . NOTE: This is an experimental feature.
        indent = {
          enable = false
        },
        matchup = {
          enable = true,              -- mandatory, false will disable the whole extension
          disable = {},  -- optional, list of language that will be disabled
          -- [options]
        },
      })
      vim.wo.foldmethod = 'expr'
      vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
      ---- 默认不要折叠
      ---- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
      vim.wo.foldlevel = 99
      vim.g.foldlevelstart = 99
      vim.opt.foldenable = false
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = { "BufReadPost", "BufNewFile" },
    config = function ()
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
        },
      })
    end
  }

  --{
  --  'kevinhwang91/nvim-ufo',
  --  dependencies = {
  --    'kevinhwang91/promise-async'
  --  },
  --  config = function ()
  --    require('ufo').setup({
  --      provider_selector = function(bufnr, filetype, buftype)
  --        return {'treesitter', 'indent'}
  --      end
  --    })
  --  end
  --}
}
