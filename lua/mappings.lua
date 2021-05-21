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
local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function check_back_space()
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

    if vim.fn.call('vsnip#available', {1}) == 1 then
        return t'<Plug>(vsnip-expand-or-jump)'
    end

    if not check_back_space() then
        return vim.fn['compe#complete']()
    end

    return t'<Tab>'

end

function _G.s_smart_tab()

    if vim.fn.pumvisible() == 1 then
        return t'<C-p>'
    end

    if vim.fn.call('vsnip#jumpable', {-1}) == 1 then
        return t'<Plug>(vsnip-jump-prev)'
    end

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
keymap('n', '<M-y><M-y>', '"0yy', {noremap = true})
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

-- Search - Telescope
-- Finder
keymap('n', '<Leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], {noremap = true})
keymap('n', '<Leader>fc', [[<cmd>lua require('telescope.builtin').commands()<CR>]], {noremap = true})
keymap('n', '<Leader>fd', [[<cmd>lua require('telescope.builtin').fd()<CR>]], {noremap = true})
keymap('n', '<Leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], {noremap = true})
keymap('n', '<Leader>fg', [[<cmd>lua require('telescope.builtin').live_grep({grep_open_files = true})<CR>]], {noremap = true})
keymap('n', '<Leader>fG', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], {noremap = true})
keymap('n', '<Leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], {noremap = true})
keymap('n', '<Leader>fm', [[<cmd>lua require('telescope.builtin').man_pages()<CR>]], {noremap = true})
keymap('n', '<Leader>fo', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], {noremap = true})
keymap('n', '<Leader>fs', [[<cmd>lua require('telescope.builtin').spell_suggest()<CR>]], {noremap = true})
keymap('n', '<Leader>ft', [[<cmd>lua require('telescope.builtin').current_buffer_tags()<CR>]], {noremap = true})
keymap('n', '<Leader>fT', [[<cmd>lua require('telescope.builtin').tags()<CR>]], {noremap = true})
keymap('n', '<Leader>fx', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], {noremap = true})
keymap('n', '<Leader>fz', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], {noremap = true})
-- Git
keymap('n', '<Leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<CR>]], {noremap = true})
keymap('n', '<Leader>gc', [[<cmd>lua require('telescope.builtin').git_bcommits()<CR>]], {noremap = true})
keymap('n', '<Leader>gC', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]], {noremap = true})
keymap('n', '<Leader>gp', [[<cmd>lua require('telescope.builtin').git_stash()<CR>]], {noremap = true})
keymap('n', '<Leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<CR>]], {noremap = true})
-- LSP Pickers
keymap('n', '<Leader>la', [[<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>]], {noremap = true})
keymap('n', '<Leader>lA', [[<cmd>lua require('telescope.builtin').lsp_range_code_actions()<CR>]], {noremap = true})
keymap('n', '<Leader>ld', [[<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<CR>]], {noremap = true})
keymap('n', '<Leader>lD', [[<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>]], {noremap = true})
keymap('n', '<Leader>li', [[<cmd>lua require('telescope.builtin').lsp_implementations()<CR>]], {noremap = true})
keymap('n', '<Leader>lr', [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]], {noremap = true})
keymap('n', '<Leader>ls', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], {noremap = true})
keymap('n', '<Leader>lS', [[<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>]], {noremap = true})
keymap('n', '<Leader>lt', [[<cmd>lua require('telescope.builtin').lsp_definitions()<CR>]], {noremap = true})
-- Treesitter
keymap('n', '<Leader>ts', [[<cmd>lua require('telescope.builtin').treesitter()<CR>]], {noremap = true})
-- Vim pickers
keymap('n', '<Leader>vc', [[<cmd>lua require('telescope.builtin').colorscheme()<CR>]], {noremap = true})
keymap('n', '<Leader>vf', [[<cmd>lua require('telescope.builtin').filetypes()<CR>]], {noremap = true})
keymap('n', '<Leader>vh', [[<cmd>lua require('telescope.builtin').highlights()<CR>]], {noremap = true})
keymap('n', '<Leader>vk', [[<cmd>lua require('telescope.builtin').keymaps()<CR>]], {noremap = true})
keymap('n', '<Leader>vl', [[<cmd>lua require('telescope.builtin').loclist()<CR>]], {noremap = true})
keymap('n', '<Leader>vo', [[<cmd>lua require('telescope.builtin').vim_options()<CR>]], {noremap = true})
keymap('n', '<Leader>vq', [[<cmd>lua require('telescope.builtin').quickfix()<CR>]], {noremap = true})
keymap('n', '<Leader>vr', [[<cmd>lua require('telescope.builtin').registers()<CR>]], {noremap = true})

