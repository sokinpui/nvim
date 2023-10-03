-- Auto completion and Snippets
return {
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "FelipeLema/cmp-async-path",
      "lukas-reineke/cmp-under-comparator",

      -- LSP
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",

      -- Snippets
      "saadparwaiz1/cmp_luasnip",
      {
        "L3MON4D3/LuaSnip",
        --dependencies = { "rafamadriz/friendly-snippets" },
        config = function ()
          --require("luasnip.loaders.from_vscode").lazy_load()
        end
      },
    },
    config = function()
      require("plugins.config.nvim-cmp")
    end
  },
  {
    "smjonas/snippet-converter.nvim",
    cmd = "ConvertSnippets",
    config = function()
      local template = {
        -- name = "t1", (optionally give your template a name to refer to it in the `ConvertSnippets` command)
        sources = {
          ultisnips = {
            vim.fn.stdpath("config") .. "/UltiSnips",
          },
        },
        output = {
          -- Specify the output formats and paths
          snipmate = {
            vim.fn.stdpath("config") .. "/snipmates",
          },
        },
      }

      require("snippet_converter").setup {
        templates = { template },
      }
    end
  }
}

