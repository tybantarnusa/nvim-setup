require("cursor-agent").setup({
  use_default_mappings = true,
  show_help_on_open = true,
  new_lines_amount = 2,
  window_width = 64,
})

-- Silent auto-reload when file changes on disk – works even in Terminal-mode
vim.o.autoread = true

-- Silent reload on change detection (no prompts)
vim.api.nvim_create_autocmd("FileChangedShell", {
    group = vim.api.nvim_create_augroup("SilentReload", { clear = true }),
    callback = function()
        if vim.bo.modified == false and vim.bo.modifiable then
            vim.cmd("silent! edit!")
        end
    end,
})

-- Subtle flash ONLY on changed lines after reload
vim.api.nvim_create_autocmd("FileChangedShellPost", {
    group = vim.api.nvim_create_augroup("ReloadFlash", { clear = true }),
    callback = function()
        -- Soft highlight colors (adjust to your taste / colorscheme)
        vim.api.nvim_set_hl(0, "ReloadFlashAdd",    { bg = "#283b2d" })  -- soft green for added lines
        vim.api.nvim_set_hl(0, "ReloadFlashChange", { bg = "#2d4f67" })  -- soft blue for changed lines
        vim.api.nvim_set_hl(0, "ReloadFlashDelete", { bg = "#4f2d3b" })  -- soft red for deleted lines

        local buf = 0  -- current buffer
        local ns = vim.api.nvim_create_namespace("reload_flash")

        -- Get current buffer content AFTER reload
        local new_lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

        -- Read the file directly from disk (this is the "old" version before reload)
        local filepath = vim.api.nvim_buf_get_name(buf)
        if filepath == "" then return end

        local file = io.open(filepath, "r")
        if not file then return end
        local old_content = file:read("*a")
        file:close()

        local old_lines = {}
        for line in old_content:gmatch("([^\n]*)\n?") do
            table.insert(old_lines, line)
        end

        -- Compute diff between old (disk before reload) and new (current buffer)
        local diff = vim.diff(table.concat(old_lines, "\n") .. "\n", table.concat(new_lines, "\n") .. "\n", {
            result_type = "indices",
            algorithm = "myers",  -- fast and good default
        }) or {}

        -- Highlight only the changed/added/deleted lines
        for _, change in ipairs(diff) do
            local old_start, old_count, new_start, new_count = change[1], change[2], change[3], change[4]

            local hl_group
            if old_count == 0 then
                -- Added lines
                hl_group = "ReloadFlashAdd"
            elseif new_count == 0 then
                -- Deleted lines – not present in new buffer, skip highlighting
                goto continue
            else
                -- Changed lines
                hl_group = "ReloadFlashChange"
            end

            -- Highlight the corresponding lines in the new buffer
            for i = 0, new_count - 1 do
                vim.api.nvim_buf_add_highlight(buf, ns, hl_group, new_start + i - 1, 0, -1)
            end

            ::continue::
        end

        -- Fade out the highlight after 800ms (feel free to adjust)
        vim.defer_fn(function()
            vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)
        end, 800)
    end,
})

-- Periodic background checktime (every 4 seconds) – works even in terminal mode
local timer = vim.loop.new_timer()
timer:start(4000, 4000, vim.schedule_wrap(function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
            vim.api.nvim_buf_call(buf, function()
                vim.cmd("silent! checktime")
            end)
        end
    end
end))
