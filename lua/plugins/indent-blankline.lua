return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {
            exclude = {
                filetypes = {
                    'help',
                    'alpha',
                    'dashboard', -- 加上这一行，告诉它排除 dashboard
                    'neo-tree',
                    'trouble',
                    'lazy',
                    'mason',
                },
            },
        },
    }
}
