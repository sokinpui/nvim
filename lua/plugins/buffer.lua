return {
  {
    "j-morano/buffer_manager.nvim",
    keys = {
      -- {"<C-b>"},
      {"<Backspace>"},
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local opts = { noremap = true, silent = true }
      require("buffer_manager").setup({
        focus_alternate_buffer = true,
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        height = 24,
        width = 80,
        line_keys = "",
      })
      -- vim.keymap.set("n", "<C-b>", require("buffer_manager.ui").toggle_quick_menu, opts)
      vim.keymap.set("n", "<Backspace>", require("buffer_manager.ui").toggle_quick_menu, opts)
    end
  },
  {
    "ThePrimeagen/harpoon",
    keys = {
      "<leader>m",
      "<cr>",
    },
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()
      vim.keymap.set("n", "<leader>m", function() harpoon:list():add() end)
      vim.keymap.set("n", "<cr>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    end
  },
  -- {
  --   "cbochs/grapple.nvim",
  --   keys = {
  --     "<Enter>",
  --     "<leader>m",
  --     "<leader>a",
  --   },
  --   cmd = {
  --     "Grapple",
  --   },
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function ()
  --     local grapple = require("grapple")
  --     grapple.setup()
  --     vim.keymap.set("n", "<leader>m", function() grapple.tag() end, {})
  --     vim.keymap.set("n", "<leader>a", function() grapple.tag() end, {})
  --     vim.keymap.set("n", "<Enter>", function() grapple.open_tags() end, {})
  --   end
  -- },
}
