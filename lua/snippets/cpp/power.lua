local ls = require("luasnip")

local s, t, i = ls.snippet, ls.text_node, ls.insert_node



return {

    s("power", {

        t({

        "i64 power(i64 a, int b) {",
        "    i64 res = 1;",
        "    while (b) {",
        "        if (b & 1) {",
        "            res *= a;",
        "        }",
        "        a *= a;",
        "        b >>= 1;",
        "    }",
        "    return res;",
        "}"

        }), i(1)

    }),

}

