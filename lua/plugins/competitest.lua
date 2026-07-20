return {
  {
    "mengh04/competitest.nvim",
    commit = "66ea2d2fdecbce9af8d552cbb4f9d5a5099874ee",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
      require("competitest").setup {
        compile_command = {
          cpp = { exec = "g++", args = { "-std=c++23", "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
        },
        save_current_file = true,
        runner_ui = { interface = "popup" },
        testcases_use_single_file = true,
        companion_port = 27121,
      }

      -- <Leader>r group for CompetiTest (r = runner)
      vim.keymap.set("n", "<Leader>r", "", { desc = "CompetiTest" })
      vim.keymap.set("n", "<Leader>rr", "<cmd>CompetiTest run<cr>", { desc = "Run tests" })
      vim.keymap.set("n", "<Leader>rR", "<cmd>CompetiTest run_no_compile<cr>", { desc = "Run (no compile)" })
      vim.keymap.set("n", "<Leader>ra", "<cmd>CompetiTest add_testcase<cr>", { desc = "Add testcase" })
      vim.keymap.set("n", "<Leader>re", "<cmd>CompetiTest edit_testcase<cr>", { desc = "Edit testcase" })
      vim.keymap.set("n", "<Leader>rd", "<cmd>CompetiTest delete_testcase<cr>", { desc = "Delete testcase" })
      vim.keymap.set("n", "<Leader>rl", "<cmd>CompetiTest receive testcases<cr>", { desc = "Receive testcases" })
      vim.keymap.set("n", "<Leader>ru", "<cmd>CompetiTest show_ui<cr>", { desc = "Show UI" })
      vim.keymap.set("n", "<Leader>rs", "<cmd>CompetiTest stress run<cr>", { desc = "Stress run" })
    end,
  },
}
