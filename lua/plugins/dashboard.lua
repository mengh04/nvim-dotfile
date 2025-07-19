return {
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        dependencies = { { 'nvim-tree/nvim-web-devicons' } },
        keys = {
            { '<leader>h', '<cmd>Dashboard<CR>', desc = '返回主页' }, -- h for home
        },
        opts = {
            theme = 'hyper',
            config = {
                header = {
                    "",
                    [[  ███╗   ███╗███████╗███╗   ██╗ ██████╗ ██╗  ██╗ ██████╗ ██╗  ██╗]],
                    [[  ████╗ ████║██╔════╝████╗  ██║██╔════╝ ██║  ██║██╔═████╗██║  ██║]],
                    [[  ██╔████╔██║█████╗  ██╔██╗ ██║██║  ███╗███████║██║██╔██║███████║]],
                    [[  ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║██╔══██║████╔╝██║╚════██║]],
                    [[  ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝██║  ██║╚██████╔╝     ██║]],
                    [[  ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝      ╚═╝]],
                    "",
                    "                    🚀 Welcome to my Neovim Configuration! 🚀",
                    "",
                },
                shortcut = {
                    -- action can be a function type
                    { desc = '󰈚 Recent Files', group = 'Label', key = 'r', action = 'Telescope oldfiles' },
                    { desc = '󰈞 Find File', group = 'Label', key = 'f', action = 'Telescope find_files' },
                    { desc = '󰊄 New File', group = 'Label', key = 'n', action = 'ene | startinsert' },
                    { desc = '󰒲 Lazy', group = 'Label', key = 'l', action = 'Lazy' },
                    { desc = ' Settings', group = 'Label', key = 's', action = 'e $MYVIMRC' },
                    { desc = '󰈆 Quit', group = 'Label', key = 'q', action = 'qa' },
                },
                packages = { enable = true }, -- show how many plugins neovim loaded
                -- limit how many projects list, action when you press key or enter it will run this action.
                -- action can be a function type, e.g.
                -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
                project = { enable = true, limit = 8, icon = ' 󰈞  ', label = 'Projects', action = 'Telescope find_files cwd=' },
                mru = { enable = true, limit = 10, icon = '󰈚 ', label = 'Recent Files', cwd_only = false },
                footer = { '⚡ Neovim loaded with dashboard-nvim' }, -- footer
            }
        },
    }
}
