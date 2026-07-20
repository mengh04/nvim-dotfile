return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.completion = opts.completion or {}
      opts.completion.list = opts.completion.list or {}
      opts.completion.list.selection = opts.completion.list.selection or {}
      opts.keymap = opts.keymap or {}

      opts.completion.list.selection.preselect = true
      opts.completion.list.selection.auto_insert = true

      opts.keymap["<Tab>"] = {
        function(cmp)
          if cmp.is_menu_visible() then return cmp.select_and_accept() end
        end,
        "snippet_forward",
        function()
          if vim.g.ai_accept then return vim.g.ai_accept() end
        end,
        "fallback",
      }
    end,
  },
}
