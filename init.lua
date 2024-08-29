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
vim.keymap.set("n", "<leader>go", "<cmd>DiffviewOpen<CR>")
vim.keymap.set("n", "<leader>gc", "<cmd>DiffviewClose<CR>")
vim.keymap.set("n", "<leader>]", "<cmd>e %:h<CR>")
vim.keymap.set("n", "<leader>fb", '<cmd>lua require("buffer_manager.ui").toggle_quick_menu()<CR>')

vim.g.airline_powerline_fonts = 1

require("oil").setup()
