return {
	'ThePrimeagen/harpoon',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local harpoon = require("harpoon")
		local mark = require ("harpoon.mark")
		local ui = require ("harpoon.ui")

		harpoon.setup()

		vim.keymap.set("n", "<leader>a", function() mark.add_file() end)
		vim.keymap.set("n", "<leader>e", function() ui.toggle_quick_menu() end)

		vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
		vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
		vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
		vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)
		vim.keymap.set("n", "<leader><C-h>", function() mark.set_current_at(1) end)
		vim.keymap.set("n", "<leader><C-j>", function() mark.set_current_at(2) end)
		vim.keymap.set("n", "<leader><C-k>", function() mark.set_current_at(3) end)
		vim.keymap.set("n", "<leader><C-l>", function() mark.set_current_at(4) end)
	end,
}
