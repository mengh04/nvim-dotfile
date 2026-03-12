return {
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
      -- include a picker of your choice, see picker section for more details
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      cn = {
        enabled = true,
      },
      injector = { ---@type table<lc.lang, lc.inject>
        ["python3"] = {
          imports = function(default_imports)
            vim.list_extend(default_imports, { "from .leetcode import *" })
            return default_imports
          end,
          after = { "def test():", "    print('test')" },
        },
        ["cpp"] = {
          imports = function()
            -- return a different list to omit default imports
            return { "#include <bits/stdc++.h>", "using namespace std;" }
          end,
          after = "int main() {}",
        },
        ["rust"] = {
          before = {
            "#[allow(dead_code)]",
            "struct Solution;",
            "",
            "fn main() {",
          },
          after = {
            "}",
          },
        },
      },
      hooks = {
        ["question_enter"] = {
          function(question)
            if question.lang ~= "rust" then return end

            local config = require "leetcode.config"
            local raw_path = question:path()
            local safe_path = raw_path:gsub("\\", "/") -- 替换 Windows 路径分隔符

            local cargo_path = config.user.storage.home .. "/Cargo.toml"

            -- 定义针对 LeetCode 环境的 Cargo.toml 内容
            local content = [[
[package]
name = "leetcode"
version = "0.1.0"
edition = "2021"

[dependencies]
rand = "0.8"
regex = "1"
itertools = "0.14.0"

[lib]
name = "solution"
path = "%s"
]]
            -- 将当前题目文件路径写入 Cargo.toml
            local file = io.open(cargo_path, "w")
            if file then
              file:write(content:format(safe_path))
              file:close()

              -- 重启 LSP 以识别新生成的项目结构
              vim.cmd "RustAnalyzer restart"
            end
          end,
        },
      },
    },
  },
}
