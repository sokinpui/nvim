return {
  {
    "kylechui/nvim-surround",
    keys = {
      { "gs", mode = { "n", "v" }},
      { "gS", mode = { "n", "v" }},
      "ds",
      "cs",
      { "<leader>~", mode = { "n", "v" }},
      { "<leader>*", mode = { "n", "v" }},
      { "<leader>$", mode = { "n", "v" }},
      { "<leader>`", mode = { "n", "v" }},
      { "<leader>>", mode = { "n", "v" }},
      { "<leader><", mode = { "n", "v" }},
      { "<leader>'", mode = { "n", "v" }},
      { "<leader>\"", mode = { "n", "v" }},
      { "<leader>}", mode = { "n", "v" }},
      { "<leader>{", mode = { "n", "v" }},
      { "<leader>]", mode = { "n", "v" }},
      { "<leader>[", mode = { "n", "v" }},
      { "<leader>)", mode = { "n", "v" }},
      { "<leader>(", mode = { "n", "v" }},
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

      vmap <leader>( gs(
      vmap <leader>) gs)
      vmap <leader>[ gs[
      vmap <leader>] gs]
      vmap <leader>{ gs{
      vmap <leader>} gs}
      vmap <leader>" gs"
      vmap <leader>' gs'
      vmap <leader>< gs<
      vmap <leader>> gs>
      vmap <leader>` gs`
      vmap <leader>$ gs$
      vmap <leader>* gs*
      vmap <leader>~ gs~
      ]])
    end
  }
}
