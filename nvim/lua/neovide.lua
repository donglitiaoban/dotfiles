if vim.g.neovide and jit.os == 'Windows' then
  vim.o.termguicolors = true
  -- 字体设置在config.toml
  -- -- vim.o.guifont = 'Maple Mono SC NF' ..
  -- vim.o.guifont = 'FiraCode Nerd Font Mono,' ..
  --   '思源等宽' ..
  --   ':h12:b' ..
  --   ':#h-normal'
  vim.g.neovide_refresh_rate = 120
  -- neovide padding的单位好像是像素，文档没写
  local padding = 4
  vim.g.neovide_padding_top = padding
  vim.g.neovide_padding_bottom = padding
  vim.g.neovide_padding_right = padding
  vim.g.neovide_padding_left = padding
  -- 按下f11切换全屏模式
  vim.api.nvim_set_keymap('n', '<F11>',
  ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end
