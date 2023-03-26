local cmp = require('cmp')
local luasnip = require('luasnip')
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local handlers = {
    ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = 'rounded',
    }),
    ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = 'rounded',
    }),
}

local function lsp_attach(_, bufnr)
    local opts = { remap = false, silent = true, buffer = bufnr }

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>en', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>ep', vim.diagnostic.goto_prev, opts)
end

lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = {'vim'},
            },
        },
    },
    capabilities = capabilities,
    handlers = handlers,
    on_attach = lsp_attach,
})

lspconfig.tsserver.setup({
    capabilities = capabilities,
    handlers = handlers,
    on_attach = lsp_attach,
})

vim.diagnostic.config({
    virtual_text = false,
    underline = false,
    float = {
        border = 'rounded'
    }
})

cmp.setup({
    completion = {
        autocomplete = false
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        documentation = cmp.config.window.bordered({
            border = { '┌', '─', '┐', '│', '┘', '─', '└', '│'}
        }),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-6),
        ['<C-d>'] = cmp.mapping.scroll_docs(6),
        ['<Esc>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.close()
            else
                fallback()
            end
        end, { 'i' }),
        ['<C-n>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1

            if cmp.visible() then
                cmp.select_next_item()
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                fallback()
            else
                cmp.complete()
            end
        end, { 'i', 's' }),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
    },
})
