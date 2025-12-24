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

oil.setup({
    columns = {
        "icon",  -- Display file icons
        "size",  -- Display file size
        "mtime", -- Display last modified time
    },
    view_options = {
        show_hidden = true, -- Show hidden files
    },
    float = {
        preview_split = "right",
        win_options = {
            winblend = 10,
        },
    },
    skip_confirm_for_simple_edits = true,
})

vim.keymap.set("n", "<leader><leader>", function()
    -- Check if Oil is currently open in the current window
    local current_buf = vim.api.nvim_get_current_buf()
    local buf_type = vim.api.nvim_buf_get_option(current_buf, "filetype")
    if buf_type == "oil" then
        oil.close()               -- Close Oil if it's open
    else
        oil.open_float(get_oil_dir()) -- Open Oil if it's not
    end
end, { desc = "Toggle Oil in dynamic directory" })
