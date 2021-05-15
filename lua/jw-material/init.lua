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

-- Load the colorscheme
require('material').set()

