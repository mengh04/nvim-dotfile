vim.g.mapleader = " " -- 将<leader>键设置为空格
vim.g.maplocalleader = " " -- 将<localleader>键也设置为空格

local opts = {
  noremap = true, -- 非递归映射
  silent = true,  -- 不在命令行显示执行的命令
}

vim.keymap.set('n', '<M-j>', ':m .+1<CR>', opts)
vim.keymap.set('n', '<M-k>', ':m .-2<CR>', opts)
vim.keymap.set('v', '<M-j>', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', '<M-k>', ":m '<-2<CR>gv=gv", opts)


vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)



if vim.g.neovide then
  vim.keymap.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", opts)
  vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", opts)
end
