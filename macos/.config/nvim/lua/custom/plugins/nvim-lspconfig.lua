-- NOTE: This is where your plugins related to LSP can be installed.
--  The configuration is done below. Search for lspconfig to find it below.
return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    {
      'j-hui/fidget.nvim',
      tag = 'legacy',
      opts = {
        text = {
          done = '👀 ',
          spinner = 'moon',
        },
        fmt = {
          fidget = function(_, s)
            return string.format('Let it cook %s', s)
          end,
          task = function()
            return ''
          end,
        },
      },
    },

    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',
  },
}
