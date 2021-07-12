local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

--TODO This doesn't seem to work
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

        -- Colours
        use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
        use 'marko-cerovac/material.nvim'
        use 'tanvirtin/monokai.nvim'
        use 'shaunsingh/moonlight.nvim'

        use {
            'norcalli/nvim-colorizer.lua',
            config = [[require('jw-colorizer')]]
        }

        use {'kyazdani42/nvim-web-devicons', config = [[require('jw-web-devicons')]]}

        -- Window framework
        use {
            'hoob3rt/lualine.nvim',
            requires = {'kyazdani42/nvim-web-devicons'},
            config = [[require('jw-lualine')]]
        }

        -- Syntax and LSP
        use {
            'nvim-treesitter/nvim-treesitter',
            requires = {'nvim-treesitter/nvim-treesitter-textobjects'},
            run = ':TSUpdate',
            config = [[require('jw-treesitter')]]
        }

        use {
            'neovim/nvim-lspconfig',
            config = [[require('jw-lspconfig')]]
        }

        -- Finder and search
        use {
            'nvim-telescope/telescope.nvim',
            requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
            config = [[require('jw-telescope')]]
        }

        -- Completion and snippets
        use {
            'hrsh7th/nvim-compe',
            config = [[require('jw-compe')]]
        }
        use {
            'hrsh7th/vim-vsnip',
            requires = {{'hrsh7th/vim-vsnip-integ'}, {'rafamadriz/friendly-snippets'}},
            config = [[require('jw-vsnip')]]
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

