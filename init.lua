require('plugins')

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.scrolloff = 10

vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>go", ":DiffviewOpen<CR>")
vim.keymap.set("n", "<leader>gc", ":DiffviewClose<CR>")
vim.keymap.set("n", "<C-f>", ":!gofmt -w %<CR><CR>:e<CR>")

vim.g.airline_powerline_fonts = 1

require("oil").setup()
