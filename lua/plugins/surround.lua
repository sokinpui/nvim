return {
  {
    "kylechui/nvim-surround",
    keys = {
      { "<c-s>", mode = { "n", "v" }},
      { "ds", mode = { "n", "v" }},
      { "cs", mode = { "n", "v" }},
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
          normal = "<c-s>",
          normal_cur = "<c-s>w",
          normal_line = "<c-s>l",
          normal_cur_line = "<c-s>S",
          visual = "<c-s>",
          visual_line = "<c-s>l",
          delete = "ds",
          change = "cs",
        },
      })
      vim.cmd([[
      nmap <leader>( <c-s>iw(
      nmap <leader>) <c-s>iw)
      nmap <leader>[ <c-s>iw[
      nmap <leader>] <c-s>iw]
      nmap <leader>{ <c-s>iw{
      nmap <leader>} <c-s>iw}
      nmap <leader>" <c-s>iw"
      nmap <leader>' <c-s>iw'
      nmap <leader>< <c-s>iw<
      nmap <leader>> <c-s>iw>
      nmap <leader>` <c-s>iw`
      nmap <leader>$ <c-s>iw$
      nmap <leader>* <c-s>iw*
      nmap <leader>~ <c-s>iw~

      vmap <leader>( <c-s>(
      vmap <leader>) <c-s>)
      vmap <leader>[ <c-s>[
      vmap <leader>] <c-s>]
      vmap <leader>{ <c-s>{
      vmap <leader>} <c-s>}
      vmap <leader>" <c-s>"
      vmap <leader>' <c-s>'
      vmap <leader>< <c-s><
      vmap <leader>> <c-s>>
      vmap <leader>` <c-s>`
      vmap <leader>$ <c-s>$
      vmap <leader>* <c-s>*
      vmap <leader>~ <c-s>~
      ]])
    end
  }
}
