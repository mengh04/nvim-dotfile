-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.mouse = 'a'               -- allow the mouse to be used in Nvim
-- Tab
vim.opt.tabstop = 4               -- number of visual spaces per TAB
vim.opt.softtabstop = 4           -- number of spacesin tab when editing
vim.opt.shiftwidth = 4            -- insert 4 spaces on a tab
vim.opt.expandtab = true          -- tabs are spaces, mainly because of python
-- UI config
vim.opt.number = true             -- show absolute number
vim.opt.relativenumber = true     -- add numbers to each line on the left side
vim.opt.cursorline = true         -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true         -- open new vertical split bottom
vim.opt.splitright = true         -- open new horizontal splits right
-- vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
-- Searching
vim.opt.incsearch = true  -- search as characters are entered
vim.opt.hlsearch = false
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true  -- but make it case sensitive if an uppercase is entered

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.showmode = false
--vim.opt.laststatus = 0
--vim.opt.showcmd = false


vim.opt.wrap = true

if vim.g.neovide then
    -- vim.g.neovide_cursor_vfx_mode = "sonicboom"       -- 启用音波模式
    -- vim.g.neovide_cursor_vfx_particle_density = 50.0 -- 波纹密度（越高波纹越密集）
    -- vim.g.neovide_cursor_vfx_particle_speed = 15.0 -- 波纹扩散速度
    -- vim.g.neovide_cursor_vfx_particle_phase = 2.5  -- 波纹相位（控制波动幅度）
    -- vim.g.neovide_cursor_vfx_particle_curl = 0.5   -- 波纹扭曲度（0=正圆，1=扭曲）
    --
    -- -- ===== 拖尾增强 ===== --
    -- vim.g.neovide_cursor_trail_size = 0.3      -- 轻微拖尾（配合音波更自然）
    -- vim.g.neovide_cursor_animation_length = 0.15 -- 动画时长（秒）
    --
    -- -- ===== 视觉优化 ===== --
    -- vim.g.neovide_cursor_antialiasing = true -- 抗锯齿（波纹更平滑）
    -- vim.g.neovide_transparency = 0.9       -- 背景半透明（增强波纹可见性）


    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0
    vim.o.guifont = "JetBrainsMono Nerd Font:h14" -- text below applies for VimScript
end
