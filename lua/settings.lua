--[[
My options settings
See :help set-option and help: option-list
--]]

local execute = vim.api.nvim_command
local setoption = vim.api.nvim_set_option

execute('filetype plugin indent on') -- filetype detection, plugin and indent
execute('syntax on') -- syntax highlighting
setoption('background', 'dark')

-- Tabs and indenting
execute('set autoindent') -- take indent for new line from previous line
execute('set smartindent') -- smart autoindenting
execute('set shiftround') -- round indent to multiple of shiftwidth
setoption('shiftwidth', 4) -- number of spaces to use for (auto)indent step
setoption('tabstop', 4) -- number of spaces that <Tab> in file uses
execute('set expandtab') -- use spaces when <Tab> is inserted

-- line numbers
execute('set number') -- print the line number in front of each line
setoption('numberwidth', 3) -- number of columns for line numbers
execute('set relativenumber') -- show relative line number in front of each line
setoption('signcolumn', 'yes') -- always show the sign column

-- Search behaviour & code completion
setoption('completeopt', 'menuone,noselect') -- options for Insert mode completion; required by compe
execute('set hlsearch') -- highlight search match
execute('set ignorecase') -- ignore case in search patterns
execute('set incsearch') -- show where the pattern matches as it's typed
execute('set iskeyword+=-') -- characters included in keywords; recognises snake case words
execute('set matchpairs+=<:>,=:;') -- pairs of characters that "%" can match
execute('set shortmess+=c') -- don't pass messages to |ins-completion-menu|
execute('set showmatch') -- show matching brackets
execute('set smartcase') -- no ignorecase when search pattern has upper case characters
execute('set wildmenu') -- enhanced mode code completion
setoption(
    'wildignore',
    '.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif'
) -- ignore these file types when completing names and in explorer

-- Window behavior
--setoption('clipboard', 'unnamed') -- use the '*' register for yank, delete, change and put operations
setoption('cmdheight', 2) -- number of lines to use for the command-line (default 1)
setoption('conceallevel', 0) -- make `` visible in markdown files
setoption('inccommand', 'nosplit') -- shows partial off-screen results in a preview window
execute('set linebreak') -- wrap long lines
execute('set list listchars=tab:→\\ ,trail:▸')  -- in list mode show tabs and trailing spaces
setoption('mouse', 'a') -- enable the mouse in all modes
setoption('pumheight', 10) -- pop up menu has 10 items (default 0 - use available screen space)
setoption('sidescroll', 0) -- Put the cursor in middle of the screen when wrap is off and cursor goes off screen (default 1)
execute('set splitbelow') -- new window from split is below the current one
execute('set splitright') -- new window is put right of the current one
setoption('virtualedit', 'block,insert') -- useful for editing tables in Markdown
execute('set visualbell') -- use visual bell instead of beeping
setoption('updatetime', 500) -- faster completion in milliseconds (default 4000)
execute('set whichwrap+=<,>,[,]') -- move to next/previous line with theses keys
execute('set wrap') -- wrap long lines

-- Colours
setoption('t_Co', '256') -- support 256 colours
execute('set termguicolors') -- use true colour in the terminal
execute('highlight Cursor guifg=white guibg=white')
execute('highlight Cursor2 guifg=red guibg=red')
setoption('guicursor', 'n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50')

-- Window title
execute('set title') -- let Vim set the title of the window

-- Code folding
setoption('foldmethod', 'expr')
setoption('foldexpr', 'nvim_treesitter#foldexpr()')
setoption('foldcolumn', 'auto')
setoption('foldenable', false)

