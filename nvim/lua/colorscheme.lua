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

vim.o.termguicolors = true
vim.o.background = 'light'
-- vim.cmd.colorscheme 'catppuccin'
-- vim.cmd.colorscheme 'zenbones'
vim.cmd.colorscheme 'deepwhite'

-- require('deepwhite').setup({
--   low_blue_light = true,
-- })
