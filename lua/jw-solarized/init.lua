--[[
Config for plugin ishan9299/nvim-solarized-lua
See https://github.com/ishan9299/nvim-solarized-lua
--]]

local set = function ()
    vim.o.background = 'dark'
    vim.cmd('colorscheme solarized')
end

return { set = set }

