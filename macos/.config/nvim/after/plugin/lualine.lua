require('lualine').setup({
    options = {
        icons_enabled = false,
        component_separators = { left = '│', right = '│' },
        section_separators = { left = '▌', right = '▐' },
        theme = 'dracula-nvim'
    },
    sections = {
        lualine_b = {'diff', 'diagnostics'},
    },
})
