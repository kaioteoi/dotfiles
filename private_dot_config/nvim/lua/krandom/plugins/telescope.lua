return {
    'nvim-telescope/telescope.nvim',

    tag = '0.1.6',

    dependencies = {
        'nvim-lua/plenary.nvim'
    },

    config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)

        telescope.setup{
            defaults = {
                layout_strategy = 'horizontal',
                layout_config = {
                    width = 0.95,
                    height = 0.95,
                },
                path_display = {
                    smart = true
                }
            },
        }
    end,
}
