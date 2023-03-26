require('nvim_comment').setup({
    create_mappings = false,
    comment_empty = false,
    hook = function()
        require("ts_context_commentstring.internal").update_commentstring()
    end,
})

vim.keymap.set("n", "<leader>c ", vim.cmd.CommentToggle)
vim.keymap.set("v", "<leader>c ", ":'<,'>CommentToggle<cr>")
