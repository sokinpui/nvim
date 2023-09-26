return {
  {
    'SirVer/ultisnips',
    init = function()
      vim.g.UltiSnipsExpandTrigger = "<C-j>"
      vim.g.UltiSnipsJumpForwardTrigger = "<C-j>"
      vim.g.UltiSnipsJumpBackwardTrigger = "<C-k>"
    end
  },
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/cmp-buffer',
      'FelipeLema/cmp-async-path',
      'hrsh7th/cmp-nvim-lsp',
      --'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-calc',
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "lukas-reineke/cmp-under-comparator",
      "uga-rosa/cmp-dynamic",
      "hrsh7th/cmp-nvim-lua",
      -- 'onsails/lspkind-nvim',
      {
        "quangnguyen30192/cmp-nvim-ultisnips",
        config = function()
          -- optional call to setup (see customization section)
          require("cmp_nvim_ultisnips").setup{}
        end,
      },
    },
    config = function()
      require("plugins.config.nvim-cmp")
    end
  },
} 

