-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local tel_built = require("telescope.builtin")
local comm = require("Comment.api")
local keymap = vim.keymap

-- Delete key SHIFT j (delete row above)
keymap.set("n", "J", "<nop>")

keymap.set("n", "<PageDown>", "20j", { noremap = true })
keymap.set("n", "<PageUp>", "20k", { noremap = true })

keymap.set("n", "<C-d>", "20j", { noremap = true })
keymap.set("n", "<C-u>", "20k", { noremap = true })

-- add INSERT mode with TAB
keymap.set("n", "<TAB>", ">>", { noremap = true, silent = true, desc = "Indent" })
keymap.set("v", "<TAB>", ">", { noremap = true, silent = true, desc = "Indent" })
keymap.set("n", "<S-TAB>", "<<", { noremap = true, silent = true, desc = "Unindent" })
keymap.set("v", "<S-TAB>", "<", { noremap = true, silent = true, desc = "Unindent" })

-- Return to first caractere not blank of the line
keymap.set("v", "<HOME>", "^^", { noremap = true, silent = true, desc = "Return to first non-blank character" })
keymap.set("n", "<HOME>", "^^", { noremap = true, silent = true, desc = "Return to first non-blank character" })

-- return start of line in normal mode
keymap.set("n", "à", "0", { noremap = true, silent = true, desc = "Start of Line" })
keymap.set("v", "à", "0", { noremap = true, silent = true, desc = "Start of Line" })

-- Configuration des touches pour toggleterm
keymap.set("n", "<F4>", "<cmd>ToggleTerm<cr>", { desc = "Toggle floating terminal" })

-------------------------
-- Copilot AI
-------------------------
keymap.set("i", "œ", "copilot#Accept()", { expr = true, replace_keycodes = false })
vim.g.copilot_no_tab_map = true
keymap.set("i", "Œ", "<Plug>(copilot-accept-word)")
keymap.set("i", "<F3>", "<Plug>(copilot-accept-line)")

-------------------------
-- Comments
-------------------------
keymap.set("n", "gc", "<Plug>(comment_toggle_linewise_current)", { desc = "Toggle Comment Line" })
keymap.set("v", "gc", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle Comment Visual" })
keymap.set("n", "gb", "<Plug>(comment_toggle_blockwise_current)", { desc = "Toggle Block Comment Line" })
keymap.set("v", "gb", "<Plug>(comment_toggle_blockwise_visual)", { desc = "Toggle Block Comment Visual" })
keymap.set("n", "go", comm.insert.linewise.below, { desc = "Comment Line Below" })
keymap.set("n", "gO", comm.insert.linewise.above, { desc = "Comment Line Above" })
keymap.set("n", "gA", comm.insert.linewise.eol, { desc = "Comment End Line" })

-------------------------
-- Color Picker
-------------------------
keymap.set("n", "<leader>cc", "<cmd>CccPick<cr>", { desc = "Color Picker" })

-------------------------
-- LSP
-------------------------
keymap.set("n", "gk", vim.lsp.buf.hover, { desc = "Show hover Information" })
keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "List Implementations" })
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format File" })

keymap.set("n", "grk", vim.lsp.buf.hover, { desc = "Show hover Information" })
keymap.set("n", "grd", vim.lsp.buf.definition, { desc = "Go to Definition" })
keymap.set("n", "grD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
keymap.set("n", "grr", vim.lsp.buf.references, { desc = "Go to References" })
keymap.set("n", "gri", vim.lsp.buf.implementation, { desc = "List Implementations" })
keymap.set("n", "grO", vim.lsp.buf.document_symbol, { desc = "Document Symbols" })
keymap.set("n", "grn", vim.lsp.buf.rename, { desc = "Rename" })

-------------------------
-- Telescope
-------------------------
keymap.set("n", "<leader>ff", tel_built.find_files, { desc = "Find Files" })
keymap.set("n", "<leader>fg", tel_built.live_grep, { desc = "Live Grep" })
keymap.set("n", "<leader>fb", tel_built.buffers, { desc = "Buffers" })
keymap.set("n", "<leader>fh", tel_built.help_tags, { desc = "Help Tags" })
keymap.set("n", "<leader>fv", tel_built.registers, { desc = "Registers" })
keymap.set("n", "<leader>fk", tel_built.keymaps, { desc = "Keymaps" })
keymap.set("n", "<leader>f:", tel_built.command_history, { desc = "Commands History" })

-------------------------
-- DB
-------------------------
keymap.set("n", "<leader>uB", "<leader>D", { desc = "Open DBUI" })
