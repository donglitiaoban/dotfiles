require("everforest").setup({
  -- Your config here
  -- check using ':h everforest'
  background = 'soft',
  disable_italic_comments = true,
  sign_column_background = 'low',
  diagnostic_virtual_text = "coloured",
  dim_inactive_windows = true,
  diagnostic_line_highlight = false,
  transparent_background_level = 2,
})

vim.o.termguicolors = true
vim.o.background = 'light'
vim.cmd.colorscheme 'everforest'
