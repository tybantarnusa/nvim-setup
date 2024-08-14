-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/mac/.cache/nvim/packer_hererocks/2.1.1716656478/share/lua/5.1/?.lua;/Users/mac/.cache/nvim/packer_hererocks/2.1.1716656478/share/lua/5.1/?/init.lua;/Users/mac/.cache/nvim/packer_hererocks/2.1.1716656478/lib/luarocks/rocks-5.1/?.lua;/Users/mac/.cache/nvim/packer_hererocks/2.1.1716656478/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/mac/.cache/nvim/packer_hererocks/2.1.1716656478/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["buffer_manager.nvim"] = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/buffer_manager.nvim",
    url = "https://github.com/j-morano/buffer_manager.nvim"
  },
  catppuccin = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["codeium.vim"] = {
    config = { "\27LJ\2\n-\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\19codeium#Accept\afn\bvim;\0\0\3\0\3\0\0056\0\0\0009\0\1\0009\0\2\0)\2\1\0D\0\2\0\29codeium#CycleCompletions\afn\bvim;\0\0\3\0\3\0\0056\0\0\0009\0\1\0009\0\2\0)\2ÿÿD\0\2\0\29codeium#CycleCompletions\afn\bvim,\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\18codeium#Clear\afn\bvimü\1\1\0\6\0\16\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0003\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0003\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0003\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0003\4\14\0005\5\15\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\texpr\2\0\n<c-x>\1\0\2\vsilent\2\texpr\2\0\n<c-,>\1\0\2\vsilent\2\texpr\2\0\n<c-;>\1\0\2\vsilent\2\texpr\2\0\n<C-g>\6i\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/codeium.vim",
    url = "https://github.com/Exafunction/codeium.vim"
  },
  ["codesnap.nvim"] = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/codesnap.nvim",
    url = "https://github.com/mistricky/codesnap.nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neoscroll.nvim"] = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["oil.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\boil\frequire\0" },
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/oil.nvim",
    url = "https://github.com/stevearc/oil.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  tagbar = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/tagbar",
    url = "https://github.com/preservim/tagbar"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["trim.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ttrim\frequire\0" },
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/trim.nvim",
    url = "https://github.com/cappyzawa/trim.nvim"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/vim-airline",
    url = "https://github.com/vim-airline/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/vim-airline-themes",
    url = "https://github.com/vim-airline/vim-airline-themes"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/mac/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: oil.nvim
time([[Config for oil.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\boil\frequire\0", "config", "oil.nvim")
time([[Config for oil.nvim]], false)
-- Config for: trim.nvim
time([[Config for trim.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ttrim\frequire\0", "config", "trim.nvim")
time([[Config for trim.nvim]], false)
-- Config for: codeium.vim
time([[Config for codeium.vim]], true)
try_loadstring("\27LJ\2\n-\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\19codeium#Accept\afn\bvim;\0\0\3\0\3\0\0056\0\0\0009\0\1\0009\0\2\0)\2\1\0D\0\2\0\29codeium#CycleCompletions\afn\bvim;\0\0\3\0\3\0\0056\0\0\0009\0\1\0009\0\2\0)\2ÿÿD\0\2\0\29codeium#CycleCompletions\afn\bvim,\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\18codeium#Clear\afn\bvimü\1\1\0\6\0\16\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0003\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0003\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0003\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0003\4\14\0005\5\15\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\texpr\2\0\n<c-x>\1\0\2\vsilent\2\texpr\2\0\n<c-,>\1\0\2\vsilent\2\texpr\2\0\n<c-;>\1\0\2\vsilent\2\texpr\2\0\n<C-g>\6i\bset\vkeymap\bvim\0", "config", "codeium.vim")
time([[Config for codeium.vim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
