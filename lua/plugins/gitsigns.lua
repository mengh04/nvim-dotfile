return {
  {
    "lewis6991/gitsigns.nvim",
    -- Work around AstroGitFile not firing reliably on Windows.
    event = "User AstroFile",
    -- AstroNvim 在 on_attach 里用 buffer-local 映射注册 <Leader>g*（如 <Leader>gp =
    -- preview_hunk_inline），buffer-local 的优先级和设置时机都压过全局 keys，
    -- 所以这里包一层它的 on_attach，在默认映射设置完之后覆盖目标键。
    -- 默认 on_attach 来自 ~/.local/share/nvim/lazy/AstroNvim/lua/astronvim/plugins/gitsigns.lua
    opts = function(_, opts)
      -- 注意：该模块返回的就是 spec 表本身，不是数组，不能用 [1] 取
      local spec = require("astronvim.plugins.gitsigns")
      local default_opts = type(spec.opts) == "function" and spec.opts(_, {}) or spec.opts or {}
      local astro_on_attach = default_opts.on_attach
      return vim.tbl_deep_extend("force", opts, {
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 行尾显示
          delay = 0,
        },
        on_attach = function(bufnr)
          if astro_on_attach then astro_on_attach(bufnr) end
          local map = function(lhs, rhs, desc) vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc }) end
          map("<Leader>gp", "<Cmd>Gitsigns preview_hunk<CR>", "Preview Git hunk (float)")
          map("<Leader>gP", function() require("gitsigns").preview_hunk_inline() end, "Preview Git hunk inline")
        end,
      })
    end,
  },
}
