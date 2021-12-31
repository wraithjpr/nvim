--[[Key mappings
My personal preferences for key mappings
--]]

local keymap = vim.api.nvim_set_keymap

-- Better Escape. If <S-CR> doesn't work, then <C-CR> may do.
keymap('n', '<CR>', 'i', {noremap = true, silent = true})
keymap('i', '<Esc>', '<Esc>`^', {noremap = true, silent = true})
keymap('v', '<Esc>', 'o<Esc>', {noremap = true, silent = true})
--keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true, silent = true})

-- Remove highlighting
keymap('n', '<Leader><Space>', ':noh<CR>', {noremap = true, silent = true})

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

-- Search - Telescope
-- Finder
keymap('n', '<Leader>fb', [[<cmd>lua require('telescope.builtin').file_browser({hidden = true})<CR>]], {noremap = true})
keymap('n', '<Leader>fc', [[<cmd>lua require('telescope.builtin').commands()<CR>]], {noremap = true})
keymap('n', '<Leader>ff', [[<cmd>lua require('telescope.builtin').find_files({hidden = true})<CR>]], {noremap = true})
keymap('n', '<Leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], {noremap = true})
keymap('n', '<Leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], {noremap = true})
keymap('n', '<Leader>fm', [[<cmd>lua require('telescope.builtin').man_pages()<CR>]], {noremap = true})
keymap('n', '<Leader>fo', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], {noremap = true})
keymap('n', '<Leader>ft', [[<cmd>lua require('telescope.builtin').tags()<CR>]], {noremap = true})
keymap('n', '<Leader>fx', [[<cmd>lua require('telescope.builtin').grep_string({use_regex = true})<CR>]], {noremap = true})
keymap('n', '<Leader>fz', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], {noremap = true})
-- Git
keymap('n', '<Leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<CR>]], {noremap = true})
keymap('n', '<Leader>gc', [[<cmd>lua require('telescope.builtin').git_bcommits()<CR>]], {noremap = true})
keymap('n', '<Leader>gC', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]], {noremap = true})
keymap('n', '<Leader>gf', [[<cmd>lua require('telescope.builtin').git_files()<CR>]], {noremap = true})
keymap('n', '<Leader>gp', [[<cmd>lua require('telescope.builtin').git_stash()<CR>]], {noremap = true})
keymap('n', '<Leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<CR>]], {noremap = true})
-- LSP Pickers
keymap('n', '<Leader>la', [[<cmd>lua require('telescope.builtin').lsp_range_code_actions()<CR>]], {noremap = true})
keymap('n', '<Leader>ld', [[<cmd>lua require('telescope.builtin').diagnostics({bufnr = 0})<CR>]], {noremap = true})
keymap('n', '<Leader>lD', [[<cmd>lua require('telescope.builtin').diagnostics()<CR>]], {noremap = true})
keymap('n', '<Leader>lr', [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]], {noremap = true})
keymap('n', '<Leader>ls', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], {noremap = true})
keymap('n', '<Leader>lS', [[<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>]], {noremap = true})
-- Treesitter
keymap('n', '<Leader>ts', [[<cmd>lua require('telescope.builtin').treesitter()<CR>]], {noremap = true})
-- Vim pickers
keymap('n', '<Leader>va', [[<cmd>lua require('telescope.builtin').autocommands()<CR>]], {noremap = true})
keymap('n', '<Leader>vb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], {noremap = true})
keymap('n', '<Leader>vc', [[<cmd>lua require('telescope.builtin').colorscheme()<CR>]], {noremap = true})
keymap('n', '<Leader>vf', [[<cmd>lua require('telescope.builtin').filetypes()<CR>]], {noremap = true})
keymap('n', '<Leader>vh', [[<cmd>lua require('telescope.builtin').highlights()<CR>]], {noremap = true})
keymap('n', '<Leader>vj', [[<cmd>lua require('telescope.builtin').jumplist()<CR>]], {noremap = true})
keymap('n', '<Leader>vk', [[<cmd>lua require('telescope.builtin').keymaps()<CR>]], {noremap = true})
keymap('n', '<Leader>vl', [[<cmd>lua require('telescope.builtin').loclist()<CR>]], {noremap = true})
keymap('n', '<Leader>vm', [[<cmd>lua require('telescope.builtin').marks()<CR>]], {noremap = true})
keymap('n', '<Leader>vo', [[<cmd>lua require('telescope.builtin').vim_options()<CR>]], {noremap = true})
keymap('n', '<Leader>vq', [[<cmd>lua require('telescope.builtin').quickfix()<CR>]], {noremap = true})
keymap('n', '<Leader>vr', [[<cmd>lua require('telescope.builtin').registers()<CR>]], {noremap = true})
keymap('n', '<Leader>vx', [[<cmd>lua require('telescope.builtin').command_history()<CR>]], {noremap = true})

