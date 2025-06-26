return {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'saadparwaiz1/cmp_luasnip',
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')
            cmp.setup {
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                sources = cmp.config.sources(
                    {
                        { name = 'luasnip' },
                        { name = 'buffer' },
                        { name = 'path' }
                    }),
                formatting = {},

                mapping = {

                    ['<Up>'] = cmp.mapping.select_prev_item(),
                    ['<Down>'] = cmp.mapping.select_next_item(),


                    ['<Tab>'] = cmp.mapping.confirm({
                        select = true,
                        behavior = cmp.ConfirmBehavior.Replace
                    }),
                }
            }
        end,
    },
}
