return {
  {
    "ThePrimeagen/harpoon",
    keys = {
      {"<leader>a"},
      {"<leader>m"},
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")
      require("harpoon").setup()
      vim.keymap.set("n", "<leader>a", mark.add_file, { noremap = true, silent = true})
      -- vim.keymap.set("n", "<C-j>", ui.nav_next, { noremap = true, silent = true})
      -- vim.keymap.set("n", "<C-k>", ui.nav_prev, { noremap = true, silent = true})
      vim.keymap.set("n", "<leader>m", ui.toggle_quick_menu, { noremap = true, silent = true})
    end
  }
}
