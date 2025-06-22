local ls = require("luasnip")
local s, t = ls.snippet, ls.text_node

return {
    s("DSU", {
        t({
            "struct DSU {",
            "\tstd::vector<int> f, siz;",
            "",
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
            "\t\tif (x == y) return false;",
            "\t\tsiz[x] += siz[y];",
            "\t\tf[y] = x;",
            "\t\treturn true;",
            "\t}",
            "\tint size(int x) {",
            "\t\treturn siz[find(x)];",
            "\t}",
            "};",
        })
    }),
}

