vim.g.codeium_disable_bindings = 1
vim.keymap.set('i', '<C-]>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
vim.keymap.set('n', '<leader>`', function() return vim.fn['codeium#Chat']() end, { expr = true, silent = true })
