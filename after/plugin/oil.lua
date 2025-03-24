local oil = require("oil")

local function get_oil_dir()
  -- Check if there's an active file buffer
  local buf = vim.api.nvim_get_current_buf()
  local buf_name = vim.api.nvim_buf_get_name(buf)

  -- If no file is open (empty buffer or no name), use the current working directory
  if buf_name == "" then
    return vim.fn.getcwd() -- Root directory (current working directory)
  else
    -- If a file is open, use its parent directory
    return vim.fn.fnamemodify(buf_name, ":h")
  end
end

oil.setup()

vim.keymap.set("n", "<leader>]", function()
  oil.open(get_oil_dir())
end, { desc = "Open Oil in dynamic directory" })
