return {
  {
    "chomosuke/typst-preview.nvim",
    opts = function(_, opts)
      opts.dependencies_bin = opts.dependencies_bin or {}
      opts.dependencies_bin.tinymist = vim.fn.stdpath "data" .. "/mason/packages/tinymist/tinymist-win32-x64.exe"
    end,
  },
}
