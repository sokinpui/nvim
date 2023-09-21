return {
  "ggandor/flit.nvim",
  keys = { "f", "F", "t", "T" },
  dependencies = {
    "tpope/vim-repeat",
    "ggandor/leap.nvim",
  },
  config = function()
    require('flit').setup {
      keys = { f = 'f', F = 'F', t = 't', T = 'T' },
      -- A string like "nv", "nvo", "o", etc.
      labeled_modes = "v",
      multiline = true,
      -- Like `leap`s similar argument (call-specific overrides).
      -- E.g.: opts = { equivalence_classes = {} }
      opts = {}
    }
  end
}
