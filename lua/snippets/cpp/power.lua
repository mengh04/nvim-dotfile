local ls = require("luasnip")
local ps = ls.parser.parse_snippet

return {
    ps("power", [=[    auto power = [&](i64 a, int b, int p = -1) {
        i64 res = 1;
        while (b) {
            if (b & 1) {
                res = a * res;
                if (p != -1) {
                    res %= p;
                }
            }
            a = a * a;
            if (p != -1) {
                a %= p;
            }
            b >>= 1;
        }
        return res;
    };
]=]),
}
