--[[
Config for plugin, L3MON4D3/LuaSnip
See https://github.com/L3MON4D3/LuaSnip
See https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md
--]]

local ls = require"luasnip"
local s = ls.snippet
local t = ls.text_node

s('hello', t('hello, world!'))

