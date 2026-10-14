vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- Ensure .NET SDK and tools are in Neovim PATH
vim.env.DOTNET_ROOT = vim.fn.expand "~/.dotnet"
local dotnet_bin = vim.fn.expand "~/.dotnet"
local dotnet_tools = vim.fn.expand "~/.dotnet/tools"
if not vim.env.PATH:find(dotnet_bin, 1, true) then
  vim.env.PATH = dotnet_bin .. ":" .. dotnet_tools .. ":" .. vim.env.PATH
end

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)
