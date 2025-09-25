return {
    'julienvincent/nvim-paredit',
    config = function()
        require('nvim-paredit').setup {
            indent = {
                enabled = true,
            },
        }
    end,
}
