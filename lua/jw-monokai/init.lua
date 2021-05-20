--[[
Config for plugin tanvirtin/monokai.nvim
See https://github.com/tanvirtin/monokai.nvim
--]]

local set = function ()
    vim.api.nvim_set_option('background', 'dark')
    vim.api.nvim_command([[colorscheme monokai]])
end

return { set = set }

