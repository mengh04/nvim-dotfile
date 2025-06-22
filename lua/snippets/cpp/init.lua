local snippets = {}

-- 你也可以自动收集所有模块名，这里是手动列举
local modules = {
    "snippets.cpp.acm",
    "snippets.cpp.acms",
    "snippets.cpp.DSU",
    "snippets.cpp.FenwickTree",
    "snippets.cpp.LazySegmentTree",
    "snippets.cpp.SegmentTree",
    "snippets.cpp.power",
    "snippets.spp.BKDRHash",
}

for _, mod in ipairs(modules) do
    local ok, loaded = pcall(require, mod)
    if ok and type(loaded) == "table" then
        vim.list_extend(snippets, loaded)
    else
        vim.notify("Failed to load snippet module: " .. mod)
    end
end

return snippets
