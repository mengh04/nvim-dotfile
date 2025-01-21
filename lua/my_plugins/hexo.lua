-- ~/.config/nvim/lua/plugins/hexo_post.lua
local M = {}

local blog_dir = "C:/Users/mengh04/OneDrive/blog"
local posts_dir = blog_dir .. "/source/_posts/2025/"

-- 执行命令的通用函数（在终端中运行命令）
local function run_command_in_terminal(command)
  -- 使用 :term 在 Neovim 内部打开终端并执行命令
  vim.cmd("term " .. command)
end

-- 生成静态文件
function M.generate()
  local cmd = string.format("cd %s && hexo generate", blog_dir)
  run_command_in_terminal(cmd)
end

-- 部署文件
function M.deploy()
  local cmd = string.format("cd %s && hexo deploy", blog_dir)
  run_command_in_terminal(cmd)
end

-- 生成并部署文件
function M.generate_and_deploy()
  local cmd = string.format("cd %s && hexo generate --deploy", blog_dir)
  run_command_in_terminal(cmd)
end

-- 启动 Hexo 本地服务器
function M.serve()
  local cmd = string.format("cd %s && hexo server", blog_dir)
  run_command_in_terminal(cmd)
end

-- 创建 Hexo 博客文章
function M.create_post(title)
  local post_name = title:gsub("%s+", "-")
  local post_path = posts_dir .. post_name .. ".md"

  local cmd = string.format("cd %s && hexo new post %s", blog_dir, post_name)
  local success = os.execute(cmd)

  if success then
    vim.cmd("edit " .. post_path)
  else
    vim.api.nvim_err_writeln("Failed to create post: " .. title)
  end
end

-- 注册命令
function M.setup()
  vim.api.nvim_create_user_command(
    'HexoPost',
    function(opts)
      M.create_post(opts.args)
    end,
    { nargs = 1, desc = "Create a new Hexo blog post" }
  )
  
  -- 生成静态文件
  vim.api.nvim_create_user_command(
    "HexoGenerate",
    function() M.generate() end,
    { desc = "Generate Hexo static files" }
  )

  -- 部署文件
  vim.api.nvim_create_user_command(
    "HexoDeploy",
    function() M.deploy() end,
    { desc = "Deploy Hexo site" }
  )

  -- 生成并部署
  vim.api.nvim_create_user_command(
    "HexoGenDeploy",
    function() M.generate_and_deploy() end,
    { desc = "Generate and deploy Hexo site" }
  )

  -- 启动 Hexo 本地服务器
  vim.api.nvim_create_user_command(
    "HexoServe",
    function() M.serve() end,
    { desc = "Start Hexo local server" }
  )
end

return M
