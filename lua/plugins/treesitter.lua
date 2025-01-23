return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdateSync",
        config = function()
            -- 文件类型映射
            vim.filetype.add({
                extension = {
                    styl = "css", -- 将 .styl 文件映射为 css 文件类型
                },
            })

            -- Treesitter 配置
            require("nvim-treesitter.configs").setup({
                -- 确保安装的解析器
                ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "css", "html"},

                -- 是否同步安装解析器
                sync_install = false,

                -- 自动安装缺失的解析器
                auto_install = true,

                -- 忽略安装的解析器
                -- ignore_install = { "javascript" },

                highlight = {
                    enable = true, -- 启用高亮

                    -- 动态禁用高亮逻辑
                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,

                    -- 是否同时启用传统的 Vim 语法高亮
                    additional_vim_regex_highlighting = false,
                },
            })
        end,
    }
}
