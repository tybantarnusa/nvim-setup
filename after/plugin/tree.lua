-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- vim.keymap.set('n', '<leader><leader>', '<cmd>NvimTreeToggle<cr>', defaults)
vim.keymap.set('n', '<C-,>', '<C-w><Left>', defaults)
vim.keymap.set('n', '<C-.>', '<C-w><Right>', defaults)
