return {
  {
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup({
        copy_sync = {
          enable = false,
        },
        navigation = {
          -- cycles to opposite pane while navigating into the border
          cycle_navigation = true,

          -- enables default keybindings (C-hjkl) for normal mode
          enable_default_keybindings = false,

          -- prevents unzoom tmux when navigating beyond vim border
          persist_zoom = false,
        },
        resize = {
          -- enables default keybindings (A-hjkl) for normal mode
          enable_default_keybindings = false,

          -- sets resize steps for x axis
          resize_step_x = 1,

          -- sets resize steps for y axis
          resize_step_y = 1,
        }
      })
      local opts = {silent = true, noremap = true}
      local tmux = require('tmux')
      -- navigation
      vim.keymap.set("n", "<A-h>", function () tmux.move_left() end, opts)
      vim.keymap.set("n", "<A-j>", function () tmux.move_bottom() end, opts)
      vim.keymap.set("n", "<A-k>", function () tmux.move_top() end, opts)
      vim.keymap.set("n", "<A-l>", function () tmux.move_right() end, opts)

      -- reisze
      vim.keymap.set("n", "<S-A-h>", function () tmux.resize_left() end, opts)
      vim.keymap.set("n", "<S-A-j>", function () tmux.resize_bottom() end, opts)
      vim.keymap.set("n", "<S-A-k>", function () tmux.resize_top() end, opts)
      vim.keymap.set("n", "<S-A-l>", function () tmux.resize_right() end, opts)

    end
  }
}
