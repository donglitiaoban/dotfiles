local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

tabline.setup({
  options = {
    icons_enabled = false,
    theme = 'Atelier Cave Light (base16)',
    tabs_enabled = true,
    theme_overrides = {},
    section_separators = '',
    component_separators = '',
    tab_separators = ''
  },
  sections = {
    tabline_a = { 'mode' },
    -- tabline_b = { 'workspace' },
    tabline_b = { '' },
    tabline_c = { '' },
    tab_active = {
      'index',
      { 'parent', padding = 0 },
      '/',
      { 'cwd', padding = { left = 0, right = 0 } },
      { 'zoomed', padding = 0 },
    },
    tab_inactive = { 'index', { 'process', padding = { left = 0, right = 1 } } },
    -- tabline_x = { 'ram', 'cpu' },
    tabline_x = { },
    -- tabline_y = { 'datetime', 'battery' },
    tabline_y = { 'datetime' },
    tabline_z = { 'domain' },
  },
  extensions = {},
})

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.default_cursor_style = 'SteadyBar'

-- -- auto change colorscheme for light/dark mode
local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Catppuccin Mocha'
  else
    return 'Catppuccin Latte'
  end
end

config.color_scheme = scheme_for_appearance(get_appearance())

-- config.color_scheme = 'Catppuccin Latte'
-- config.color_scheme = 'Rosé Pine Dawn (Gogh)'
-- 
-- config.color_scheme = 'zenbones'

config.keys = {
  {
    key = 'F11',
    action = wezterm.action.ToggleFullScreen,
  },
  {
    -- ignore ctrl+z
    key = 'Z',
    mods = 'CTRL',
    action = wezterm.action.DisableDefaultAssignment,
  },
}

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  -- 只在scoop pwsh安装后应用
  local res = wezterm.glob('pwsh', os.getenv('USERPROFILE') .. '/scoop/apps')
  if #res ~= 0 then
    config.default_prog = { 'pwsh.exe' }
  end

  -- res = wezterm.glob('nu', os.getenv('USERPROFILE') .. '/scoop/apps')
  -- if #res ~= 0 then
  --   config.default_prog = { 'nu.exe' }
  -- end

  config.font_size = 12
  config.line_height = 1.1
  config.font = wezterm.font_with_fallback {
    'FiraCode Nerd Font Mono',
    -- 'JetBrainsMono Nerd Font Mono',
    {
      family = '思源等宽',
      scale = 1.2,
    },
  }
  -- config.font = wezterm.font 'Maple Mono SC NF'

  config.initial_rows = 26
  config.initial_cols = 90
  -- config.color_scheme = 'Atelier Cave Light (base16)'
  -- win11 Mica effect
  config.window_background_opacity = 0
  -- config.win32_system_backdrop = 'Mica'
  -- tabbed effect is mica with more transparency
  config.win32_system_backdrop = 'Tabbed'

end

if wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
  if os.execute('which zsh') == true then
    config.default_prog = { 'zsh' }
  end

  -- if os.execute('which nu') == true then
  --   config.default_prog = { 'nu' }
  -- end

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
