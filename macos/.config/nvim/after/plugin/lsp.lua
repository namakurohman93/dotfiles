local cmp = require('cmp')
local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

lsp.setup_nvim_cmp({
    preselect = cmp.PreselectMode.None,
    select_behavior = cmp.SelectBehavior.Insert,
    completion = {
        completeopt = 'menu,menuone,noinsert,noselect',
        autocomplete = false,
    },
    mapping = cmp.mapping.preset.insert()
})


lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr}

  vim.keymap.set("n", "<leader>en", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "<leader>ep", function() vim.diagnostic.goto_prev() end, opts)
end)

lsp.nvim_workspace()
lsp.setup()
