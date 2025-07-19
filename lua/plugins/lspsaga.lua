return {
    -- 'onsails/lspkind-nvim',
    --
    {
        'nvimdev/lspsaga.nvim',
        config = function()
            require('lspsaga').setup({
                lightbulb = {
                    enable = false,
                    sign = true,
                    virtual_text = true,
                    debounce = 10,
                    sign_priority = 40,
                }
            })
        end,
        --dependencies = {}
    },

}
