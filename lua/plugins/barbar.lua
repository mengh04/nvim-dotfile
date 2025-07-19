-- 在你的 barbar.lua 配置文件中

return {
    {
        'romgrk/barbar.nvim',
        dependencies = {
            -- 'lewis6991/gitsigns.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        init = function() vim.g.barbar_auto_setup = false end,

        -- 添加下面这一行！
        event = 'VimEnter', -- 告诉 lazy.nvim 在进入 Neovim 时就加载

        opts = {
            -- 这里放你所有的配置...
            animation = true,
            -- ...
        },
        keys = {
            -- 这里放你所有的快捷键...
            { '<A-,>', '<Cmd>BufferPrevious<CR>', desc = 'Prev buffer' },
            { '<A-.>', '<Cmd>BufferNext<CR>',     desc = 'Next buffer' },
            -- ...
        },
    },
}
