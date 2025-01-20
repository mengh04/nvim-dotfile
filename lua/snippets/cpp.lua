local ls = require("luasnip") -- 引入 LuaSnip

-- 定义一些快捷函数
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- 定义 C++ 代码片段
ls.add_snippets("cpp", {
    s("acm", {
        t({ "#include <bits/stdc++.h>",
            "using namespace std;",
            "using i64 = long long;",
            "",
            "int main() {",
            "\tios::sync_with_stdio(false); cin.tie(nullptr);",
            "",
            "\t" }), i(1), -- 插入点 1
        t({ "", "",
            "\treturn 0;",
            "",
            "}" }),
    }),
    s("acms", {
        t({ "#include <bits/stdc++.h>",
            "using namespace std;",
            "using i64 = long long;",
            "" }),
        t({ "", "void solve() {" }),
        t({ "", "\t" }), i(1, ""),
        t({ "", "}", "" }),
        t({ "", "int main() {",
            "\tios::sync_with_stdio(false); cin.tie(nullptr);" }),
        t({ "", "\tint t; cin >> t;" }),
        t({ "", "\twhile (t--) { solve(); }" }),
        t({ "", "\treturn 0;", }),
        t({ "", "}" }),
    }),
    s("DSU", {
        t({ "struct DSU {",
            "\tstd::vector<int> f, siz;",
            "\t",
            "\tDSU() {}",
            "\tDSU(int n) {",
            "\t\tinit(n);",
            "\t}",
            "\tvoid init(int n) {",
            "\t\tf.resize(n);",
            "\t\tstd::iota(f.begin(), f.end(), 0);",
            "\t\tsiz.assign(n, 1);",
            "\t}",
            "\tint find(int x) {",
            "\t\twhile (x != f[x]) {",
            "\t\t\tx = f[x] = f[f[x]];",
            "\t\t}",
            "\t\treturn x;",
            "\t}",
            "\tbool same(int x, int y) {",
            "\t\treturn find(x) == find(y);",
            "\t}",
            "\tbool merge(int x, int y) {",
            "\t\tx = find(x);",
            "\t\ty = find(y);",
            "\t\tif (x == y) {",
            "\t\t\treturn false;",
            "\t\t}",
            "\t\tsiz[x] += siz[y];",
            "\t\tf[y] = x;",
            "\t\treturn true;",
            "\t}",
            "\tint size(int x) {",
            "\t\treturn siz[find(x)];",
            "\t}",
            "};", })
    }),

})
