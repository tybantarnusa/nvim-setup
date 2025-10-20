-- Add additional capabilities supported by nvim-cmpautop
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = vim.lsp.config

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'pyright', 'lua_ls', 'ts_ls', 'gopls' }
for _, lsp in ipairs(servers) do
  lspconfig('lsp', {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  })
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
local lspkind = require('lspkind')
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sorting = {
    comparators = {
      cmp.config.compare.offset,        -- Prioritize items closer to cursor
      cmp.config.compare.exact,         -- Exact matches
      cmp.config.compare.score,         -- Score-based sorting
      cmp.config.compare.recently_used, -- Prioritize recently used items
      cmp.config.compare.locality,      -- Items closer in scope
      cmp.config.compare.kind,          -- Sort by kind (e.g., function vs variable)
      cmp.config.compare.sort_text,     -- Alphabetical sorting as fallback
    },
  },
  preselect = cmp.PreselectMode.None,
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50,
      ellipsis_char = '...',
      show_labelDetails = true,
    })
  }
}
