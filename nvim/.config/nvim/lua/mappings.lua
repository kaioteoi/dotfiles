require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "telescope document symbols" })
map("n", "<leader>fS", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { desc = "telescope workspace symbols" })

map("n", "]c", function()
  if vim.wo.diff then
    vim.cmd.normal({ "]c", bang = true })
  else
    require("gitsigns").nav_hunk("next")
  end
end, { desc = "Git goto next hunk" })
map("n", "[c", function()
  if vim.wo.diff then
    vim.cmd.normal({ "[c", bang = true })
  else
    require("gitsigns").nav_hunk("prev")
  end
end, { desc = "Git goto prev hunk" })

map("n", "<leader>gb", function()
  require("gitsigns").blame_line()
end, { desc = "Git blame line" })
map("n", "<leader>gB", function()
  require("gitsigns").toggle_current_line_blame()
end, { desc = "Git toggle line blame" })
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Git reset hunk" })
map("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>", { desc = "Git reset buffer" })
map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Git stage hunk" })
map("n", "<leader>gS", "<cmd>Gitsigns stage_buffer<CR>", { desc = "Git stage buffer" })
map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "Git undo stage hunk" })
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Git preview hunk" })
