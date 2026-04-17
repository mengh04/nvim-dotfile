return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false,
    opts = function()
      return {
        server = {
          settings = function(project_root, default_settings)
            local ra = require "rustaceanvim.config.server"
            return ra.load_rust_analyzer_settings(project_root, {
              settings_file_pattern = "rust-analyzer.json",
              default_settings = default_settings or {},
            })
          end,
        },
      }
    end,
    config = function(_, opts) vim.g.rustaceanvim = opts end,
  },
  {
    "AstroNvim/astrolsp",
    opts = {
      handlers = { rust_analyzer = false },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = { "rust-analyzer" },
    },
  },
}
