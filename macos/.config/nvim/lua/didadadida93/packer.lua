-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'nvim-lua/plenary.nvim'

    use 'Mofiqul/dracula.nvim'

    use 'unblevable/quick-scope'

    use 'qpkorr/vim-bufkill'

    use { 'kylechui/nvim-surround', tag = '*' }

    use 'windwp/nvim-autopairs'

    use 'nvim-lualine/lualine.nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use 'ThePrimeagen/harpoon'

    use 'neovim/nvim-lspconfig'

    use 'JoosepAlviste/nvim-ts-context-commentstring'

    use 'terrortylor/nvim-comment'

    use { 'nvim-telescope/telescope.nvim', tag = '0.1.1' }

    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }

    use 'nvim-telescope/telescope-file-browser.nvim'

    use 'hrsh7th/nvim-cmp'

    use 'hrsh7th/cmp-nvim-lsp'

    use 'L3MON4D3/LuaSnip'

    use 'hrsh7th/cmp-path'

    use 'hrsh7th/cmp-nvim-lsp-signature-help'
end)
