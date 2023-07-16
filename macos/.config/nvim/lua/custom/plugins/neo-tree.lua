return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup({
      -- sources = {
      --   'filesystem',
      --   'buffers',
      --   'git_status',
      --   'document_symbols',
      -- },
      source_selector = {
        winbar = true,
        -- sources = {
        --   { source = 'filesystem' },
        --   { source = 'buffers' },
        --   { source = 'git_status' },
        --   { source = 'document_symbols' },
        -- },
      },
      close_if_last_window = true,
      window = {
        width = 31,
        mappings = {
          ['o'] = 'open',
          ['<c-x>'] = 'open_split',
          ['<c-v>'] = 'open_vsplit',
          ['i'] = 'open_split',
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        window = {
          mappings = {
            ['ma'] = {
              'add',
              config = { show_path = 'relative' },
            },
            ['md'] = 'delete',
            ['mm'] = {
              'move',
              config = { show_path = 'relative' },
            },
            ['mc'] = {
              'copy',
              config = { show_path = 'relative' },
            },
          }
        },
      },
      buffers = {
        follow_current_file = {
          enabled = true,
        },
      },
      git_status = {
        follow_current_file = {
          enabled = true,
        },
      },
      -- document_symbols = {},
    })
  end,
}
