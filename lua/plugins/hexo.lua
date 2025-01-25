return {
  -- 加载本地插件
  {
    "hexo", -- 插件名
    dir = "/home/mengh04/.config/nvim/lua/my_plugins", -- 本地路径，指向包含插件的目录
    config = function()
      require("my_plugins.hexo").setup() -- 加载并初始化插件
    end,
    lazy = false, -- 根据需要决定是否延迟加载
  },
}
