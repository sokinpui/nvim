local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require 'cmp'
local luasnip = require 'luasnip'
-- local lspkind = require('lspkind')

cmp.setup {

  preselect = cmp.PreselectMode.None,

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  formatting = {
    format = function(entry, vim_item)
      -- Source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnips = "[Snippet]",
      })[entry.source.name]
      return vim_item
    end
  },

  sources = {
    { name = "nvim_lsp_signature_help" },
    { name = "nvim_lsp"},
    { name = "luasnip" },
    { name = "async_path" },
    { name = "orgmode" },
    {
      name = "buffer",
      keyword_length = 1,
      option = {
        keyword_length = 4,
        --keyword_pattern = [[\k\+]],
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      }
    },
  },

  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      require "cmp-under-comparator".under,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },

  mapping = cmp.mapping.preset.insert({
    --["<C-y>"] = cmp.mapping.confirm(),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    ['<c-e>'] = cmp.mapping({
      i = function(fallback)
        cmp.close()
        fallback()
      end
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

cmp.setup.cmdline(':', {
  --completion = { autocomplete = false },
  sources = cmp.config.sources({
    { name = 'async_path' }
  }, {
    { name = 'cmdline' },
  }),
  enabled = function()
    -- Set of commands where cmp will be disabled
    local disabled = {
      --IncRename = true
    }
    -- Get first word of cmdline
    local cmd = vim.fn.getcmdline():match("%S+")
    -- Return true if cmd isn't disabled
    -- else call/return cmp.close(), which returns false
    return not disabled[cmd] or cmp.close()
  end
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
--require("luasnip.loaders.from_vscode").lazy_load()

require("luasnip.loaders.from_snipmate").lazy_load({ paths = { "~/.config/nvim/snipmates" } })

