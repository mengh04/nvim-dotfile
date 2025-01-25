return {
  -- 加载本地插件
  {
    "hexo", -- 插件名
    dir = vim.fn.stdpath("config") .. "/lua/my_plugins", -- 使用 Neovim 配置路径
    config = function()
      require("my_plugins.hexo").setup() -- 加载并初始化插件
    end,
    lazy = false, -- 根据需要决定是否延迟加载
  },
}
