local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require('lspconfig')
lspconfig['clangd'].setup({})
lspconfig['pylsp'].setup({})
lspconfig['lua_ls'].setup({})
-- lspconfig['rust_analyzer'].setup({
vim.cmd('autocmd BufEnter * cd %:p:h')
