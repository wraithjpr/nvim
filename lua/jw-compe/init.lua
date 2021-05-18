--[[
Config for plugin, hrsh7th/nvim-compe
See: https://github.com/hrsh7th/nvim-compe
--]]

require'compe'.setup({
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 3,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,
    source = {
        buffer = true,
        path = true,
        tags = true,
        spell = true,
        calc = false,
        nvim_lsp = true,
        nvim_lua = true,
        vsnip = false,
        ultisnips = false
    }
})
