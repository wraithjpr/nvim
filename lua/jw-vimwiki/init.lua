--[[
Config for plugin, vimwiki/vimwiki
See: https://github.com/vimwiki/vimwiki
     https://github.com/vimwiki/testwikis
--]]

local user_home = vim.fn.expand('$HOME')
local wiki_root_path = user_home .. '/vimwiki'

-- My wikis are in markdown
-- See https://vimwiki.github.io/vimwikiwiki/Tips%20and%20Snips.html#Tips%20and%20Snips-FAQ-Markdown-How%20do%20I%20use%20markdown%20syntax%20for%20my%20wikis?
vim.g.vimwiki_list = {
    {
        path = wiki_root_path .. '/wiki',
        path_html = wiki_root_path .. '/html',
        syntax = 'markdown',
        ext = '.md',
        name = 'JamesWiki',
        auto_toc = 1
    }
}

-- Turn off temporary wikis feature to avoid every markdown file being a wiki file
-- See: https://vimwiki.github.io/vimwikiwiki/Tips%20and%20Snips.html#Tips%20and%20Snips-FAQ-Markdown
vim.g.vimwiki_global_ext = 0

