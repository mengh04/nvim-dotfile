return {
    {
        'nvimdev/lspsaga.nvim',
        -- 建议加上图标依赖，会让 UI 更好看哦！
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        -- 使用 'opts' 来代替 'config'，配置更简洁！
        opts = {
            -- 你原来的个性化设置，我们把它保留在这里
            lightbulb = {
                enable = false,
                sign = true,
                virtual_text = true,
                debounce = 10,
                sign_priority = 40,
            },
            -- 你还可以在这里添加更多 lspsaga 的设置
            -- a_very_long_option_name = {
            --     ...
            -- }
        },
        -- 使用 'keys' 表来管理快捷键，实现懒加载！
        keys = {
            -- 查看文档
            { 'K',          '<Cmd>Lspsaga hover_doc<CR>',             desc = 'LSP Hover Doc (Lspsaga)' },

            -- 跳转与查看定义
            { 'gd',         '<Cmd>Lspsaga goto_definition<CR>',       desc = 'LSP Go to Definition (Lspsaga)' },
            { 'gh',         '<Cmd>Lspsaga peek_definition<CR>',       desc = 'LSP Peek Definition (Lspsaga)' },
            { 'gi',         '<Cmd>Lspsaga goto_type_definition<CR>',  desc = 'LSP Go to Type Definition (Lspsaga)' },

            -- 查找引用
            { 'gr',         '<Cmd>Lspsaga finder<CR>',                desc = 'LSP Finder (References, etc.)' },

            -- 代码操作
            { '<leader>ca', '<Cmd>Lspsaga code_action<CR>',           desc = 'LSP Code Action (Lspsaga)' },

            -- 重命名
            { '<leader>cr', '<Cmd>Lspsaga rename<CR>',                desc = 'LSP Rename (Lspsaga)' },

            -- 诊断信息
            { '<leader>cd', '<Cmd>Lspsaga show_line_diagnostics<CR>', desc = 'LSP Show Line Diagnostics' },
            { '[d',         '<Cmd>Lspsaga diagnostic_jump_prev<CR>',  desc = 'LSP Prev Diagnostic' },
            { ']d',         '<Cmd>Lspsaga diagnostic_jump_next<CR>',  desc = 'LSP Next Diagnostic' },

            -- 大纲视图
            { '<leader>co', '<Cmd>Lspsaga outline<CR>',               desc = 'LSP Outline (Lspsaga)' },
        },
    }
}
