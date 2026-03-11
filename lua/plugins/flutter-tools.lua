return {
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "AstroNvim/astrolsp",
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    opts = {
      lsp = {
        on_attach = function(client, bufnr) require("astrolsp").on_attach(client, bufnr) end,
        capabilities = function(config)
          return vim.tbl_deep_extend("force", config, require("astrolsp").config.capabilities)
        end,
      },
    },
    config = true,
  },
}
