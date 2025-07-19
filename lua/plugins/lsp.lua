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
                    virtual_text = false, -- 禁用行尾的虚拟文本
                    debounce = 10,
                    sign_priority = 40,
                }
            })
        end,
        --dependencies = {}
    },

    {
        'neovim/nvim-lspconfig',
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local buf = args.buf
                    vim.api.nvim_buf_set_keymap(buf, 'n', '<C-s>', "<cmd>lua vim.lsp.buf.format()<CR>",
                        { noremap = true })
                end,
            })
        end
    },
}
