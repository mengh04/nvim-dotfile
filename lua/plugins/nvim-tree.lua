return {
    'nvim-tree/nvim-tree.lua',
    version = '*', -- 跟踪最新版本
    -- 依赖图标插件，让你的文件树更好看！
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    -- 用 'keys' 来设置一个方便的开关快捷键
    keys = {
        -- <leader>e (e for explorer) 是一个很不错的选择
        { '<leader>e', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle NvimTree' }
    },
    opts = {
        -- 确保下面这两个选项都是 true！
        disable_netrw = true,
        hijack_netrw = true, -- 关键！这个选项让 nvim-tree 接管了老管家的工作

        -- 当你切换到一个缓冲区时，文件树会自动定位到那个文件，非常方便！
        update_focused_file = {
            enable = true,
            update_root = true,
        },

        -- 不显示 .git, .DS_Store, node_modules 等文件和文件夹
        -- filters = {
        --     dotfiles = true,
        --     custom = { '^.git$', '^node_modules$', '^.cache$' },
        -- },

        -- Git 状态集成
        git = {
            enable = true,
            ignore = false, -- false 表示显示被 .gitignore 忽略的文件，但会用不同颜色标出
        },

        -- 文件树的外观和行为
        -- view = {
        --     width = 35, -- 文件树的宽度
        --     side = 'left', -- 文件树显示在左侧
        --     -- 让文件树更紧凑，隐藏空的文件夹名称
        --     group_empty = true,
        -- },

        -- 定制渲染，主要是图标！
        -- renderer = {
        --     group_empty = true,
        --     -- 图标相关的设置
        --     icons = {
        --         -- 需要你安装 Nerd Font 字体才能正确显示哦！
        --         glyphs = {
        --             default = '', -- 默认文件图标
        --             symlink = '',
        --             folder = {
        --                 arrow_closed = '', -- 折叠的文件夹
        --                 arrow_open = '', -- 展开的文件夹
        --                 default = '',
        --                 open = '',
        --                 empty = '',
        --                 empty_open = '',
        --                 symlink = '',
        --                 symlink_open = '',
        --             },
        --             git = {
        --                 unstaged = '',
        --                 staged = 'S',
        --                 unmerged = '',
        --                 renamed = '➜',
        --                 untracked = 'U',
        --                 deleted = '',
        --                 ignored = '◌',
        --             },
        --         },
        --     },
        -- },
    },
}
