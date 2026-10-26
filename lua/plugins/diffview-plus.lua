return {
  {
    "dlyongemallo/diffview-plus.nvim",
    version = "*",
    cmd = {
      "DiffviewOpen",
      "DiffviewFileHistory",
      "DiffviewDiffFiles",
      "DiffviewMergeFiles",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
      "DiffviewLog",
    },
    -- 入口快捷键：同时作为 lazy 触发器，不按不加载，加快启动
    -- 避开了 gitsigns 已占用的 <Leader>gd/gs/gr/gp 和 snacks 的 <Leader>go/gb/gt
    keys = {
      { "<Leader>gv", "<Cmd>DiffviewOpen<CR>", desc = "Diffview 打开工作区改动" },
      { "<Leader>gD", "<Cmd>DiffviewClose<CR>", desc = "Diffview 关闭" },
      { "<Leader>gf", "<Cmd>DiffviewFileHistory<CR>", desc = "Diffview 全仓库历史" },
      { "<Leader>gF", "<Cmd>DiffviewFileHistory %<CR>", mode = "n", desc = "Diffview 当前文件历史" },
      { "<Leader>gF", ":'<,'>DiffviewFileHistory<CR>", mode = "v", desc = "Diffview 选中行历史" },
    },
    opts = {
      preferred_adapter = "jj", -- jj 仓库（含 colocated）优先走 jj adapter；纯 git 仓库自动回退 git
      enhanced_diff_hl = true, -- 差异高亮增强（行内改动也着色）
      view = {
        default = { winbar_info = true }, -- winbar 显示当前对比的文件/rev
        file_history = { winbar_info = true },
      },
    },
  },
}
