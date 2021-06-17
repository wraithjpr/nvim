--[[
Config for plugin, hoob3rt/lualine.nvim
See https://github.com/hoob3rt/lualine.nvim
--]]

--[[
local my_theme = 'gruvbox'
local my_theme = 'gruvbox_material'
local my_theme = 'material-nvim'
local my_theme = 'moonlight'
--]]
local my_theme = 'moonlight'

require('lualine').setup {
  options = { theme = my_theme }
}

