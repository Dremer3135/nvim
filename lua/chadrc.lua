-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "onedark",

	hl_override = {
		RainbowDelimiterRed = { fg = "#e06c75" },
		RainbowDelimiterYellow = { fg = "#e5c07b" },
		RainbowDelimiterBlue = { fg = "#61afef" },
		RainbowDelimiterOrange = { fg = "#d19a66" },
		RainbowDelimiterGreen = { fg = "#98c379" },
		RainbowDelimiterViolet = { fg = "#c678dd" },
		RainbowDelimiterCyan = { fg = "#56b6c2" },
	},
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
