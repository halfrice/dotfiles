local wezterm = require('wezterm')
local config = wezterm.config_builder()

-- Start in fullscreen
wezterm.on('gui-startup', function(cmd)
  -- vars: tab, pane, window
  local _, _, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- Navigation between nvim and wezterm splits
-- https://dev.to/lovelindhoni/make-wezterm-mimic-tmux-5893
local function is_vim(pane)
  return pane:get_user_vars().IS_NVIM == 'true'
end

local direction_keys = {
  k = 'Up',
  j = 'Down',
  h = 'Left',
  l = 'Right',
}

-- Handle command to navigate between panes or resize the active pane
local function split_nav(resize_or_move, key)
  return {
    key = key,
    mods = resize_or_move == 'resize' and 'CTRL|SHIFT' or 'CTRL',

    action = wezterm.action_callback(function(win, pane)
      if is_vim(pane) then
        win:perform_action({
          SendKey = { key = key, mods = resize_or_move == 'resize' and 'CTRL|SHIFT' or 'CTRL' },
        }, pane)
      else
        if resize_or_move == 'resize' then
          win:perform_action({ AdjustPaneSize = { direction_keys[key], 5 } }, pane)
        else
          win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
        end
      end
    end),
  }
end

-- Colors
config.color_scheme = 'Tokyo Night'
config.term = 'xterm-256color'

-- Fonts
config.font_size = 18
config.font = wezterm.font_with_fallback({
  { family = 'UbuntuMono Nerd Font', scale = 1.0 },
})
config.adjust_window_size_when_changing_font_size = false

-- Tabs
-- config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- Windows
config.window_background_opacity = 0.80
config.macos_window_background_blur = 64
config.window_decorations = 'RESIZE'
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.inactive_pane_hsb = {
  saturation = 1,
  brightness = 1,
}

-- Cursor
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 438 -- Tempo 🎧
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

-- Keybinds
-- Show default keybinds command: wezterm show-keys --lua
local act = wezterm.action
config.leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 2000 }
config.keys = {
  -- Navigation between nvim and wezterm splits
  -- Move between active panes
  split_nav('move', 'h'),
  split_nav('move', 'j'),
  split_nav('move', 'k'),
  split_nav('move', 'l'),
  -- Resize active pane
  split_nav('resize', 'h'),
  split_nav('resize', 'j'),
  split_nav('resize', 'k'),
  split_nav('resize', 'l'),
  -- Maximize active pane
  { key = 'm', mods = 'LEADER', action = act.TogglePaneZoomState },
  -- Close active pane
  -- { key = 'w', mods = 'CTRL|SHIFT', action = act.CloseCurrentPane({ confirm = true }) },
  -- Remove default keybind for CloseCurrentPane
  { key = 'w', mods = 'CTRL|SHIFT', action = wezterm.action.DisableDefaultAssignment },
  -- { key = 'k', mods = 'CTRL', action = act.ActivatePaneDirection('Up') },
  -- { key = 'j', mods = 'CTRL', action = act.ActivatePaneDirection('Down') },
  -- { key = 'h', mods = 'CTRL', action = act.ActivatePaneDirection('Left') },
  -- { key = 'l', mods = 'CTRL', action = act.ActivatePaneDirection('Right') },
  -- { key = 'h', mods = 'CTRL|SHIFT', action = act.AdjustPaneSize({ 'Left', 5 }) },
  -- { key = 'l', mods = 'CTRL|SHIFT', action = act.AdjustPaneSize({ 'Right', 5 }) },
  -- { key = 'j', mods = 'CTRL|SHIFT', action = act.AdjustPaneSize({ 'Down', 5 }) },
  -- { key = 'k', mods = 'CTRL|SHIFT', action = act.AdjustPaneSize({ 'Up', 5 }) },
  -- Tabs
  { key = 'c', mods = 'LEADER', action = act.SpawnTab('CurrentPaneDomain') },
  { key = 'p', mods = 'LEADER', action = act.ActivateTabRelative(-1) },
  { key = 'n', mods = 'LEADER', action = act.ActivateTabRelative(1) },
  -- Vi-mode (CTRL-C to exit)
  { key = '[', mods = 'LEADER', action = act.ActivateCopyMode },
  -- Rename tab interactively
  {
    key = ',',
    mods = 'LEADER',
    action = act.PromptInputLine({
      description = 'Enter new name for tab',
      action = wezterm.action_callback(function(window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:active_tab():set_title(line)
        end
      end),
    }),
  },
}

return config
