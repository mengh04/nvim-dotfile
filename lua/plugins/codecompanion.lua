return {
  {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    keys = {
      { "<Leader>a", "<Cmd>CodeCompanionChat Toggle<CR>", mode = "n", desc = "CodeCompanion Chat" },
      { "<Leader>a", ":'<,'>CodeCompanionChat Add<CR>", mode = "x", desc = "Add selection to Chat" },
    },
    opts = {
      interactions = {
        chat = {
          adapter = "opencode", -- ACP adapter, runs `opencode acp`
        },
      },
      display = {
        chat = {
          window = {
            layout = "vertical",
            position = "right", -- left|right|top|bottom
            full_height = true,
            width = 0.3,
          },
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
