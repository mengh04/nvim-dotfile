local ls = require("luasnip")

local s, t, i = ls.snippet, ls.text_node, ls.insert_node



return {

    s("BKDRHash", {

        t({

        "struct BKDRHash {",
        "    vector<u64> P, H;",
        "    BKDRHash(string &s) {",
        "        int n = s.size();",
        "        P.assign(n + 1, 0);",
        "        H.assign(n + 1, 0);",
        "        P[0] = 1;",
        "        for (int i = 1; i < n; i++) {",
        "            P[i] = P[i - 1] * 131;",
        "        }",
        "        for (int i = 0; i < n; i++) {",
        "            H[i + 1] = H[i] * 131 + s[i] - 'a' + 1;",
        "        }",
        "    }",
        "    u64 sub(int L, int R) {",
        "        return H[R] - H[L] * P[R - L];",
        "    }",
        "};"

        }), i(1)

    }),

}

