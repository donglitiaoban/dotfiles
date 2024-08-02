local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.hide_tab_bar_if_only_one_tab = true

config.color_schemes = {
  ['everforest light soft'] = {
    cursor_fg =     '#F3EAD3',
    cursor_bg =     '#5C6A72',
    cursor_border = '#5C6A72',
    foreground =    '#5C6A72',
    background    = '#F3EAD3',
    selection_bg  = '#D9D3CE',
    selection_fg  = '#54433A',
    ansi = {
      '#5C6A72',
      '#F85552',
      '#8DA101',
      '#DFA000',
      '#3A94C5',
      '#DF69BA',
      '#35A77C',
      '#D8D3BA',
    },
    brights = {
      '#5C6A72',
      '#F85552',
      '#8DA101',
      '#DFA000',
      '#3A94C5',
      '#DF69BA',
      '#35A77C',
      '#D8D3BA',
    },
  },
}

-- local function get_appearance()
--   if wezterm.gui then
--     return wezterm.gui.get_appearance()
--   end
--   return 'Dark'
-- end
-- 
-- local function scheme_for_appearance(appearance)
--   if appearance:find 'Dark' then
--     return 'melange dark'
--   else
--     return 'everforest light soft'
--   end
-- end

-- config.color_scheme = scheme_for_appearance(get_appearance())

config.color_scheme = 'everforest light soft'

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

  config.font_size = 12
  config.line_height = 1.2
  config.font = wezterm.font_with_fallback {
    'FiraCode Nerd Font Mono',
    -- 'JetBrainsMono Nerd Font Mono',
    {
      family = '思源等宽',
      scale = 1.18,
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
  config.font_size = 12
  -- config.font = wezterm.font 'Maple Mono SC NF'
  config.font = wezterm.font_with_fallback {
    'FiraCode Nerd Font Mono',
    {
      family = 'Source Han Sans CN',
      scale = 1.18,
    },
  }
  end
return config
