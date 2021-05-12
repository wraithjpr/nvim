--[[Key mappings
My personal preferences for key mappings
--]]

--[[
A better <TAB> that takes into account popup menus
Equivalent to:
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

See https://github.com/nanotee/nvim-lua-guide#vimapinvim_replace_termcodes
--]]
local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
end

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})

