local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Basic WSL configuration
config.default_prog = {'wsl.exe', '~'}
config.default_cwd = "~"

-- Appearance
config.font = wezterm.font('JetBrains Mono')
config.font_size = 11.0
config.line_height = 1.2
config.cell_width = 0.9

-- Color scheme and transparency
config.color_scheme = 'Catppuccin Mocha'
config.window_background_opacity = 0.85
config.window_background_gradient = {
  orientation = 'Vertical',
  colors = {
    '#1a1b26',
    '#1a1b26',
  },
  interpolation = 'Linear',
  blend = 'Rgb',
}

-- Keybindings for pane management
config.keys = {
  -- Split panes
  {
    key = '|',
    mods = 'SHIFT|ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '_',
    mods = 'SHIFT|ALT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },

  -- Navigate between panes using arrow keys
  {
    key = 'LeftArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },

  -- Resize panes using ALT+SHIFT+Arrow keys
  {
    key = 'LeftArrow',
    mods = 'ALT|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Left', 5 },
  },
  {
    key = 'RightArrow',
    mods = 'ALT|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Right', 5 },
  },
  {
    key = 'UpArrow',
    mods = 'ALT|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Up', 5 },
  },
  {
    key = 'DownArrow',
    mods = 'ALT|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Down', 5 },
  },

  -- Close current pane
  {
    key = 'w',
    mods = 'ALT',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
}

-- Rest of your existing configuration
config.enable_scroll_bar = false
config.scrollback_lines = 10000
config.colors = {
  scrollbar_thumb = '#666666',
  background = '#000000',
  cursor_bg = '#c0caf5',
  cursor_border = '#c0caf5',
  cursor_fg = '#1a1b26',
  selection_bg = 'rgba(128, 128, 128, 0.3)',
  selection_fg = 'none',
}

config.window_padding = {
  left = 20,
  right = 20,
  top = 20,
  bottom = 20,
}

config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.window_close_confirmation = "NeverPrompt"

config.default_cursor_style = 'SteadyBar'
config.cursor_blink_rate = 500
config.animation_fps = 60

return config
