--[[
Config for plugin, nvim-telescope/telescope.nvim
See https://github.com/nvim-telescope/telescope.nvim
--]]

require'telescope'.setup {
    defaults = {
        layout_strategy = 'flex',    -- default is 'horizontal'
        layout_config = {
            flex = { flip_columns = 111 }
        },
        scroll_strategy = 'cycle'
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = 'smart_case'
        }
    }
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

