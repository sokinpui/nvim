local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- local has_words_before = function()
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end
local has_words_before = function()
  unpack = unpack or table.unpack
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

local cmp = require 'cmp'
local luasnip = require 'luasnip'
-- local lspkind = require('lspkind')

cmp.setup {

  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },

  preselect = cmp.PreselectMode.None,

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  sources = {
    { name = "nvim_lsp_signature_help" },
    -- { name = "copilot", group_index = 2 },
    {
      name = "copilot",
      keyword_length = 0,
    },
    { name = "nvim_lsp"},
    { name = "luasnip" },
    { name = "path" },
    { name = "orgmode" },
    {
      name = "buffer",
      keyword_length = 1,
      option = {
        keyword_length = 3,
        --keyword_pattern = [[\k\+]],
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      }
    },
  },

  sorting = {
    priority_weight = 2,
    comparators = {
      require("copilot_cmp.comparators").prioritize,

      -- cmp.config.compare.offset,
      -- cmp.config.compare.exact,
      -- cmp.config.compare.score,
      -- require "cmp-under-comparator".under,
      -- cmp.config.compare.kind,
      -- cmp.config.compare.sort_text,
      -- cmp.config.compare.length,
      -- cmp.config.compare.order,

      -- Below is the default comparitor list and order for nvim-cmp
      cmp.config.compare.offset,
      -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },

  mapping = cmp.mapping.preset.insert({
    --["<C-y>"] = cmp.mapping.confirm(),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    --['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    --['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    ['<c-e>'] = cmp.mapping({
      i = function(fallback)
        cmp.close()
        fallback()
      end,
      c = function(fallback)
        cmp.close()
        fallback()
      end
    }),
    ["<CR>"] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() and cmp.get_active_entry() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
        else
          fallback()
        end
      end,
      -- s = cmp.mapping.confirm({ select = true }),
      c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
    }),
    ["<Tab>"] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
        -- if cmp.visible() and has_words_before() then
        --   cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        -- else
        --   fallback()
        -- end
      end,
      c = function(_)
        if cmp.visible() then
          if #cmp.get_entries() == 1 then
            cmp.confirm({ select = true })
          else
            cmp.select_next_item()
          end
        else
          cmp.complete()
          if #cmp.get_entries() == 1 then
            cmp.confirm({ select = true })
          end
        end
      end,
    }),
    ["<S-Tab>"] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
        else
          fallback()
        end
      end,
    }),
    ['<C-n>'] = cmp.mapping({
      c = function()
        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
        end
      end,
      i = function(fallback)
        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    }),
    ['<C-p>'] = cmp.mapping({
      c = function()
        if cmp.visible() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
        else
          vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
        end
      end,
      i = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
        else
          fallback()
        end
      end
    }),
  }),
}

for _, cmd_type in ipairs({'/', '?'}) do
  cmp.setup.cmdline(cmd_type, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      {
        name = 'buffer',
        keyword_length = 1,
        option = {
          keyword_length = 4,
        }
      }
    }
  })
end

local function send_wildchar()
  local char = vim.fn.nr2char(vim.opt.wildchar:get())
  local key = vim.api.nvim_replace_termcodes(char, true, false, true)
  vim.api.nvim_feedkeys(key, "nt", true)
end
cmp.setup.cmdline(":", {
  mapping = {
    ["<Tab>"] = {c = send_wildchar}
  },
  sources = cmp.config.sources({})
})

-- Snippet
vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if luasnip.expand_or_locally_jumpable() then
    luasnip.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({"i", "s"}, "<C-k>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, {silent = true})

luasnip.config.set_config({
  store_selection_keys = '<C-j>',
  history = true, --keep around last snippet local to jump back
  updateevents = "TextChanged,TextChangedI",
})

-- Predefined snippet

require("luasnip.loaders.from_snipmate").lazy_load({ paths = { "~/.config/nvim/snipmates" } })

-- completion ui config
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg ="#6CC644"})
vim.api.nvim_set_hl(0, 'FloatBorder', { link = 'Normal' }) -- line to fix de background color border

