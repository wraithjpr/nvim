--[[
Config for plugins:
  nvim-treesitter/nvim-treesitter
  nvim-treesitter/nvim-treesitter-textobjects

See:
  https://github.com/nvim-treesitter/nvim-treesitter
  https://github.com/nvim-treesitter/nvim-treesitter-textobjects
--]]

require'nvim-treesitter.configs'.setup {
    --ensure_installed = {'bash', 'c', 'comment', 'css', 'dockerfile', 'graphql', 'haskell', 'html', 'java', 'javascript', 'jsdoc', 'json', 'jsonc', 'lua', 'python', 'query', 'regex', 'typescript', 'yaml'},
    ensure_installed = {'bash', 'c', 'comment', 'css', 'dockerfile', 'html', 'java', 'javascript', 'jsdoc', 'json', 'json5', 'lua', 'make', 'markdown', 'python', 'query', 'regex', 'typescript', 'vim', 'yaml'},
    highlight = {enable = true, use_languagetree = true},
    indent = {enable = true},
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm'
        }
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ['iF'] = {
                    c = '(function_definition) @function',
                    java = '(method_declaration) @function',
                    javascript = '(function_definition) @function',
                    python = '(function_definition) @function',
                    typescript = '(function_definition) @function'
                },
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['aC'] = '@class.outer',
                ['iC'] = '@class.inner',
                ['ac'] = '@conditional.outer',
                ['ic'] = '@conditional.inner',
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
                ['al'] = '@loop.outer',
                ['il'] = '@loop.inner',
                ['is'] = '@statement.inner',
                ['as'] = '@statement.outer',
                ['ad'] = '@comment.outer',
                ['am'] = '@call.outer',
                ['im'] = '@call.inner'
            }
        }
    }
}

