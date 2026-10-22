-- copilot-lsp NES 预览崩溃的临时补丁守卫。
-- 背景：copilot-lsp#21 / #24，NES 预览高亮遇到重叠 treesitter capture 会 assert
-- "Unexpected start column"，补丁在 lua/plugins/copilot.lua 的 config 里。
-- 这里负责两件事：
--   1. 每次启动检查本地已安装的 copilot-lsp 源码，判断上游是否动过这块；
--   2. 提供 :CopilotLspPatchCheck 手动联网检查 issue 状态和上游源码。
local M = {}

local REPO = "copilotlsp-nvim/copilot-lsp"
local MARKER = "Unexpected start column"
local UTIL_PATH = vim.fs.joinpath(vim.fn.stdpath "data", "lazy", "copilot-lsp", "lua", "copilot-lsp", "util.lua")
local ISSUES = { 21, 24 }
local RAW_UTIL = "https://raw.githubusercontent.com/copilotlsp-nvim/copilot-lsp/main/lua/copilot-lsp/util.lua"

---@param cmd string[]
---@return string? stdout
local function run(cmd)
  local ok, res = pcall(function() return vim.system(cmd, { text = true }):wait() end)
  if not ok or res.code ~= 0 then return nil end
  return res.stdout
end

--- 优先用 gh（走登录态，避免匿名 API 限流），没有 gh 再退回 curl
---@param number integer
---@return string? state
local function issue_state(number)
  local out = run { "gh", "api", ("repos/%s/issues/%d"):format(REPO, number), "--jq", ".state" }
  if out and vim.trim(out):match "^%a+$" then return vim.trim(out):lower() end

  local body = run {
    "curl",
    "-fsSL",
    "--max-time",
    "5",
    ("https://api.github.com/repos/%s/issues/%d"):format(REPO, number),
  }
  return body and body:match '"state"%s*:%s*"([a-z]+)"' or nil
end

---@param path? string 仅测试用，默认读已安装的 copilot-lsp
---@return boolean fixed 源码里已经没有那个 assert，可能已修复
function M.check_local(path)
  local ok, lines = pcall(vim.fn.readfile, path or UTIL_PATH)
  if not ok then return false end
  if table.concat(lines, "\n"):find(MARKER, 1, true) then return false end

  vim.notify_once(
    "[copilot] copilot-lsp 的 util.lua 里已经没有 \"Unexpected start column\" assert，"
      .. "上游可能修了 NES 预览崩溃。确认后可以删掉 lua/plugins/copilot.lua 里的 pcall 补丁"
      .. "（跑 :CopilotLspPatchCheck 看 issue 状态）。",
    vim.log.levels.WARN
  )
  return true
end

function M.check_upstream()
  local report = { "[copilot] 上游检查：" }
  local closed_issue = false
  local has_marker = true
  local reachable = false

  for _, number in ipairs(ISSUES) do
    local state = issue_state(number)
    if state then
      reachable = true
      report[#report + 1] = ("- issue #%d: %s"):format(number, state)
      if state == "closed" then closed_issue = true end
    else
      report[#report + 1] = ("- issue #%d: 查询失败"):format(number)
    end
  end

  local raw = run { "curl", "-fsSL", "--max-time", "5", RAW_UTIL }
  if raw then
    reachable = true
    has_marker = raw:find(MARKER, 1, true) ~= nil
    report[#report + 1] = has_marker and "- 上游 util.lua: 仍含该 assert"
      or "- 上游 util.lua: 已不含该 assert"
  else
    report[#report + 1] = "- 上游 util.lua: 查询失败"
  end

  if not reachable then
    report[#report + 1] = "结论：网络或 curl 不可用，本次没查成。"
    vim.notify(table.concat(report, "\n"), vim.log.levels.WARN)
    return
  end

  local conclusion
  if not has_marker then
    conclusion = "结论：上游源码已变，检查后可以删除补丁。"
  elseif closed_issue then
    conclusion = "结论：有相关 issue 已关闭，建议人工确认后删除补丁。"
  else
    conclusion = "结论：未发现修复，补丁继续保留。"
  end
  report[#report + 1] = conclusion
  vim.notify(table.concat(report, "\n"), vim.log.levels.INFO)
end

function M.setup()
  vim.api.nvim_create_user_command("CopilotLspPatchCheck", M.check_upstream, {
    desc = "检查 copilot-lsp NES 预览补丁是否还需要",
  })
  M.check_local()
end

return M
