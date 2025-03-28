-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { "catppuccin/nvim", as = "catppuccin" }
    use "rebelot/kanagawa.nvim"
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use 'tpope/vim-fugitive'
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use 'hrsh7th/nvim-cmp'         -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp'     -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip'         -- Snippets plugin
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'preservim/tagbar'
    use "sindrets/diffview.nvim"
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use({
        "cappyzawa/trim.nvim",
        config = function()
            require("trim").setup({})
        end
    })
    use 'f-person/git-blame.nvim'
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }
    use({
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup({})
        end,
    })
    use "onsails/lspkind.nvim"
    use {
        'Exafunction/codeium.vim',
        -- commit = "8d4e845f125731d2de7c3036ea83f4be031c4340",
        config = function()
            -- Change '<C-g>' here to any keycode you like.
            vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
            -- vim.keymap.set('i', '<M-;>', function() return vim.fn['codeium#CycleCompletions'](1) end,
            --     { expr = true, silent = true })
            -- vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
            --     { expr = true, silent = true })
            vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
        end
    }
    use { 'mistricky/codesnap.nvim', run = 'make' }
    use 'j-morano/buffer_manager.nvim'
    use 'karb94/neoscroll.nvim'
    use 'mfussenegger/nvim-dap'
    use 'leoluz/nvim-dap-go'
    use {
        "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap" }
    }
    use 'nvim-neotest/nvim-nio'
    use {
        "folke/todo-comments.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    }
    use {
        'Bekaboo/dropbar.nvim',
        requires = {
            'nvim-telescope/telescope-fzf-native.nvim',
            run = 'make'
        },
        config = function()
            local dropbar_api = require('dropbar.api')
            vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
            vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
            vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
        end
    }
    use {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                theme = 'hyper',
                config = {
                    week_header = {
                        enable = true,
                    },
                },
                shortcut = {},
            }
        end,
        requires = { 'nvim-tree/nvim-web-devicons' }
    }
end)
