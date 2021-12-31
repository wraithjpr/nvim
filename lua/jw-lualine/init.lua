--[[
Config for plugin, hoob3rt/lualine.nvim
See https://github.com/hoob3rt/lualine.nvim
--]]

require('lualine').setup({
    options = {theme = 'github'},
    sections = { lualine_c = { { 'filename', path = 1 } } } -- 1: Relative path
})

