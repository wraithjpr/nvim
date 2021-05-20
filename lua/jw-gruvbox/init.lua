--[[
Config for plugin npxbr/gruvbox.nvim
See https://github.com/npxbr/gruvbox.nvim
--]]

local set_gruvbox = function ()
    vim.api.nvim_set_option('background', 'dark')
    vim.api.nvim_command([[colorscheme gruvbox]])
end

return { set = set_gruvbox }

