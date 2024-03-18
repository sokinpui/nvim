return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = false,
          auto_trigger = true,
        },
        panel = { enabled = false },
      })

    --   require("copilot").setup({
    --     panel = {
    --       enabled = true,
    --       auto_refresh = true,
    --     },
    --     suggestion = {
    --       enabled = false,
    --       auto_trigger = true,
    --       -- accept = false, -- disable built-in keymapping
    --       keymap = {
    --         accept = "<C-l>",
    --         accept_word = false,
    --         accept_line = false,
    --         next = "<M-]>",
    --         prev = "<M-[>",
    --         dismiss = "<C-]>",
    -- },
    --     },
    --   })
    --    -- hide copilot suggestions when cmp menu is open
    --   -- to prevent odd behavior/garbled up suggestions
    --   local cmp_status_ok, cmp = pcall(require, "cmp")
    --   if cmp_status_ok then
    --     cmp.event:on("menu_opened", function()
    --       vim.b.copilot_suggestion_hidden = true
    --     end)
    --
    --     cmp.event:on("menu_closed", function()
    --       vim.b.copilot_suggestion_hidden = false
    --     end)
    --   end

    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cmd = "CopilotChat",
    opts = {
      show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
      debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
      disable_extra_info = 'no', -- Disable extra information (e.g: system prompt) in the response.
      language = "English" -- Copilot answer language settings when using default prompts. Default language is English.
      -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
      -- temperature = 0.1,
    },
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
    event = "VeryLazy",
    keys = {
      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      {
        "<leader>ccT",
        "<cmd>CopilotChatVsplitToggle<cr>",
        desc = "CopilotChat - Toggle Vsplit", -- Toggle vertical split
      },
      {
        "<leader>ccv",
        ":CopilotChatVisual",
        mode = "x",
        desc = "CopilotChat - Open in vertical split",
      },
      {
        "<leader>ccx",
        ":CopilotChatInPlace<cr>",
        mode = "x",
        desc = "CopilotChat - Run in-place code",
      },
      {
        "<leader>ccf",
        "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
        desc = "CopilotChat - Fix diagnostic",
      },
      {
        "<leader>ccr",
        "<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
        desc = "CopilotChat - Reset chat history and clear buffer",
      }
    },
  },
}
