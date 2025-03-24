require('dap-go').setup({
    dap_configurations = {
        {
            type = 'go',
            name = 'Debug',
            request = 'launch',
            mode = 'debug',
            program = function()
                local current_file = vim.fn.expand('%:p')
                local cwd = vim.fn.getcwd()
                local root_dir = vim.fs.dirname(vim.fs.find({'main.go'}, {
                    upward = true,
                    stop = vim.loop.os_homedir(),
                    path = vim.fn.fnamemodify(current_file, ':h'),
                })[1] or cwd)
                return root_dir
            end,
            env = vim.fn.environ(),
        },
    },
})

local dap, dapui = require("dap"), require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"]=function()
  dapui.open()
end
dap.listeners.before.attach.dapui_config = function()
 dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
 dapui.open()
end
-- dap.listeners.before.event_terminated["dapui_config"]=function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"]=function()
--   dapui.close()
-- end

vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

vim.keymap.set('n', '<F5>', '<cmd>!source .env<CR><cmd>lua require("dap").continue()<CR>')
vim.keymap.set('n', '<F10>', require 'dap'.step_over)
vim.keymap.set('n', '<F11>', require 'dap'.step_into)
vim.keymap.set('n', '<F12>', require 'dap'.step_out)
vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)
vim.keymap.set('n', '<leader>dc', '<cmd>lua require("dapui").close()<CR>')
