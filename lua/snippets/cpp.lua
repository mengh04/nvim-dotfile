
local ls = require("luasnip") -- 引入 LuaSnip

-- 定义一些快捷函数
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- 定义 C++ 代码片段
ls.add_snippets("cpp", {
    s("acm", {
        t({"#include <bits/stdc++.h>",
           "using namespace std;",
           "using i64 = long long;",
           ""}),  -- 空行
        t({"","int main() {",
           "\tios::sync_with_stdio(false); cin.tie(nullptr);",
        ""}),
        t({"", "\t"}), i(1, ""),  -- 插入点 1
        t({"","", "\treturn 0;",}),
        t({"", "}"}),
    }),
    s("acms", {
        t({"#include <bits/stdc++.h>",
           "using namespace std;",
           "using i64 = long long;",
           ""}),
        t({"", "void solve() {"}),
        t({"", "\t"}), i(1,""),
        t({"", "}", ""}),
        t({"","int main() {",
           "\tios::sync_with_stdio(false); cin.tie(nullptr);"}),
        t({"", "\tint t; cin >> t;"}),
        t({"", "\twhile (t--) { solve(); }"}),
        t({"", "\treturn 0;",}),
        t({"", "}"}),
    }),

})
