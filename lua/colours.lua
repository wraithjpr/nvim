--[[
Config for plugin, marko-cerovac/material.nvim
See https://github.com/marko-cerovac/material.nvim
--]]

vim.g.material_style = 'deep ocean'
vim.g.material_italic_comments = true
vim.g.material_italic_keywords = true
vim.g.material_italic_functions = true
vim.g.material_italic_variables = false
vim.g.material_contrast = true
vim.g.material_borders = false
vim.g.material_disable_background = false

--[[
Config for colour scheme shaunsingh/moonlight.nvim
See https://github.com/shaunsingh/moonlight.nvim
--]]

vim.g.moonlight_italic_comments = true
vim.g.moonlight_italic_keywords = true
vim.g.moonlight_italic_functions = true
vim.g.moonlight_italic_variables = false
vim.g.moonlight_contrast = true
vim.g.moonlight_borders = false
vim.g.moonlight_disable_background = false

-- Load the colorscheme
--[[
require('jw-gruvbox').set()
require('material').set()
require('jw-monokai').set()
require('moonlight').set()
--]]
--[[
local theme = 'jw-gruvbox'
local theme = 'material'
local theme = 'jw-monokai'
local theme = 'moonlight'
--]]
require('moonlight').set()

