-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

keymap.set("n", "<PageDown>", "20j", { noremap = true })
keymap.set("n", "<PageUp>", "20k", { noremap = true })

keymap.set("n", "<C-d>", "20j", { noremap = true })
keymap.set("n", "<C-u>", "20k", { noremap = true })

-- add INSERT mode with TAB
-- keymap.set("n", "<Tab>", "a", { noremap = true, silent = true, desc = "Next completion item" })
keymap.set("n", "<TAB>", ">>", { noremap = true, silent = true, desc = "Next completion item" })
keymap.set("n", "<S-TAB>", "<<", { noremap = true, silent = true, desc = "Next completion item" })

-- Return to first caractere not blank of the line
keymap.set("n", "<HOME>", "^^", { noremap = true, silent = true, desc = "Return to first non-blank character" })
keymap.set("v", "<HOME>", "^^", { noremap = true, silent = true, desc = "Return to first non-blank character" })

-- Configuration des touches pour toggleterm
keymap.set("n", "<F4>", "<cmd>ToggleTerm<cr>", { desc = "Toggle floating terminal" })

-- Config for Copilot
keymap.set(
	"i",
	"œ",
	"copilot#Accept()",
	{ expr = true, replace_keycodes = false, noremap = false, silent = true, desc = "Accept Copilot" }
)
vim.g.copilot_no_tab_map = true

keymap.set("i", "<F2>", "<Plug>(copilot-accept-word)", { noremap = false, silent = true, desc = "Accept Copilot word" })
keymap.set("i", "<F3>", "<Plug>(copilot-accept-line)", { noremap = false, silent = true, desc = "Accept Copilot line" })

-- go to definition
keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
