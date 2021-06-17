--[[
My config for neovim/nvim-lspconfig plugin
See https://github.com/neovim/nvim-lspconfig/wiki/Complete-init.lua-example
See https://github.com/neovim/nvim-lspconfig/blob/master/ADVANCED_README.md#setup-function
--]]

-- Map :Format to vim.lsp.buf.formatting()
vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])


local lspconfig = require('lspconfig')

local function documentHighlight(client, bufnr)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
            [[
                hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
                hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
                hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
                augroup lsp_document_highlight
                    autocmd! * <buffer>
                    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                augroup END
            ]],
            false
        )
    end
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<M-l>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<M-l>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<M-l>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<M-l>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<M-l>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    -- Document highlights
    documentHighlight(client, bufnr)

end

--- [[
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
--local servers = { 'bashls', 'cssls', 'dockerls', 'html', 'jsonls', 'pyright', 'sqlls', 'tsserver', 'yamlls' }
local servers = { 'bashls', 'cssls', 'dockerls', 'html', 'jsonls', 'pyright', 'tsserver', 'yamlls' }

for _, server in ipairs(servers) do
    lspconfig[server].setup { on_attach = on_attach }
end
-- ]]

--[[
-- Config for efm language server
-- See https://github.com/mattn/efm-langserver
--]]
local eslint = {
    lintCommand = 'eslint -f unix --stdin --stdin-filename ${INPUT}',
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}

local prettier = {formatCommand = 'prettier --stdin-filepath ${INPUT}', formatStdin = true}

-- See https://github.com/Koihik/LuaFormatter
local lua = {
    formatCommand = 'lua-format -i --no-keep-simple-function-one-line --column-limit=120',
    formatStdin = true
}

require 'lspconfig'.efm.setup {
    cmd = {'efm-langserver'},
    on_attach = on_attach,
    filetypes = {'lua', 'python', 'javascriptreact', 'javascript', 'typescript','typescriptreact','sh', 'html', 'css', 'json', 'yaml', 'markdown'},
    init_options = {documentFormatting = true, codeAction = false},
    settings = {
        rootMarkers = {'.git/'},
        languages = {
            css = {prettier},
            html = {prettier},
            javascript = {eslint, prettier},
            javascriptreact = {eslint, prettier},
            json = {prettier},
            lua = {lua},
            markdown = {
                {
                    lintCommand = 'markdownlint --config=.markdownlint.yaml --stdin',
                    lintStdin = true,
                    lintFormats = {'%f:%l %m', '%f:%l:%c %m', '%f: %l: %m'}
                },
                {formatCommand = 'pandoc -f markdown -t gfm -sp --tab-stop=2', formatStdin = true}
            },
            python = {
                {
                    lintCommand = 'flake8 --ignore=E501 --stdin-display-name ${INPUT} -',
                    lintStdin = true,
                    lintFormats = {'%f:%l:%c: %m'}
                },
                {formatCommand = 'isort --quiet -', formatStdin = true},
                {formatCommand = 'yapf --quiet', formatStdin = true}
            },
            sh = {
                {
                    lintCommand = 'shellcheck -f gcc -x',
                    lintFormats = {'%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'}
                },
                {formatCommand = 'shfmt -ci -s -bn', formatStdin = true}
            },
            typescript = {eslint, prettier},
            typescriptreact = {eslint, prettier},
            yaml = {prettier}
        }
    }
}

--[[
-- Config for sumneko_lua language server
-- See https://github.com/sumneko/lua-language-server
--]]
local sumneko_root_path = '/Users/james.wraith/Repos/lua-language-server/build/macos/bin'
local sumneko_binary = '/Users/james.wraith/.local/bin/lua-language-server'

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, '-E', sumneko_root_path .. '/main.lua'},
    filetypes = { 'lua' },
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
                }
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false
            }
        }
    }
}

--[[
-- Config for jdtls language server for Java
-- See https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#jdtls
-- Download Eclipse JDT LS from https://projects.eclipse.org/projects/eclipse.jdt.ls/downloads
--   and extract it into ~/.local/share/javalsp
--   with `cd ~/.local/share/javalsp && tar -xf ~/Downloads/jdt-language-server-latest.tar.gz`
-- Download lombok jar file from https://projectlombok.org/download
--   and extract it into ~/.local/share/lombok
--   with `cd ~/.local/share/lombok && cp ~/Downloads/lombok.jar .`
-- See https://github.com/mfussenegger/nvim-jdtls/wiki/Sample-Configurations for how to do Lombok
-- See https://github.com/ChristianChiarulli/LunarVim/blob/master/utils/bin/java-linux-ls for how to do Lombok
--]]

local user_home = vim.fn.expand('$HOME')
local java_home = vim.fn.expand('$JAVA_HOME')
local java_binary = java_home .. '/bin/java'
local jdtls_home = user_home .. '/.local/share/javalsp'
local jdtls_jar = jdtls_home .. '/plugins/org.eclipse.equinox.launcher_1.6.200.v20210416-2027.jar'
local jdtls_config = jdtls_home .. '/config_mac'
local lombok_home = user_home .. '/.local/share/lombok'
local lombok_jar = lombok_home .. '/lombok.jar'
local workspace = user_home .. '/workspace'
local log_level = 'ERROR'

require'lspconfig'.jdtls.setup{
    cmd = {
        java_binary,
        '-javaagent:' .. lombok_jar,
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=' .. log_level,
        '-Xms1g', '-Xmx2G',
        '-jar', jdtls_jar,
        '-configuration', jdtls_config,
        '-data', workspace,
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED'
    },
    cmd_env = {
        JAVA_HOME = java_home
    },
    filetypes = { 'java' },
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern('pom.xml', '.git')
}

