-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.mouse = 'a' -- allow the mouse to be used in Nvim
-- Tab
vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spacesin tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python
-- UI config
vim.opt.number = true -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right
-- vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
vim.opt.showmode = true -- we are experienced, wo don't need the "-- INSERT --" mode hint
-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = false
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.showmode = false
--vim.opt.laststatus = 0
--vim.opt.showcmd = false


vim.opt.wrap = false

if vim.g.neovide then
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_confirm_quit = false
    --vim.g.neovide_cursor_smooth_blink = true;
    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0
    vim.o.guifont = "Hack Nerd Font:h14" -- text below applies for VimScript
end
