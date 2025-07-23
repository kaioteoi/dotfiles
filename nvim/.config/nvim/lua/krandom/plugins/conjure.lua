return {
	-- Conjure!
	"Olical/conjure",
	dependencies = {
		-- Structural editing, optional
		"guns/vim-sexp",
		"tpope/vim-sexp-mappings-for-regular-people",
		"tpope/vim-repeat",
		"tpope/vim-surround",
		"julienvincent/nvim-paredit",
	},
	config = function()
		require("nvim-paredit").setup({
			indent = {
				enabled = true,
			},
		})
	end,
}
