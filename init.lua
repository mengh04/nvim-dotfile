if vim.g.vscode then

else
    require('options')
    require('keymaps')
    require('lazy-init')
    require('colorscheme')
end
