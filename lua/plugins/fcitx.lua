return {
  {
    "junyixu/fcitx.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("fcitx").setup {
        -- enable_cmdline = true, -- also toggle when entering / or ?
      }
    end,
  },
}
