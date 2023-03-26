local telescope = require('telescope')
local builtin = require('telescope.builtin')
local fb_actions = require('telescope._extensions.file_browser.actions')

vim.keymap.set('n', '<leader>ff', function()
    vim.fn.system('git rev-parse --is-inside-work-tree')
    if vim.v.shell_error == 0 then
        builtin.git_files()
    else
        builtin.find_files()
    end
end)

vim.keymap.set('n', '<leader>fw', function ()
    builtin.grep_string({ search = vim.fn.input('Grep > ') })
end)

vim.keymap.set('n', '<leader>fl', function()
    builtin.buffers({ show_all_buffers = false })
end)

vim.keymap.set("n", "<leader>n", ":Telescope file_browser<cr>")

vim.keymap.set("n", "<leader>*", builtin.lsp_definitions)

vim.keymap.set("n", "<leader>ea", function()
    builtin.diagnostics({ bufnr = 0 })
end)

telescope.setup {
    extensions = {
        file_browser = vim.tbl_deep_extend('force', {
            path = '%:p:h',
            select_buffer = true,
            hijack_netrw = true,
            mappings = {
                ['n'] = {
                    ['ma'] = fb_actions.create,
                    ['mm'] = fb_actions.move,
                    ['md'] = fb_actions.remove,
                    ['mc'] = fb_actions.copy,
                    ['h'] = fb_actions.goto_parent_dir,
                },
            },
            initial_mode = 'normal',
            grouped = true,
            hide_parent_dir = true,
        }, require('telescope.themes').get_dropdown({
            previewer = false,
            borderchars = {
                { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
                prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
                results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
                preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
            },
            layout_config = {
                height = 59
            },
        })),
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = 'smart_case',        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
    }
}

telescope.load_extension('fzf')
telescope.load_extension('file_browser')
