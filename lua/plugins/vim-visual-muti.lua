-- 在你的 visual-multi.lua 配置文件中

return {
  {
    'mg979/vim-visual-multi',
    -- 这个插件通过快捷键触发，所以用 'keys' 来懒加载是最好的方式
    keys = {
      { '<C-n>', mode = {'n', 'x'} },
      { '<C-p>', mode = {'n', 'x'} },
      { '<C-j>', mode = {'n', 'x'} },
      { '<C-k>', mode = {'n', 'x'} },
    },
    -- 使用 init 函数来设置全局变量
    init = function()
      -- 设置自定义的快捷键
      -- 你可以把所有想要的快捷键都定义在这里
      vim.g.VM_maps = {
        ['Find Next'] = '<C-n>',      -- 查找下一个匹配项并添加光标
        ['Find Prev'] = '<C-p>',      -- 查找上一个匹配项并添加光標
        ['Skip'] = '<C-x>',           -- 跳过当前匹配项
        ['Undo'] = 'u',               -- 在选择模式中撤销上一个光标
        ['Redo'] = '<C-r>',           -- 在选择模式中重做
        ['Select All'] = '<A-n>',     -- 选中所有匹配项 (Alt+n)
      }

      -- 设置光标和选中区域的颜色，让它们更显眼
      vim.g.VM_highlight_cursor = 'Visual'
      vim.g.VM_highlight_selection = 'Visual'
      vim.g.VM_highlight_extend = 'WarningMsg'
      
      -- 如果你想让光标显示为一个方块而不是下划线
      vim.g.VM_cursor_style = 'block'
    end,
  },
}
