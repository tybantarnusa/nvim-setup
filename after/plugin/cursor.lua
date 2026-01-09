-- These are the default values; you can use `setup({})` to use defaults
require("cursor-agent").setup({
  use_default_mappings = true,
  show_help_on_open = true,
  new_lines_amount = 2,
  window_width = 64,
})

-- Auto-refresh buffers when files are changed externally (even in terminal mode)
vim.o.autoread = true

-- Check for file changes periodically and on focus
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "if mode() != 'c' | checktime | endif",
})

-- Also check when leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "checktime",
})

-- Set up a timer to check for changes every 2 seconds (works even in terminal mode)
local checktime_timer = vim.loop.new_timer()
checktime_timer:start(0, 2000, vim.schedule_wrap(function()
  if vim.fn.mode() ~= "c" then
    vim.cmd("checktime")
  end
end))

-- Enable window navigation in terminal mode
-- Exit terminal insert mode and execute window command
vim.keymap.set("t", "<C-w>h", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-w>j", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-w>k", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-w>l", "<C-\\><C-n><C-w>l")
vim.keymap.set("t", "<C-w>w", "<C-\\><C-n><C-w>w")
vim.keymap.set("t", "<C-w>p", "<C-\\><C-n><C-w>p")
vim.keymap.set("t", "<C-w><C-w>", "<C-\\><C-n><C-w>w")
