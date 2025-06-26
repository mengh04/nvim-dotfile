local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key


return {
    postfix(".all", {
        f(function(_, parent)
            return parent.snippet.env.POSTFIX_MATCH .. ".begin(), " .. parent.snippet.env.POSTFIX_MATCH .. ".end()"
        end, {}),
    }),

    -- pair<int, int>
    s("pii", {
        t("pair<int, int> "), i(1), t(";")
    }),

    -- debug(x)
    s("dbg", {
        t("cerr << \""), i(1, "x"), t(" = \" << "), i(1), t(" << '\\n';")
    }),

    -- 输出 Yes/No
    s("yesno", {
        t("cout << ("), i(1, "ok"), t(" ? \""), i(2, "Yes"), t("\" : \""), i(3, "No"), t("\") << '\\n';")
    }),

    -- vector<string>
    s("vs", {
        t("vector<string> "), i(1), t(";")
    }),


    -- set<int>
    s("si", {
        t("set<int> "), i(1), t(";")
    }),

    -- priority_queue<int>
    s("pq", {
        t("priority_queue<"), i(1, "int"), t("> "), i(2), t(";")
    }),


    -- 常用常数定义
    s("Const", {
        t("const int "), i(1, "N"), t(" = "), i(2, "1e5"), t(";")
    }),

    -- 模数定义
    s("mod", {
        t("const int M = "), i(1, "1e9 + 7"), t(";")
    }),

    -- 无穷大
    s("inf", {
        t("const int INF = "), i(1, "0x3f3f3f3f"), t(";")
    }),

    -- 二维数组
    s("arr2d", {
        t("vector<vector<int>> "), i(1, "a"), t("("), i(2, "n"), t(", vector<int>("), i(3, "m"), t("));")
    }),


    -- 输出数组
    s("printa", {
        t("for (int i = 0; i < "), i(1, "n"), t("; i++) {"),
        t({ "", "    cout << " }), i(2, "a"), t("[i];"),
        t({ "", "    if (i < " }), i(1), t(" - 1) cout << \" \";"),
        t({ "", "}" })
    }),

    -- 读取数组
    s("reada", {
        t("for (int i = 0; i < "), i(1, "n"), t("; i++) {"),
        t({ "", "    cin >> " }), i(2, "a"), t("[i];"),
        t({ "", "}" })
    }),

    -- lambda函数
    s("lambda", {
        t("auto "), i(1, "f"), t(" = [&]("), i(2, "int x"), t(") -> "), i(3, "int"), t(" {"), i(4), t("};")
    }),

    -- 方向数组
    s("dir", {
        t({
            "int dx[] = {-1, 1, 0, 0};",
            "int dy[] = {0, 0, -1, 1};"
        })
    }),

    -- 8方向数组
    s("dir8", {
        t({
            "int dx[] = {-1, -1, -1, 0, 0, 1, 1, 1};",
            "int dy[] = {-1, 0, 1, -1, 1, -1, 0, 1};"
        })
    }),

    -- 结构体
    s("struct", {
        t("struct "), i(1, "node"), t({
        " {",
        "    ",
    }), i(2),
        t({
            "",
            "};"
        })
    }),

    -- 容器的begin()和end()
    s("all", {
        i(1, "a"), t(".begin(), "), extras.rep(1), t(".end()")
    }),

}
