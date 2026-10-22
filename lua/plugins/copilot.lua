return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    dependencies = {
      -- copilot.lua 的 nes（下一处编辑建议）只是 copilot-lsp 的包装层，必须装它
      "copilotlsp-nvim/copilot-lsp",
    },
    init = function()
      -- NES 自动触发时的防抖（毫秒），copilot-lsp 读取这个全局变量
      vim.g.copilot_nes_debounce = 500

      -- NES 建议在普通模式下用 Tab：第一次跳到建议位置，再按一次应用并跳到末尾；
      -- 没有 NES 建议时退回 Tab 原本的 <C-i>（跳转列表）。
      vim.keymap.set("n", "<Tab>", function()
        if vim.b.nes_state then
          local nes = require "copilot-lsp.nes"
          local _ = nes.walk_cursor_start_edit() or (nes.apply_pending_nes() and nes.walk_cursor_end_edit())
          return nil
        end
        return "<C-i>"
      end, { expr = true, desc = "Accept Copilot NES suggestion" })

      -- 注册 :CopilotLspPatchCheck，并在启动时看一眼本地已装的 copilot-lsp 是否已改动
      require("copilot_patch").setup()
    end,
    config = function(_, opts)
      require("copilot").setup(opts)

      -- TODO(copilot-lsp#21/#24): 上游把 NES 预览文本丢给 treesitter 高亮时，遇到重叠 capture
      -- 会 assert "Unexpected start column" 直接弹错（加注释类编辑很容易触发）。
      -- 这里包一层 pcall：高亮算不出来就退回纯文本预览，功能不受影响。
      -- 上游修好后这段可以删掉（对应 copilot-lsp util.lua:parse_text/merge_captures）。
      -- 修复进度由 lua/copilot_patch.lua 跟踪：启动时本地自检，或手动 :CopilotLspPatchCheck。
      local ok, util = pcall(require, "copilot-lsp.util")
      if not ok then return end
      local orig = util.hl_text_to_virt_lines
      util.hl_text_to_virt_lines = function(text, lang)
        local highlighted, result = pcall(orig, text, lang)
        if highlighted then return result end
        return vim
          .iter(vim.split(text, "\n", { plain = true }))
          :map(function(line) return { { line, { "Normal", "CopilotLspNesAdd" } } } end)
          :totable()
      end
    end,
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        -- 接受键用默认的 <M-l>，不占用 Tab / Enter
      },
      nes = {
        enabled = true,
        -- NES 在文本变化后自动请求（copilot-lsp 内部按 vim.g.copilot_nes_debounce 防抖），
        -- 当前版本 copilot.lua 的 auto_trigger 实际没接线，所以不写它
        -- 键位交给上面的自定义 <Tab> 映射处理
        keymap = {
          accept_and_goto = false,
          accept = false,
          dismiss = false,
        },
      },
    },
  },
}
