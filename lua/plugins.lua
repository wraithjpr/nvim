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

