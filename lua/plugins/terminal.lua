return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function ()
      -- c-j to toggle terminal
      vim.keymap.set('n', '<space>tt', function() require("toggleterm").toggle() end, { noremap = true, silent = true })
    end
  }
}
