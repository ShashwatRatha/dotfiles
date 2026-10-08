local keymap = vim.keymap.set

-- Navigation
keymap("n", "<C-h>", "<C-w>h", {silent = true})
keymap("n", "<C-j>", "<C-w>j", {silent = true})
keymap("n", "<C-k>", "<C-w>k", {silent = true})
keymap("n", "<C-l>", "<C-w>l", {silent = true})

-- Diagnostics
keymap("n", "dg", "<cmd>lua vim.diagnostic.open_float()<CR>")

-- Themes
keymap("n", "<leader>ts", "<cmd>lua RotateThemes()<CR>", { desc = "Toggle Theme" })

-- Debug (DAP)
keymap("n", "<F5>", function() require('dap').continue() end, { desc = "Debugger" } )
keymap("n", "<leader>b", function() require('dap').toggle_breakpoint() end, { desc = "Toggle breakpoint" })
keymap("n", "<leader>du", function() require('dapui').toggle() end, { desc = "Debugger UI toggle" })

-- Navigation (Telescope, Neo-tree)
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {desc = "Telescope findFiles"})
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {desc = "Telescope grep"})
keymap("n", "<leader>e", "<cmd>Neotree toggle<CR>", {desc = "Toggle filetree"})

-- LSP
keymap("n", "gd", vim.lsp.buf.definition)
keymap("n", "<leader>ih", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, {desc = "toggle inlay hints"})

-- Misc
keymap("n", "hn", "<cmd>nohlsearch<CR>", { desc = "remove search highlights" })
-- ========================================================================== --
-- ==                        COMPETITEST KEYMAPS                           == --
-- ========================================================================== --
keymap("n", "<leader>cr", "<cmd>CompetiTest run<CR>", { desc = "CP: Run test cases" })
keymap("n", "<leader>ca", "<cmd>CompetiTest add_testcase<CR>", { desc = "CP: Add custom testcase" })
keymap("n", "<leader>ce", "<cmd>CompetiTest edit_testcase<CR>", { desc = "CP: Edit testcases" })
keymap("n", "<leader>cd", "<cmd>CompetiTest delete_testcase<CR>", { desc = "CP: Delete testcase" })
keymap("n", "<leader>cp", "<cmd>CompetiTest receive problem<CR>", { desc = "CP: Listen for browser problem" })
keymap("n", "<leader>cc", "<cmd>CompetiTest receive contest<CR>", { desc = "CP: Listen for full contest" })

-- Maps Ctrl+k directly in Insert mode to expand or jump
vim.keymap.set({"i", "s"}, "<C-k>", function()
  local ls = require("luasnip")
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })
