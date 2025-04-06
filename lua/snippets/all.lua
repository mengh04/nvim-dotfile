local ls = require("luasnip") -- 引入 LuaSnip

-- 定义一些快捷函数
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node

-- 插入当前时间的片段
ls.add_snippets("all", {
    s("time", {
        f(function()
            return os.date("%Y-%m-%d %H:%M:%S")
        end, {}),
    }),
})
