-- Mason setup (single call, moved to top)
require("mason").setup()

-- Mason-lspconfig to auto-install and enable servers
require("mason-lspconfig").setup {
    ensure_installed = { "gopls", "lua_ls", "pyright", "ts_ls" },
    handlers = {
        -- Default handler: Enable all servers with nvim-lspconfig defaults
        function(server_name)
            vim.lsp.enable(server_name)
        end,
        -- Custom overrides for specific servers
        ["gopls"] = function()
            vim.lsp.config("gopls", {
                settings = {
                    gopls = {
                        analyses = {
                            ST1000 = false,
                            ST1003 = false,
                            unusedparams = true,
                        },
                        staticcheck = true,
                        gofumpt = true,
                    },
                },
            })
            vim.lsp.enable("gopls")
        end,
        ["ts_ls"] = function()
            vim.lsp.config("tsserver", {
                init_options = {
                    preferences = {
                        importModuleSpecifierPreference = "relative",
                        importModuleSpecifierEnding = "minimal",
                    },
                },
            })
            vim.lsp.enable("tsserver")
        end,
        ["pyright"] = function()
            vim.lsp.config("pyright", {
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "off",
                        },
                    },
                },
            })
            vim.lsp.enable("pyright")
        end,
    },
}

-- Global diagnostics and keymaps
vim.diagnostic.config { -- Optional: Customize diagnostics
    virtual_text = true,
    float = { border = "rounded" },
}
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })

-- LSP attach keymaps
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc" -- Completion trigger
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<space>f", function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

-- Todo-comments setup (unchanged)
require("todo-comments").setup {
    keywords = {
        TODO = { icon = " ", color = "warning" },
    },
}
