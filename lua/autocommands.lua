--[[
My auto commands
--]]

vim.cmd([[
    augroup Jpw_group
        autocmd!

        " Highlight on yank. See help:lua-highlight
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup END
]])

