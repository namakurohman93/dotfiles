return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
    opt = true,
  },
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = true,
      -- theme = 'nord',
      section_separators = { left = '', right = '' },
      component_separators = '',
      globalstatus = true,
    },
    sections = {
      lualine_b = {},
      lualine_c = {
        {
          'filename',
          path = 1,
        },
      },
      -- lualine_x = { 'location' },
      lualine_y = {
        {
          'diagnostics',
          always_visible = true,
        },
        'diff',
        {
          'branch',
          icon = {
            -- '',
            '',
            align = 'right',
          },
        },
      },
      lualine_x = {
        -- {
        --   'fileformat',
        --   symbols = { Darwin = '' },
        --   fmt = function(_, cfg)
        --     local sysname = vim.loop.os_uname().sysname
        --     return cfg.symbols[sysname] or sysname
        --   end,
        -- },
        -- {
        --   'filetype',
        --   icon_only = true,
        -- },
        require('comment-mode').comment_mode_component,
      },
    },
  },
}
