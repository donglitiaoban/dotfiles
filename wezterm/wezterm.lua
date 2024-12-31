local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.hide_tab_bar_if_only_one_tab = true
config.default_cursor_style = 'SteadyBar'

-- -- auto change colorscheme for light/dark mode
-- local function get_appearance()
--   if wezterm.gui then
--     return wezterm.gui.get_appearance()
--   end
--   return 'Dark'
-- end
-- 
-- local function scheme_for_appearance(appearance)
--   if appearance:find 'Dark' then
--     return 'Catppuccin Mocha'
--   else
--     return 'Catppuccin Latte'
--   end
-- end
-- 
-- config.color_scheme = scheme_for_appearance(get_appearance())

-- config.color_scheme = 'Catppuccin Latte'
-- config.color_scheme = 'Rosé Pine Dawn (Gogh)'

config.color_scheme = 'zenbones'

config.keys = {
  {
    key = 'F11',
    action = wezterm.action.ToggleFullScreen,
  },
  -- {
  --   -- ignore ctrl+z
  --   key = 'Z',
  --   mods = 'CTRL',
  --   action = wezterm.action.DisableDefaultAssignment,
  -- },
}

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  -- 只在scoop pwsh安装后应用
  local res = wezterm.glob('pwsh', os.getenv('USERPROFILE') .. '/scoop/apps')
  if #res ~= 0 then
    config.default_prog = { 'pwsh.exe' }
  end

  res = wezterm.glob('nu', os.getenv('USERPROFILE') .. '/scoop/apps')
  if #res ~= 0 then
    config.default_prog = { 'nu.exe' }
  end

  config.font_size = 12
  config.line_height = 1.1
  config.font = wezterm.font_with_fallback {
    'FiraCode Nerd Font Mono',
    -- 'JetBrainsMono Nerd Font Mono',
    {
      family = '思源等宽',
      scale = 1.13,
    },
  }
  -- config.font = wezterm.font 'Maple Mono SC NF'

  config.initial_rows = 26
  config.initial_cols = 90
end

if wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
  if os.execute('which zsh') == true then
    config.default_prog = { 'zsh' }
  end

  if os.execute('which nu') == true then
    config.default_prog = { 'nu' }
  end

  config.font_size = 12
  -- config.font = wezterm.font 'Maple Mono SC NF'
  config.font = wezterm.font_with_fallback {
    'FiraCode Nerd Font Mono',
    {
      family = 'Source Han Sans CN',
      scale = 1.15,
    },
  }
  end
return config
