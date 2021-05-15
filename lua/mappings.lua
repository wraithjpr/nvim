--[[Key mappings
My personal preferences for key mappings
--]]

local keymap = vim.api.nvim_set_keymap

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

keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})

--[[
-- Leader. Default is '\'. To change timeout in ms, use :set timeoutlen.
vim.api.nvim_set_var('mapleader', t'<Space>')
vim.api.nvim_set_var('maplocalleader', t'<Space>')
--]]

-- Better Escape. If <S-CR> doesn't work, then <C-CR> may do.
keymap('n', '<CR>', 'i', {noremap = true, silent = true})
keymap('i', '<Esc>', '<Esc>`^', {noremap = true, silent = true})
keymap('v', '<Esc>', 'o<Esc>', {noremap = true, silent = true})
keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true, silent = true})

-- Remove highlighting
keymap('n', '<Space><Space>', ':noh<CR>', {noremap = true, silent = true})

-- better window movement
keymap('n', '<C-c>', '<C-w>c', {noremap = true, silent = true})
keymap('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
keymap('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
keymap('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
keymap('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})

-- Terminal window navigation
keymap('t', '<C-h>', '<C-\\><C-n><C-w>h', {noremap = true, silent = true})
keymap('t', '<C-j>', '<C-\\><C-n><C-w>j', {noremap = true, silent = true})
keymap('t', '<C-k>', '<C-\\><C-n><C-w>k', {noremap = true, silent = true})
keymap('t', '<C-l>', '<C-\\><C-n><C-w>l', {noremap = true, silent = true})

-- insert mode window navigation
keymap('i', '<C-h>', '<C-\\><C-n><C-w>h', {noremap = true, silent = true})
keymap('i', '<C-j>', '<C-\\><C-n><C-w>j', {noremap = true, silent = true})
keymap('i', '<C-k>', '<C-\\><C-n><C-w>k', {noremap = true, silent = true})
keymap('i', '<C-l>', '<C-\\><C-n><C-w>l', {noremap = true, silent = true})

-- resize with arrows
keymap('n', '<C-Up>', ':resize -2<CR>', {noremap = true, silent = true})
keymap('n', '<C-Down>', ':resize +2<CR>', {noremap = true, silent = true})
keymap('n', '<C-Left>', ':vertical resize +2<CR>', {noremap = true, silent = true})
keymap('n', '<C-Right>', ':vertical resize -2<CR>', {noremap = true, silent = true})

-- better indenting
keymap('v', '<', '<gv', {noremap = true, silent = true})
keymap('v', '>', '>gv', {noremap = true, silent = true})

-- Tab switch buffer
keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Quick write
keymap('n', '<M-f>s', ':w<CR>', {noremap = true})
keymap('i', '<M-f>s', '<C-\\><C-n>:w<CR>a', {noremap = true})

-- Quick exit (buffer)
keymap('n', '<M-f>c', ':bdelete<CR>', {noremap = true})
keymap('i', '<M-f>c', '<C-\\><C-n>:bdelete<CR>', {noremap = true})
keymap('n', '<M-f>x', ':xit<CR>', {noremap = true})
keymap('i', '<M-f>x', '<C-\\><C-n>:xit<CR>', {noremap = true})

-- External copy/paste
keymap('n', '<M-e>c', '"+y', {noremap = true})
keymap('n', '<M-e>p', '"+p', {noremap = true})
keymap('n', '<M-e>P', '"+P', {noremap = true})
keymap('n', '<M-y>', '"0y', {noremap = true})
keymap('n', '<M-p>', '"0p', {noremap = true})
keymap('n', '<M-P>', '"0P', {noremap = true})
keymap('i', '<M-e>p', '"+p', {noremap = true})
keymap('i', '<M-e>P', '"+P', {noremap = true})
keymap('i', '<M-p>', '"0p', {noremap = true})
keymap('i', '<M-P>', '"0P', {noremap = true})

