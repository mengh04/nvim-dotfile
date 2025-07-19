return {
    {
        'akinsho/toggleterm.nvim',
        version = '*',
        opts = {
            -- 设置一个舒服的终端大小
            size = 20,
            -- 打开终端时立即进入插入模式，非常方便
            start_in_insert = true,
            -- 按下 <esc> 两次回到普通模式 (可选)
            insert_mappings = true,
            -- 在普通模式下，终端窗口的背景会变暗，让你更专注于代码
            shade_terminals = true,
            -- 当终端任务结束时，自动关闭终端窗口
            close_on_exit = false,
            -- 设置默认的 shell，如果你在用 powershell 或其他 shell
            -- shell = vim.o.shell,

            -- 终端窗口的类型，'float' 是悬浮窗口，'vertical' 或 'horizontal' 是分屏
            direction = 'horizontal',
            -- 悬浮窗口的边框样式
            float_opts = {
                border = 'curved', -- 'single', 'double', 'rounded', 'curved'
            },
        },
        -- 快捷键配置！
        keys = {
            -- 这是主要的终端开关，用 Ctrl + ` (反引号)
            -- 注意：在 lua 中需要转义，所以写成 '<C-`>'
            { '<C-`>',      '<cmd>ToggleTerm<CR>',                             desc = 'Toggle Main Terminal' },

            -- 创建一个专用的 Lazygit 终端！
            { '<leader>gg', '<cmd>lua lazygit_toggle()<CR>',                   desc = 'Toggle Lazygit' },

            -- 创建一个垂直分屏的 Node.js 终端
            { '<leader>tn', '<cmd>ToggleTerm direction=vertical cmd=node<CR>', desc = 'Toggle Node REPL' },
        },
        config = function(_, opts)
            -- 使用 opts 来进行标准设置
            require('toggleterm').setup(opts)

            -- ===== 进阶用法：创建自定义终端 =====

            -- 1. 定义一个 Lazygit 终端
            local Terminal = require('toggleterm.terminal').Terminal
            local lazygit = Terminal:new({
                cmd = "lazygit",
                -- 这是一个隐藏终端，它不会出现在终端列表里，专门用于 lazygit
                hidden = true,
                direction = 'float',
                -- lazygit 退出时，自动销毁这个终端
                on_close = function(term)
                    if term.exit_code == 0 then
                        vim.cmd('q!')
                    end
                end,
            })

            -- 创建一个全局函数来开关 lazygit 终端
            function _G.lazygit_toggle()
                lazygit:toggle()
            end

            -- ===== 进阶用法：实现窗口间的无缝跳转 =====
            -- 让你可以在终端窗口和代码窗口之间用同样的快捷键跳转
            function _G.set_terminal_keymaps()
                local term_opts = { buffer = 0 }
                vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], term_opts)
                vim.keymap.set('t', 'jk', [[<C-\><C-n>]], term_opts)
                vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], term_opts)
                vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], term_opts)
                vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], term_opts)
                vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], term_opts)
            end

            -- 在打开终端时，自动应用这些快捷键
            vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
        end,
    }
}
