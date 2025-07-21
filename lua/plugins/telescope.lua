return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        event = 'VimEnter',
        -- 使用 keys 实现懒加载和清晰的配置
        keys = {
            { '<leader>ff', function() require('telescope.builtin').find_files() end, desc = 'Find Files' },
            { '<leader>fg', function() require('telescope.builtin').live_grep() end,  desc = 'Live Grep' },
            { '<leader>fb', function() require('telescope.builtin').buffers() end,    desc = 'Find Buffers' },
            { '<leader>fh', function() require('telescope.builtin').help_tags() end,  desc = 'Help Tags' },
        },
        -- config 函数只用来做 setup，保持纯净
        config = function()
            require('telescope').setup({
                -- 在这里放置你的 Telescope 个性化设置
                -- e.g., defaults = { ... }
            })
        end
    }
}
