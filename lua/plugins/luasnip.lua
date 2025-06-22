return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",                -- 使用最新的 v2 版本
        build = "make install_jsregexp", -- 安装 jsregexp（可选）

        -- 插件加载完成后，执行以下配置
        config = function()
            local ls = require("luasnip")
            ls.add_snippets("cpp", require("snippets.cpp"))
        end,
    },
}
