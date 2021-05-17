local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

execute('autocmd BufWritePost plugins.lua PackerCompile') -- compile on changes to plugins

return require('packer').startup(
    function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        -- Colours
        use 'marko-cerovac/material.nvim'

        -- Window framework
        use {
            'hoob3rt/lualine.nvim',
            requires = {'kyazdani42/nvim-web-devicons', opt = true}
        }

        -- Syntax
        use {
            'nvim-treesitter/nvim-treesitter',
            requires = {'nvim-treesitter/nvim-treesitter-textobjects'},
            run = ':TSUpdate',
            config = [[require('jw-treesitter')]]
        }

        -- Finder
        use {
            'nvim-telescope/telescope.nvim',
            requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
            cmd = 'Telescope'
        }

        -- Completion
        use 'hrsh7th/nvim-compe'

        -- Pairs
        use 'windwp/nvim-autopairs'
        use 'tpope/vim-surround'
        use 'tpope/vim-repeat'

        -- Markdown preview
        use {
            "iamcco/markdown-preview.nvim",
            run = function() vim.fn['mkdp#util#install']() end,
            ft = "markdown",
            cmd = 'MarkdownPreview'
        }
    end
)

