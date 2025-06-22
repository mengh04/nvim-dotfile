local ls = require("luasnip")
local s, t, i = ls.snippet, ls.text_node, ls.insert_node

return {
    s("acms", {
        t({
            "#include <bits/stdc++.h>",
            "using namespace std;",
            "using i64 = long long;",
            ""
        }),
        t({ "", "void solve() {" }),
        t({ "", "\t" }), i(1, ""),
        t({ "", "}", "" }),
        t({ "", "int main() {",
            "\tios::sync_with_stdio(false);",
            "\tcin.tie(nullptr);"
        }),
        t({ "", "\tint t;"}),
        t({ "", "\tcin >> t;"}),
        t({ "", "\twhile (t--) {"}),
        t({ "", "\t\tsolve();"}),
        t({ "", "\t}"}),
        t({ "", "\treturn 0;" }),
        t({ "", "}" }),
    }),
}

