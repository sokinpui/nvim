return {
  {
    "j-morano/buffer_manager.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local bufmag = require("buffer_manager.ui")
      local opts = { noremap = true, silent = true }
      require("buffer_manager").setup({
        line_keys = "1234567890",
        select_menu_item_commands = {
          edit = {
            key = "<CR>",
            command = "edit"
          }
        },
        focus_alternate_buffer = false,
        short_file_names = false,
        short_term_names = false,
        loop_nav = true,
        highlight = "",
        win_extra_options = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      })
      vim.keymap.set("n", "<leader>m", bufmag.toggle_quick_menu, opts)
    end
  },
}
