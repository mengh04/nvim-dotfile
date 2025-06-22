local ls = require("luasnip")
local s, t, i = ls.snippet, ls.text_node, ls.insert_node

return {
    s("acm", {
        t({
            "#include <bits/stdc++.h>",
            "using namespace std;",
            "using i64 = long long;",
            "",
            "int main() {",
            "\tios::sync_with_stdio(false);",
            "\tcin.tie(nullptr);",
            "",
            "\t"
        }), i(1),
        t({
            "", "",
            "\treturn 0;",
            "",
            "}"
        }),
    }),
}

