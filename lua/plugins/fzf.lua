return {
  --{
  --  'junegunn/fzf.vim',
  --  dependencies = {
  --    { "junegunn/fzf", build = "./install --bin" }
  --  },
  --  keys = {
  --    {"<leader>f"},
  --    {"<C-p>"},
  --    {"<C-f>"},
  --    {"<C-l>"},
  --  },
  --  cmd = {
  --    "Files",
  --    "GFiles",
  --    "Buffers",
  --    "Colors",
  --    "Ag",
  --    "Rg",
  --    "RG",
  --    "Lines",
  --    "BLines",
  --    "Tags",
  --    "BTags",
  --    "Marks",
  --    "Jumps",
  --    "Windows",
  --    "Locate",
  --    "History",
  --    "Snippets",
  --    "Commits",
  --    "BCommits",
  --    "Commands",
  --    "Maps",
  --    "Helptags",
  --    "Filetypes",
  --  },
  --  build = "./install --all",
  --  config = function()
  --    vim.cmd([[
  --    let g:fzf_preview_window = [ 'right,55%', 'ctrl-/' ]
  --    let g:fzf_layout         = {'window': { 'width': 0.95, 'height': 1 }}
  --    let g:fzf_buffers_jump   = 1
  --    let g:fzf_history_dir = '~/.local/share/fzf-history'
  --
  --    nnoremap <C-f> <Cmd>Files<cr>
  --    "nnoremap <leader>ff <Cmd>execute 'Files' system('git rev-parse --show-toplevel 2> /dev/null')[:-2]<cr>
  --    nnoremap <leader>ff <Cmd>GFiles<Cr>
  --
  --    nnoremap <C-l> <Cmd>Lines<cr>
  --
  --    nnoremap <C-p> <Cmd>Rg<cr>
  --
  --    nnoremap <leader>fo <Cmd>History<cr>
  --
  --    nnoremap <leader>fm <Cmd>Marks<cr>
  --
  --    nnoremap <leader>fh <Cmd>Helptags<cr>
  --    nnoremap <leader>fc <Cmd>Commands<cr>
  --
  --    "insert relative path of file in project
  --    " inoremap <expr> <C-l> fzf#vim#complete#path('fd --type=file . $(git rev-parse --show-cdup 2> /dev/null)')
  --    " inoremap <expr> <C-f> fzf#vim#complete#path('fd --type=file . $(git rev-parse --show-toplevel 2> /dev/null)')
  --    ]])
  --  end,
  --},
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      {"<C-f>"},
      {"<C-p>"},
      {"<C-l>"},
      {"<leader><C-f>"},
      {"<leader>f"},
    },
    cmd = "FzfLua",
    config = function()
      local actions = require "fzf-lua.actions"
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({
        global_file_icons    = false,
        winopts = {
          height = 1,
          width = 0.95,
          preview = {
            horizontal     = 'down:55%'
          }
        },
        fzf_opts = {
          ['--history'] = vim.fn.stdpath("data") .. '/fzf-lua-history',
        },
        hls = {
          cursorline = "Search",
          buf_name = "Normal"
        },
        actions = {
          -- These override the default tables completely
          -- no need to set to `false` to disable an action
          -- delete or modify is sufficient
          files = {
            -- providers that inherit these actions:
            --   files, git_files, git_status, grep, lsp
            --   oldfiles, quickfix, loclist, tags, btags
            --   args
            -- default action opens a single selection
            -- or sends multiple selection to quickfix
            -- replace the default action with the below
            -- to open all files whether single or multiple
            -- ["default"]     = actions.file_edit,
            ["default"]     = actions.file_edit_or_qf,
            ["ctrl-s"]      = actions.file_split,
            ["ctrl-v"]      = actions.file_vsplit,
            ["ctrl-t"]      = actions.file_tabedit,
            ["ctrl-q"]       = actions.file_sel_to_qf,
            ["alt-l"]       = actions.file_sel_to_ll,
          },
          buffers = {
            -- providers that inherit these actions:
            --   buffers, tabs, lines, blines
            ["default"]     = actions.buf_edit,
            ["ctrl-s"]      = actions.buf_split,
            ["ctrl-v"]      = actions.buf_vsplit,
            ["ctrl-t"]      = actions.buf_tabedit,
            ["ctrl-q"]       = actions.file_sel_to_qf,
          }
        },
      })
      local opts = {silent = true, noremap = true}
      local fzf = require('fzf-lua')
      vim.keymap.set("n", "<C-f>", function () fzf.files() end, opts)
      vim.keymap.set("n", "<C-p>", function () fzf.grep_project() end, opts)
      vim.keymap.set("n", "<C-l>", function () fzf.lines() end, opts)

      vim.keymap.set("n", "<leader>fh", function () fzf.help_tags() end, opts)
      vim.keymap.set("n", "<leader>fm", function () fzf.marks() end, opts)
      vim.keymap.set("n", "<leader>fo", function () fzf.oldfiles() end, opts)
      vim.keymap.set("n", "<leader>ff", function () fzf.git_files() end, opts)
      vim.keymap.set("n", "<leader>fc", function () fzf.commands() end, opts)

      --vim.keymap.set("t", "<C-v>", "<C-\\><C-n>\"+pA", opts)
    end
  }
}
