-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local compare = require 'cmp.config.compare'
local luasnip = require 'luasnip'
local lspkind = require 'lspkind'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    {
      name = 'nvim_lsp',
      entry_filter = function(entry)
        local kind = require('cmp.types').lsp.CompletionItemKind[entry:get_kind()]
        return kind ~= 'Text' and kind ~= 'Snippet'
      end,
      priority = 1000,
    },
    { name = 'buffer', keyword_length = 3, priority = 750 },
    { name = 'path', priority = 500 },
    { name = 'luasnip', priority = 250 },
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'text',
      maxwidth = 35,
      ellipsis_char = ' ..',
      menu = ({
        -- 
        nvim_lsp = '',
        luasnip = '󰘦',
        buffer = '󰈚',
        path = '',
      }),
    }),
  },
  sorting = {
    comparators = {
      compare.score,
      compare.kind,
      compare.length,
    },
  },
}
