return {
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

            local lspconfig = require('lspconfig')
            lspconfig['clangd'].setup({})
            lspconfig['pylsp'].setup({})
            lspconfig['lua_ls'].setup({})
        end
    },
}
