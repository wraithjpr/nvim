--[[
My options settings
See :help set-option and help: option-list
--]]

vim.api.nvim_command('syntax enable') -- syntax highlighting

-- Tabs and indenting
vim.api.nvim_command('set autoindent') -- take indent for new line from previous line
vim.api.nvim_command('set smartindent') -- smart autoindenting
vim.api.nvim_command('set shiftround') -- round indent to multiple of shiftwidth
vim.api.nvim_set_option('shiftwidth', 4) -- number of spaces to use for (auto)indent step
vim.api.nvim_set_option('tabstop', 4) -- number of spaces that <Tab> in file uses
vim.api.nvim_command('set expandtab') -- use spaces when <Tab> is inserted

-- line numbers
vim.api.nvim_command('set number') -- print the line number in front of each line
vim.api.nvim_set_option('numberwidth', 3) -- number of columns for line numbers
vim.api.nvim_command('set relativenumber') -- show relative line number in front of each line
vim.api.nvim_set_option('signcolumn', 'yes') -- always show the sign column

-- Search behaviour & code completion
vim.api.nvim_set_option('completeopt', 'menu,menuone,longest,preview') -- options for Insert mode completion
vim.api.nvim_command('set hlsearch') -- highlight search match
vim.api.nvim_command('set ignorecase') -- ignore case in search patterns
vim.api.nvim_command('set incsearch') -- show where the pattern matches as it's typed
vim.api.nvim_command('set iskeyword+=-') -- characters included in keywords; recognises snake case words
vim.api.nvim_command('set matchpairs+=<:>,=:;') -- pairs of characters that "%" can match
vim.api.nvim_command('set shortmess+=c') -- don't pass messages to |ins-completion-menu|
vim.api.nvim_command('set showmatch') -- show matching brackets
vim.api.nvim_command('set smartcase') -- no ignorecase when search pattern has upper case characters
vim.api.nvim_command('set wildmenu') -- enhanced mode code completion
vim.api.nvim_set_option(
    'wildignore',
    '.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif'
) -- ignore these file types when completing names and in explorer

-- Window behavior
vim.api.nvim_set_option('clipboard', 'unnamedplus') -- use the '+' register for yank, delete, change and put operations
vim.api.nvim_set_option('cmdheight', 2) -- number of lines to use for the command-line (default 1)
--vim.api.nvim_set_option('columns', 9999) -- get the widest window possible (default 80 or terminal width)
vim.api.nvim_set_option('conceallevel', 0) -- make `` visible in markdown files
vim.api.nvim_set_option('inccommand', 'split') -- shows partial off-screen results in a preview window
vim.api.nvim_command('set linebreak') -- wrap long lines
vim.api.nvim_command('set list listchars=tab:→\\ ,trail:▸')  -- in list mode show tabs and trailing spaces
vim.api.nvim_set_option('mouse', 'a') -- enable the mouse in all modes
vim.api.nvim_set_option('pumheight', 10) -- pop up menu has 10 items (default 0 - use available screen space)
vim.api.nvim_set_option('sidescroll', 0) -- Put the cursor in middle of the screen when wrap is off and cursor goes off screen (default 1)
vim.api.nvim_command('set splitbelow') -- new window from split is below the current one
vim.api.nvim_command('set splitright') -- new window is put right of the current one
vim.api.nvim_set_option('t_Co', '256') -- support 256 colours
vim.api.nvim_command('set termguicolors')
vim.api.nvim_set_option('virtualedit', 'block,insert') -- useful for editing tables in Markdown
vim.api.nvim_command('set visualbell') -- use visual bell instead of beeping
vim.api.nvim_set_option('updatetime', 1000) -- faster completion in milliseconds (default 4000)
vim.api.nvim_command('set whichwrap+=<,>,[,]') -- move to next/previous line with theses keys
vim.api.nvim_command('set wrap') -- wrap long lines

-- Window title
vim.api.nvim_command('set title') -- let Vim set the title of the window

