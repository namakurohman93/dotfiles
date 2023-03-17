local toggled = false

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>n", vim.cmd.Ex)

-- move within window
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>,", "<C-w>5<")
vim.keymap.set("n", "<leader>.", "<C-w>5>")
vim.keymap.set("n", "<leader>-", "<C-w>5-")
vim.keymap.set("n", "<leader>=", "<C-w>5+")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- vim.keymap.set("n", "<C-j>", "<C-d>zz")
-- vim.keymap.set("n", "<C-k>", "<C-u>zz")
vim.keymap.set("n", "<leader>/", "/\\c")
vim.keymap.set("n", "<leader>fn", vim.cmd.enew)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>tt", function()
    if toggled then
        toggled = false
        vim.diagnostic.config({
            virtual_text = false
        })
    else
        toggled = true
        vim.diagnostic.config({
            virtual_text = true
        })
    end
end)
