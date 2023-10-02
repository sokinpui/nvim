return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.config.lsp")
    end
  },
  {
    "williamboman/mason.nvim",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
      "MasonUpdate", -- AstroNvim extension here as well
      "MasonUpdateAll", -- AstroNvim specific
    },
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("mason-lspconfig").setup({
        -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
        -- This setting has no relation with the `automatic_installation` setting.
        ---@type string[]
        ensure_installed = {
          "lua_ls",
          "pyright",
          "jdtls",
        },

        -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
        -- This setting has no relation with the `ensure_installed` setting.
        -- Can either be:
        --   - false: Servers are not automatically installed.
        --   - true: All servers set up via lspconfig are automatically installed.
        --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
        --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
        ---@type boolean
        automatic_installation = false,

        -- See `:h mason-lspconfig.setup_handlers()`
        ---@type table<string, fun(server_name: string)>?
        handlers = nil,
      })
    end
  },
  {
    'mfussenegger/nvim-jdtls',
    ft = "java",
    config = function()
      local config = {
        cmd = {'/home/so/.local/share/nvim/mason/bin/jdtls'},
        root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
      }
      require('jdtls').start_or_attach(config)
    end
  }
}
