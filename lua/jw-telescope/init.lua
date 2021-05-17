--[[
Config for plugin, nvim-telescope/telescope.nvim
See https://github.com/nvim-telescope/telescope.nvim
--]]

require'telescope'.setup {
    defaults = {
        layout_strategy = 'flex',    -- default is 'horizontal'
        scroll_strategy = 'cycle'
    }
}

