local ls = require("luasnip")
local s, t = ls.snippet, ls.text_node

return {
    s("FenwickTree", {
        t({
            "template<typename T>",
            "struct FenwickTree {",
            "    vector<T> a;",
            "    int n;",
            "",
            "    FenwickTree(int size) : n(size) {",
            "        a.assign(n, 0);",
            "    }",
            "",
            "    int lowbit(int x) {",
            "        return x & -x;",
            "    }",
            "",
            "    void update(int x, T d) {",
            "        while (x <= n) {",
            "            a[x] += d;",
            "            x += lowbit(x);",
            "        }",
            "    }",
            "",
            "    T query(int x) {",
            "        T res = 0;",
            "        while (x > 0) {",
            "            res += a[x];",
            "            x -= lowbit(x);",
            "        }",
            "        return res;",
            "    }",
            "};"
        })
    }),
}
