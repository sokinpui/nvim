return {
  -- {
  --   "j-morano/buffer_manager.nvim",
  --   keys = {
  --     -- {"<C-b>"},
  --     {"<CR>"},
  --   },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   config = function()
  --     local opts = { noremap = true, silent = true }
  --     require("buffer_manager").setup({
  --       focus_alternate_buffer = true,
  --       borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
  --       height = 24,
  --       width = 80,
  --       short_term_names = true,
  --       line_keys = "1234567890",
  --       loop_nav = true
  --     })
  --     -- vim.keymap.set("n", "<C-b>", require("buffer_manager.ui").toggle_quick_menu, opts)
  --     vim.keymap.set("n", "<Cr>", require("buffer_manager.ui").toggle_quick_menu, opts)
  --   end
  -- },
  {
    "ThePrimeagen/harpoon",
    keys = {
      "<leader>m",
      "<leader>a",
      "<C-CR>",
      "<C-h>",
    },
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()
      vim.keymap.set("n", "<leader>m", function() harpoon:list():add() end)
      vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
      vim.keymap.set("n", "<C-CR>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
      vim.keymap.set("n", "<C-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

      vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<C-;>", function() harpoon:list():select(4) end)
      vim.keymap.set("n", "<leader><C-j>", function() harpoon:list():replace_at(1) end)
      vim.keymap.set("n", "<leader><C-k>", function() harpoon:list():replace_at(2) end)
      vim.keymap.set("n", "<leader><C-l>", function() harpoon:list():replace_at(3) end)
      vim.keymap.set("n", "<leader><C-;>", function() harpoon:list():replace_at(4) end)
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
