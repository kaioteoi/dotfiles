return {
	"mhartington/formatter.nvim",
	config = function()
		local util = require("formatter.util")
		require("formatter").setup({
			logging = true,
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				clojure = {
					function()
						return {
							exe = "cljfmt",
							args = {
								"--sort-ns-references",
								"--file-pattern",
								util.escape_path(util.get_current_buffer_file_path()),
								"fix",
							},
						}
					end,
				},
				-- Use the special "*" filetype for defining formatter configurations on
				-- any filetype
				["*"] = {
					-- "formatter.filetypes.any" defines default configurations for any
					-- filetype
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
