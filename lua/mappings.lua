--[[Key mappings
My personal preferences for key mappings
--]]

local keymap = vim.api.nvim_set_keymap

--[[
A better <TAB> that takes into account popup menus and compe completion menus.
Equivalent to:
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

See:
 https://github.com/nanotee/nvim-lua-guide#vimapinvim_replace_termcodes; and
 https://github.com/hrsh7th/nvim-compe#how-to-use-tab-to-navigate-completion-menu

--]]
function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function check_back_space()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

function _G.smart_tab()

    if vim.fn.pumvisible() == 1 then
        return t'<C-n>'
    end

--[[ TODO for snippets
    if vim.fn.call('vsnip#available', {1}) == 1 then
        return t'<Plug>(vsnip-expand-or-jump)'
    end
--]]

    if not check_back_space() then
        return vim.fn['compe#complete']()
    end

    return t'<Tab>'

end

function _G.s_smart_tab()

    if vim.fn.pumvisible() == 1 then
        return t'<C-p>'
    end

--[[ TODO for snippets
    if vim.fn.call('vsnip#jumpable', {-1}) == 1 then
        return t'<Plug>(vsnip-jump-prev)'
    end
--]]

    return t'<S-Tab>'

end

keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
keymap('s', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
keymap('i', '<S-Tab>', 'v:lua.s_smart_tab()', {expr = true, noremap = true})
keymap('s', '<S-Tab>', 'v:lua.s_smart_tab()', {expr = true, noremap = true})

--[[
-- Leader. Default is '\'. To change timeout in ms, use :set timeoutlen.
vim.api.nvim_set_var('mapleader', t'<Space>')
vim.api.nvim_set_var('maplocalleader', t'<Space>')
--]]

-- Better Escape. If <S-CR> doesn't work, then <C-CR> may do.
keymap('n', '<CR>', 'i', {noremap = true, silent = true})
keymap('i', '<Esc>', '<Esc>`^', {noremap = true, silent = true})
keymap('v', '<Esc>', 'o<Esc>', {noremap = true, silent = true})
--keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true, silent = true})

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

-- Copy/paste
keymap('n', 'Y', 'y$', {noremap = true})
keymap('n', '<M-e>y', '"+y', {noremap = true})
keymap('n', '<M-e>yy', '"+yy', {noremap = true})
keymap('n', '<M-e>Y', '"+y$', {noremap = true})
keymap('n', '<M-e>p', '"+p', {noremap = true})
keymap('n', '<M-e>P', '"+P', {noremap = true})
keymap('n', '<M-y>', '"0y', {noremap = true})
keymap('n', '<M-yy>', '"0yy', {noremap = true})
keymap('n', '<M-Y>', '"0y$', {noremap = true})
keymap('n', '<M-p>', '"0p', {noremap = true})
keymap('n', '<M-P>', '"0P', {noremap = true})

-- Material colour scheme
keymap('n', '<Leader>c', ':lua require(\'material.functions\').toggle_style()<CR>', { noremap = true, silent = true })

-- Compe completion
keymap('i', '<C-Space>', 'compe#complete()', {noremap = true, silent = true, expr = true})
keymap('i', '<CR>', 'compe#confirm(\'<CR>\')', {noremap = true, silent = true, expr = true})
keymap('i', '<C-e>', 'compe#close(\'<C-e>\')', {noremap = true, silent = true, expr = true})
keymap('i', '<C-f>', 'compe#scroll({ \'delta\': +4 })', {noremap = true, silent = true, expr = true})
keymap('i', '<C-b>', 'compe#scroll({ \'delta\': -4 })', {noremap = true, silent = true, expr = true})

