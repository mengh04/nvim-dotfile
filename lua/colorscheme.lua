-- local colorscheme = 'tokyonight-night'
local colorscheme = 'tokyonight-moon'
--local colorscheme = 'tokyonight-storm'

local is_ok, _= pcall(vim.cmd,"colorscheme " .. colorscheme)
if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end
