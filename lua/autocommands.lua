--[[
My auto commands
--]]

vim.cmd([[
    augroup Jpw_group
        autocmd!

        " Permanent sign column
        autocmd BufRead,BufNewFile * setlocal signcolumn=yes

        " Highlight on yank. See help:lua-highlight
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()

        " Markdown
        autocmd FileType markdown setlocal wrap
        autocmd FileType markdown setlocal spell spelllang=en_gb
    augroup END
]])

--Remap escape to leave terminal mode
vim.cmd([[
    augroup Terminal
        autocmd!
        autocmd TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
        autocmd TermOpen * set nonumber
    augroup end
]])

