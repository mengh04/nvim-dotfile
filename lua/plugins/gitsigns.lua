return {
  {
    "lewis6991/gitsigns.nvim",
    -- Work around AstroGitFile not firing reliably on Windows.
    event = "User AstroFile",
    -- 用 opts 合并而不是覆盖 config：覆盖 config 会丢掉 AstroNvim 默认 setup 里的
    -- on_attach（]g/[g 跳 hunk、<Leader>g* 系列 git 操作、diffthis 等映射）
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 行尾显示
        delay = 0,
      },
    },
  },
}
