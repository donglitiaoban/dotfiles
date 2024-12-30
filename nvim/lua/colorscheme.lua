-- require("everforest").setup({
--   -- Your config here
--   -- check using ':h everforest'
--   background = 'soft',
--   disable_italic_comments = true,
--   sign_column_background = 'low',
--   diagnostic_virtual_text = "coloured",
--   dim_inactive_windows = true,
--   diagnostic_line_highlight = false,
--   -- transparent_background_level = 2,
-- })

-- require('catppuccin').setup({
--   no_italic = true,
--   term_colors = true,
-- })
-- 
-- require('auto-dark-mode').setup({
--   update_interval = 1000,
--   set_dark_mode = function()
--     vim.opt.background = 'dark'
--     vim.cmd.colorscheme 'catppuccin-mocha'
--   end,
--   set_light_mode = function()
--     vim.opt.background = 'light'
--     vim.cmd.colorscheme 'catppuccin'
--   end,
-- })

-- require('deepwhite').setup({
--   low_blue_light = true,
-- })

-- 文档说setup不是必须的，放在这备用
-- require("transparent").setup({
--   -- table: default groups
--   groups = {
--     'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
--     'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
--     'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
--     'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
--     'EndOfBuffer',
--   },
--   -- table: additional groups that should be cleared
--   extra_groups = {},
--   -- table: groups you don't want to clear
--   exclude_groups = {},
--   -- function: code to be executed after highlight groups are cleared
--   -- Also the user event "TransparentClear" will be triggered
--   on_clear = function() end,
-- })

-- transparent.nvim
vim.g.transparent_enabled = true

-- 配色设置要在cmd.colorscheme前面
vim.g.zenbones_italic_comments = false

vim.o.termguicolors = true
vim.o.background = 'light'
-- vim.cmd.colorscheme 'catppuccin'
vim.cmd.colorscheme 'zenbones'
-- vim.cmd.colorscheme 'deepwhite'
