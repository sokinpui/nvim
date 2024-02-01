return {
  {
    "j-morano/buffer_manager.nvim",
    keys = {
      {"<c-b>"},
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
      vim.keymap.set("n", "<c-b>", require("buffer_manager.ui").toggle_quick_menu, opts)
    end
  },
  {
    "cbochs/grapple.nvim",
    keys = {
      {"<leader>m"},
      {"<leader>a"},
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
      require("grapple").setup({
        popup_options = {
          relative = "editor",
          width = 80,
          height = 12,
          style = "minimal",
          focusable = false,
          border = "single",
        },
      })
      local grapple = require("grapple")
      vim.keymap.set("n", "<leader>a", grapple.tag)
      vim.keymap.set("n", "<leader>m", grapple.popup_tags)
    end
  },
}
