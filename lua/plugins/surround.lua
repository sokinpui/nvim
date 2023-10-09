return {
  {
    "kylechui/nvim-surround",
    keys = {
      { "gs", mode = { "n", "v" }},
      { "gS", mode = { "n", "v" }},
      "ds",
      "cs",
      "<leader>~",
      "<leader>*",
      "<leader>$",
      "<leader>`",
      "<leader>>",
      "<leader><",
      "<leader>'",
      "<leader>\"",
      "<leader>}",
      "<leader>{",
      "<leader>]",
      "<leader>[",
      "<leader>)",
      "<leader>(",
    },
    config = function ()
      vim.cmd([[highlight default link NvimSurroundHighlight DiffChange]])
      require("nvim-surround").setup({
        keymaps = {
          insert = "<C-g>s",
          insert_line = "<C-g>S",
          normal = "gs",
          normal_cur = "gss",
          normal_line = "gS",
          normal_cur_line = "gSS",
          visual = "gs",
          visual_line = "gS",
          delete = "ds",
          change = "cs",
        },
      })
      vim.cmd([[
      nmap <leader>( gsiw(f)
      nmap <leader>) gsiw)f)
      nmap <leader>[ gsiw[f]
      nmap <leader>] gsiw]f]
      nmap <leader>{ gsiw{f}
      nmap <leader>} gsiw}f}
      nmap <leader>" gsiw"f"
      nmap <leader>' gsiw'f'
      nmap <leader>< gsiw<f>
      nmap <leader>> gsiw>f>
      nmap <leader>` gsiw`f`
      nmap <leader>$ gsiw$f$
      nmap <leader>* gsiw*f*
      nmap <leader>~ gsiw~f~
      ]])
    end
  }
}
