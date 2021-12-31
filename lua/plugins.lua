local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

--execute('autocmd BufWritePost plugins.lua PackerCompile') -- compile on changes to plugins
vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost lua/plugins.lua PackerCompile
  augroup end
]], false)

return require('packer').startup(
    function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        -- Common plugins
        use 'nvim-lua/plenary.nvim'
        -- use 'nvim-lua/popup.nvim'

        -- Colours
        use {'projekt0n/github-nvim-theme', config = [[require('jw-github-theme')]]}
        use {'norcalli/nvim-colorizer.lua', config = [[require('jw-colorizer')]]}
        use {'kyazdani42/nvim-web-devicons', config = [[require('jw-web-devicons')]]}

        -- Window framework
        use {
            'hoob3rt/lualine.nvim',
            requires = {{'kyazdani42/nvim-web-devicons', opt = true}, {'projekt0n/github-nvim-theme'}},
            config = [[require('jw-lualine')]]
        }

        -- Completion and snippets
        -- Syntax and LSP
        use 'nvim-treesitter/nvim-treesitter-textobjects'
        use {
            'nvim-treesitter/nvim-treesitter',
            requires = {'nvim-treesitter/nvim-treesitter-textobjects'},
            config = [[require('jw-treesitter')]],
            run = ':TSUpdate'
        }

        use 'rafamadriz/friendly-snippets'
        use {
            'L3MON4D3/LuaSnip',
            requires = {{'saadparwaiz1/cmp_luasnip'}, {'rafamadriz/friendly-snippets'}},
            config = [[require('jw-luasnip')]]
        }

        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-cmdline'
        use 'saadparwaiz1/cmp_luasnip'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-path'
        use {
            'hrsh7th/nvim-cmp',
            requires = {{'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-cmdline'}, {'saadparwaiz1/cmp_luasnip'}, {'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-path'}},
            config = [[require('jw-cmp')]]
        }

        use {
            'neovim/nvim-lspconfig',
            requires = {'hrsh7th/cmp-nvim-lsp'},
            config = [[require('jw-lspconfig')]]
        }

        -- Finder and search
        use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        use {
            'nvim-telescope/telescope.nvim',
            requires = {'nvim-lua/plenary.nvim'},
            config = [[require('jw-telescope')]]
        }

        -- Pairs
        use {
            'windwp/nvim-autopairs',
            config = [[require('jw-autopairs')]]
        }
        use 'tpope/vim-surround'
        use 'tpope/vim-repeat'

        -- Markdown preview
        use {
            'iamcco/markdown-preview.nvim',
            run = function() vim.fn['mkdp#util#install']() end,
            ft = "markdown",
            cmd = 'MarkdownPreview'
        }

        -- Wiki
        use { 'vimwiki/vimwiki', config = [[require('jw-vimwiki')]] }
    end
)

