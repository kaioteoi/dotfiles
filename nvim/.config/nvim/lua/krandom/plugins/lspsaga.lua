return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup {}
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },
    keys = {
        { 'cr', '<cmd>Lspsaga rename<cr>' },
    },
}
