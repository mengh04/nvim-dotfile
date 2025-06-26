local ls = require("luasnip")
local s, t, i = ls.snippet, ls.text_node, ls.insert_node
local extras = require("luasnip.extras")

return {

    -- vector相关
    s("vector", {
        t("vector<"), i(1, "int"), t("> "), i(2, "v"), t(";")
    }),

    s("push_back", {
        t("push_back("), i(1), t(");")
    }),

    s("pop_back", {
        t("pop_back();")
    }),

    s("size", {
        t("size()")
    }),

    s("empty", {
        t("empty()")
    }),

    s("clear", {
        t("clear();")
    }),

    s("front", {
        t("front()")
    }),

    s("back", {
        t("back()")
    }),

    s("resize", {
        t("resize("), i(1, "n"), t(");")
    }),

    s("reserve", {
        t("reserve("), i(1, "n"), t(");")
    }),

    -- priority_queue相关
    s("priority_queue", {
        t("priority_queue<"), i(1, "int"), t("> "), i(2, "pq"), t(";")
    }),

    s("push", {
        t("push("), i(1), t(");")
    }),

    s("pop", {
        t("pop();")
    }),

    s("top", {
        t("top()")
    }),

    -- pair相关
    s("pair", {
        t("pair<"), i(1, "int"), t(", "), i(2, "int"), t("> "), i(3, "p"), t(";")
    }),

    s("make_pair", {
        t("make_pair("), i(1), t(", "), i(2), t(")")
    }),

    s("first", {
        t("first")
    }),

    s("second", {
        t("second")
    }),

    -- set相关
    s("set", {
        t("set<"), i(1, "int"), t("> "), i(2, "s"), t(";")
    }),

    s("insert", {
        t("insert("), i(1), t(");")
    }),

    s("erase", {
        t("erase("), i(1), t(");")
    }),

    s("find", {
        t("find("), i(1), t(")")
    }),

    s("count", {
        t("count("), i(1), t(")")
    }),

    -- map相关
    s("map", {
        t("map<"), i(1, "int"), t(", "), i(2, "int"), t("> "), i(3, "m"), t(";")
    }),

    -- unordered_map相关
    s("unordered_map", {
        t("unordered_map<"), i(1, "int"), t(", "), i(2, "int"), t("> "), i(3, "um"), t(";")
    }),

    -- unordered_set相关
    s("unordered_set", {
        t("unordered_set<"), i(1, "int"), t("> "), i(2, "us"), t(";")
    }),

    -- queue相关
    s("queue", {
        t("queue<"), i(1, "int"), t("> "), i(2, "q"), t(";")
    }),

    -- stack相关
    s("stack", {
        t("stack<"), i(1, "int"), t("> "), i(2, "st"), t(";")
    }),

    -- deque相关
    s("deque", {
        t("deque<"), i(1, "int"), t("> "), i(2, "dq"), t(";")
    }),

    s("push_front", {
        t("push_front("), i(1), t(");")
    }),

    s("pop_front", {
        t("pop_front();")
    }),

    -- string相关
    s("substr", {
        t("substr("), i(1, "pos"), t(", "), i(2, "len"), t(")")
    }),

    s("length", {
        t("length()")
    }),

    s("append", {
        t("append("), i(1), t(");")
    }),

    -- 迭代器相关
    s("begin", {
        t("begin()")
    }),

    s("end", {
        t("end()")
    }),

    s("rbegin", {
        t("rbegin()")
    }),

    s("rend", {
        t("rend()")
    }),

    -- 算法相关
    s("sort", {
        t("sort("), i(1, "v"), t(".begin(), "), extras.rep(1), t(".end());")
    }),

    s("reverse", {
        t("reverse("), i(1, "v"), t(".begin(), "), extras.rep(1), t(".end());")
    }),

    s("unique", {
        t("unique("), i(1, "v"), t(".begin(), "), extras.rep(1), t(".end())")
    }),

    s("lower_bound", {
        t("lower_bound("), i(1, "v"), t(".begin(), "), extras.rep(1), t(".end(), "), i(2, "val"), t(")")
    }),

    s("upper_bound", {
        t("upper_bound("), i(1, "v"), t(".begin(), "), extras.rep(1), t(".end(), "), i(2, "val"), t(")")
    }),

    s("binary_search", {
        t("binary_search("), i(1, "v"), t(".begin(), "), extras.rep(1), t(".end(), "), i(2, "val"), t(")")
    }),

    s("next_permutation", {
        t("next_permutation("), i(1, "v"), t(".begin(), "), extras.rep(1), t(".end())")
    }),

    s("prev_permutation", {
        t("prev_permutation("), i(1, "v"), t(".begin(), "), extras.rep(1), t(".end())")
    }),

    s("max_element", {
        t("max_element("), i(1, "v"), t(".begin(), "), extras.rep(1), t(".end())")
    }),

    s("min_element", {
        t("min_element("), i(1, "v"), t(".begin(), "), extras.rep(1), t(".end())")
    }),

    s("accumulate", {
        t("accumulate("), i(1, "v"), t(".begin(), "), extras.rep(1), t(".end(), "), i(2, "0"), t(")")
    }),

    s("fill", {
        t("fill("), i(1, "v"), t(".begin(), "), extras.rep(1), t(".end(), "), i(2, "val"), t(");")
    }),

    -- 输入输出
    s("cout", {
        t("cout << "), i(1), t(" << \"\\n\";")
    }),

    s("cin", {
        t("cin >> "), i(1), t(";")
    }),

    s("printf", {
        t("printf(\""), i(1, "%d"), t("\", "), i(2), t(");")
    }),

    s("scanf", {
        t("scanf(\""), i(1, "%d"), t("\", &"), i(2), t(");")
    }),

    -- 数学函数
    s("abs", {
        t("abs("), i(1), t(")")
    }),

    s("max", {
        t("max("), i(1), t(", "), i(2), t(")")
    }),

    s("min", {
        t("min("), i(1), t(", "), i(2), t(")")
    }),

    s("swap", {
        t("swap("), i(1), t(", "), i(2), t(");")
    }),

    s("pow", {
        t("pow("), i(1), t(", "), i(2), t(")")
    }),

    s("sqrt", {
        t("sqrt("), i(1), t(")")
    }),

    s("ceil", {
        t("ceil("), i(1), t(")")
    }),

    s("floor", {
        t("floor("), i(1), t(")")
    }),

    -- 类型转换
    s("to_string", {
        t("to_string("), i(1), t(")")
    }),

    s("stoi", {
        t("stoi("), i(1), t(")")
    }),

    s("stoll", {
        t("stoll("), i(1), t(")")
    }),

    s("stod", {
        t("stod("), i(1), t(")")
    }),

    -- 位操作
    s("__builtin_popcount", {
        t("__builtin_popcount("), i(1), t(")")
    }),

    s("__builtin_clz", {
        t("__builtin_clz("), i(1), t(")")
    }),

    s("__builtin_ctz", {
        t("__builtin_ctz("), i(1), t(")")
    }),

    -- emplace相关
    s("emplace_back", {
        t("emplace_back("), i(1), t(");")
    }),

    s("emplace_front", {
        t("emplace_front("), i(1), t(");")
    }),

    s("emplace", {
        t("emplace("), i(1), t(");")
    }),

    s("emplace_hint", {
        t("emplace_hint("), i(1, "hint"), t(", "), i(2), t(");")
    }),

    -- 容器访问和修改
    s("at", {
        t("at("), i(1), t(")")
    }),

    s("operator[]", {
        t("["), i(1), t("]")
    }),

    s("data", {
        t("data()")
    }),

    -- 容器容量
    s("capacity", {
        t("capacity()")
    }),

    s("max_size", {
        t("max_size()")
    }),

    s("shrink_to_fit", {
        t("shrink_to_fit();")
    }),

    -- 关联容器特有
    s("key_comp", {
        t("key_comp()")
    }),

    s("value_comp", {
        t("value_comp()")
    }),

    s("equal_range", {
        t("equal_range("), i(1), t(")")
    }),

    -- 字符串特有方法
    s("c_str", {
        t("c_str()")
    }),

    s("compare", {
        t("compare("), i(1), t(")")
    }),

    s("find", {
        t("find("), i(1), t(")")
    }),

    s("rfind", {
        t("rfind("), i(1), t(")")
    }),

    s("find_first_of", {
        t("find_first_of("), i(1), t(")")
    }),

    s("find_last_of", {
        t("find_last_of("), i(1), t(")")
    }),

    s("find_first_not_of", {
        t("find_first_not_of("), i(1), t(")")
    }),

    s("find_last_not_of", {
        t("find_last_not_of("), i(1), t(")")
    }),

    s("replace", {
        t("replace("), i(1, "pos"), t(", "), i(2, "len"), t(", "), i(3, "str"), t(")")
    }),

    -- 算法库函数
    s("count", {
        t("count("), i(1, "first"), t(", "), i(2, "last"), t(", "), i(3, "val"), t(")")
    }),

    s("count_if", {
        t("count_if("), i(1, "first"), t(", "), i(2, "last"), t(", "), i(3, "pred"), t(")")
    }),

    s("find", {
        t("find("), i(1, "first"), t(", "), i(2, "last"), t(", "), i(3, "val"), t(")")
    }),

    s("find_if", {
        t("find_if("), i(1, "first"), t(", "), i(2, "last"), t(", "), i(3, "pred"), t(")")
    }),

    s("for_each", {
        t("for_each("), i(1, "first"), t(", "), i(2, "last"), t(", "), i(3, "func"), t(")")
    }),

    s("transform", {
        t("transform("), i(1, "first"), t(", "), i(2, "last"), t(", "), i(3, "result"), t(", "), i(4, "func"), t(")")
    }),

    s("copy", {
        t("copy("), i(1, "first"), t(", "), i(2, "last"), t(", "), i(3, "result"), t(")")
    }),

    s("copy_if", {
        t("copy_if("), i(1, "first"), t(", "), i(2, "last"), t(", "), i(3, "result"), t(", "), i(4, "pred"), t(")")
    }),

    s("remove", {
        t("remove("), i(1, "first"), t(", "), i(2, "last"), t(", "), i(3, "val"), t(")")
    }),

    s("remove_if", {
        t("remove_if("), i(1, "first"), t(", "), i(2, "last"), t(", "), i(3, "pred"), t(")")
    }),

    s("replace", {
        t("replace("), i(1, "first"), t(", "), i(2, "last"), t(", "), i(3, "old_val"), t(", "), i(4, "new_val"), t(")")
    }),

    s("replace_if", {
        t("replace_if("), i(1, "first"), t(", "), i(2, "last"), t(", "), i(3, "pred"), t(", "), i(4, "new_val"), t(")")
    }),

    -- 数值算法
    s("gcd", {
        t("gcd("), i(1), t(", "), i(2), t(")")
    }),

    s("lcm", {
        t("lcm("), i(1), t(", "), i(2), t(")")
    }),

    s("iota", {
        t("iota("), i(1, "first"), t(", "), i(2, "last"), t(", "), i(3, "val"), t(")")
    }),

    s("partial_sum", {
        t("partial_sum("), i(1, "first"), t(", "), i(2, "last"), t(", "), i(3, "result"), t(")")
    }),

    -- 其他常用函数
    s("isdigit", {
        t("isdigit("), i(1), t(")")
    }),

    s("isalpha", {
        t("isalpha("), i(1), t(")")
    }),

    s("isalnum", {
        t("isalnum("), i(1), t(")")
    }),

    s("islower", {
        t("islower("), i(1), t(")")
    }),

    s("isupper", {
        t("isupper("), i(1), t(")")
    }),

    s("tolower", {
        t("tolower("), i(1), t(")")
    }),

    s("toupper", {
        t("toupper("), i(1), t(")")
    }),

    s("memset", {
        t("memset("), i(1, "ptr"), t(", "), i(2, "val"), t(", "), i(3, "size"), t(");")
    }),

    s("memcpy", {
        t("memcpy("), i(1, "dest"), t(", "), i(2, "src"), t(", "), i(3, "size"), t(");")
    }),

}
