local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup {
    pickers = {
        find_files = {
            hidden = true,
            file_ignore_patterns = {
                "node_modules", ".git"
            }
        }
    },
    extensions = {
        file_browser = {
            theme = "ivy",
            hijack_netrw = true,
        },
    },
}

telescope.load_extension "file_browser"

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', ':Telescope file_browser<CR><ESC>', {})
vim.keymap.set('n', '<leader>fa', ':Telescope git_files<CR>', {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Search in files: ") })
end)

vim.api.nvim_create_autocmd("FileType", { pattern = "TelescopeResults", command = [[setlocal nofoldenable]] })
