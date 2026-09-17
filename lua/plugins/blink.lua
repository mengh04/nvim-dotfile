return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.completion = opts.completion or {}
      opts.completion.list = opts.completion.list or {}
      opts.completion.list.selection = opts.completion.list.selection or {}
      opts.keymap = opts.keymap or {}

      opts.completion.list.selection.preselect = true
      opts.completion.list.selection.auto_insert = false

      -- AstroNvim 默认给补全菜单每一条 label 做 treesitter 高亮（menu.draw.treesitter = { "lsp" }）
      -- 这是 blink 已知的“随机卡顿”来源（saghen/blink.cmp#988）：该 highlight 查询缓存是弱表，
      -- 会被 Lua GC 清空，清空后的下一次按键 blink 会在主线程对所有条目重新 parse + 取查询 -> 偶发顿挫。
      -- 关掉对补全几乎无影响（label 不再按语言着色），但不再卡。
      opts.completion.menu = opts.completion.menu or {}
      opts.completion.menu.draw = opts.completion.menu.draw or {}
      opts.completion.menu.draw.treesitter = {}

      -- 补全文档窗口的 treesitter 高亮同理（saghen/blink.cmp#1039），一并关掉
      opts.completion.documentation = opts.completion.documentation or {}
      opts.completion.documentation.treesitter_highlighting = false

      opts.keymap["<Tab>"] = {
        function(cmp)
          if cmp.is_menu_visible() then return cmp.select_and_accept() end
        end,
        "fallback_to_mappings",
      }
    end,
  },
}
