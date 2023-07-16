-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ 'n', 'v' }, 'H', '^', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'J', 'G', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'K', 'gg', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'L', '$', { silent = true })
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true })
vim.keymap.set('i', '<C-u>', '<Esc>viwuea', { silent = true, desc = 'Lowercase during insert mode' })
vim.keymap.set('i', '<C-U>', '<Esc>viwUea', { silent = true, desc = 'Uppercase during insert mode' })
vim.keymap.set('n', '<leader>c ', vim.cmd.CommentToggle, { silent = true, desc = 'Comment current line' })
vim.keymap.set('v', '<leader>c ', ":'<,'>CommentToggle<cr>", { silent = true, desc = 'Comment current visual selected' })
vim.keymap.set('n', '<leader>n', ':Neotree toggle<cr>', { silent = true, desc = 'Toggle [N]eotree' })
