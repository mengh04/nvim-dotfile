-- 在你的 formatter.lua 配置文件中

return {
    {
        "mhartington/formatter.nvim",
        -- 推荐设置一个快捷键，用于手动触发格式化
        keys = {
            { '<leader>cf', '<cmd>Format<CR>', desc = 'Format Code' }, -- c for code, f for format
        },
        -- 这里我们用 config 函数，因为需要设置 autocmd
        config = function()
            local util = require('formatter.util')

            require('formatter').setup({
                -- 关闭日志，除非你需要调试
                logging = false,

                -- 为不同的文件类型定义格式化器
                filetype = {
                    -- Lua
                    lua = function()
                        return {
                            exe = 'stylua',
                            args = { '--search-parent-directories', '--stdin-filepath', util.escape_path(util.get_current_buffer_file_path()) },
                            stdin = true,
                        }
                    end,

                    -- C, C++, C# 等
                    -- clang-format 会自动寻找项目根目录下的 .clang-format 配置文件
                    c = function() return { exe = 'clang-format', args = { '--assume-filename=' .. util.get_current_buffer_file_path() }, stdin = true, } end,
                    cpp = function() return { exe = 'clang-format', args = { '--assume-filename=' .. util.get_current_buffer_file_path() }, stdin = true, } end,
                    cs = function() return { exe = 'clang-format', args = { '--assume-filename=' .. util.get_current_buffer_file_path() }, stdin = true, } end,

                    -- 前端全家桶，都用 prettier
                    javascript = function() return { exe = 'prettier', args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) }, stdin = true } end,
                    typescript = function() return { exe = 'prettier', args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) }, stdin = true } end,
                    javascriptreact = function() return { exe = 'prettier', args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) }, stdin = true } end,
                    typescriptreact = function() return { exe = 'prettier', args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) }, stdin = true } end,
                    json = function() return { exe = 'prettier', args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) }, stdin = true } end,
                    html = function() return { exe = 'prettier', args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) }, stdin = true } end,
                    css = function() return { exe = 'prettier', args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) }, stdin = true } end,
                    markdown = function() return { exe = 'prettier', args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) }, stdin = true } end,

                    -- 对于其他所有文件类型，使用 "any" 来捕获，或者保持为空
                    ['*'] = {
                        -- require('formatter.filetypes.any').remove_trailing_whitespace,
                    },
                },
            })

            -- ===== 关键！设置保存时自动格式化 =====
            local augroup = vim.api.nvim_create_augroup('FormatOnSave', {})
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = augroup,
                pattern = '*', -- 对所有文件生效
                callback = function()
                    vim.cmd('Format')
                end,
            })
        end,
    },
}
