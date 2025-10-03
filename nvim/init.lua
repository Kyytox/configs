-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.lsp.enable("pyright")

-- Separator of windows
vim.cmd([[
  highlight WinSeparator guibg=#0b0f15 guifg=#C40A0A
]])

local opt = vim.opt
opt.wrap = true
