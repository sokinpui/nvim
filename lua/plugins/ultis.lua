return {
  {
    "folke/neoconf.nvim",
    cmd = "Neoconf"
  },
  "folke/neodev.nvim",
  {
    "dstein64/vim-startuptime",
    keys = {
      { "<leader>S", "<Cmd>StartupTime<Cr>"}
    },
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },
  --"nathom/filetype.nvim",
  --{
  --  'stevearc/dressing.nvim',
  --  opts = {},
  --  config = function ()
  --    require('dressing').setup()
  --  end,
  --},
}
