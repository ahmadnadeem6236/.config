-- -- Pull in the wezterm API
-- local wezterm = require("wezterm")
-- local utf8 = require("utf8")
-- local os = require("os")
-- -- This table will hold the configuration.
-- local dimmer = { brightness = 0.1 }
-- -- wezterm config

-- local config = {}

-- -- In newer versions of wezterm, use the config_builder which will
-- -- help provide clearer error messages
-- if wezterm.config_builder then
-- 	config = wezterm.config_builder()
-- end
-- -- For example, changing the color scheme:
-- config.color_scheme = "rose-pine"

-- config.font = wezterm.font("Hack Nerd Font")
-- config.font_size = 15

-- -- config.window_background_opacity = 0.9
-- -- config.macos_window_background_blur = 60

-- config.native_macos_fullscreen_mode = true
-- config.inactive_pane_hsb = {
-- 	saturation = 0.24,
-- 	brightness = 0.5,
-- }

-- config.background = {
-- 	-- This is the deepest/back-most layer. It will be rendered first
-- 	{
-- 		source = {
-- 			File = wezterm.config_dir .. "/background/image5.png",
-- 		},
-- 		-- The texture tiles vertically but not horizontally.
-- 		-- When we repeat it, mirror it so that it appears "more seamless".
-- 		-- An alternative to this is to set `width = "100%"` and have
-- 		-- it stretch across the display
-- 		repeat_x = "NoRepeat",
-- 		hsb = dimmer,
-- 		-- When the viewport scrolls, move this layer 10% of the number of
-- 		-- pixels moved by the main viewport. This makes it appear to be
-- 		-- further behind the text.
-- 	},
-- }

-- config.window_decorations = "RESIZE"

-- config.window_padding = {
-- 	left = 2,
-- 	right = 1,
-- 	top = 2,
-- 	bottom = 2,
-- }
-- config.initial_rows = 30
-- config.initial_cols = 90

-- -- tmux
-- config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
-- config.keys = {
-- 	{
-- 		mods = "LEADER",
-- 		key = "c",
-- 		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "x",
-- 		action = wezterm.action.CloseCurrentPane({ confirm = true }),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "b",
-- 		action = wezterm.action.ActivateTabRelative(-1),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "n",
-- 		action = wezterm.action.ActivateTabRelative(1),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "|",
-- 		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "-",
-- 		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
-- 	},
-- 	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
-- 	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
-- 	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
-- 	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
-- 	{ key = "q", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
-- 	{
-- 		mods = "LEADER",
-- 		key = "LeftArrow",
-- 		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "RightArrow",
-- 		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "DownArrow",
-- 		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "UpArrow",
-- 		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "m",
-- 		action = wezterm.action.TogglePaneZoomState,
-- 	},
-- }

-- for i = 0, 9 do
-- 	-- leader + number to activate that tab
-- 	table.insert(config.keys, {
-- 		key = tostring(i),
-- 		mods = "LEADER",
-- 		action = wezterm.action.ActivateTab(i),
-- 	})
-- end

-- -- tab bar
-- config.hide_tab_bar_if_only_one_tab = false
-- config.tab_bar_at_bottom = true
-- config.use_fancy_tab_bar = false
-- config.tab_and_split_indices_are_zero_based = true

-- -- tmux status
-- -- wezterm.on("update-right-status", function(window, _)
-- -- 	local SOLID_LEFT_ARROW = ""
-- -- 	local ARROW_FOREGROUND = { Foreground = { Color = "#c6a0f6" } }
-- -- 	local prefix = ""

-- -- 	if window:leader_is_active() then
-- -- 		prefix = " " .. utf8.char(0x1f30a) -- ocean wave
-- -- 		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
-- -- 	end

-- -- 	if window:active_tab():tab_id() ~= 0 then
-- -- 		ARROW_FOREGROUND = { Foreground = { Color = "#1e1030" } }
-- -- 	end -- arrow color based on if tab is first pane

-- -- 	window:set_left_status(wezterm.format({
-- -- 		{ Background = { Color = "#b7bdf8" } },
-- -- 		{ Text = prefix },
-- -- 		ARROW_FOREGROUND,
-- -- 		{ Text = SOLID_LEFT_ARROW },
-- -- 	}))
-- -- end)

-- -- Tab bar
-- -- I don't like the look of "fancy" tab bar
-- config.use_fancy_tab_bar = false
-- config.status_update_interval = 1000
-- config.tab_bar_at_bottom = true
-- wezterm.on("update-status", function(window, pane)
-- 	-- Workspace name
-- 	local stat = window:active_workspace()
-- 	local stat_color = "#f7768e"
-- 	-- It's a little silly to have workspace name all the time
-- 	-- Utilize this to display LDR or current key table name
-- 	if window:active_key_table() then
-- 		stat = window:active_key_table()
-- 		stat_color = "#7dcfg4"
-- 	end
-- 	if window:leader_is_active() then
-- 		stat = "LDR"
-- 		stat_color = "#bb9af7"
-- 	end

-- 	local basename = function(s)
-- 		-- Nothing a little regex can't fix
-- 		return string.gsub(s, "(.*[/\\])(.*)", "%2")
-- 	end

-- 	-- Current working directory
-- 	local cwd = pane:get_current_working_dir()
-- 	if cwd then
-- 		if type(cwd) == "userdata" then
-- 			-- Wezterm introduced the URL object in 20240127-113634-bbcac864
-- 			cwd = basename(cwd.file_path)
-- 		else
-- 			-- 20230712-072601-f4abf8fd or earlier version
-- 			cwd = basename(cwd)
-- 		end
-- 	else
-- 		cwd = ""
-- 	end

-- 	-- Current command
-- 	local cmd = pane:get_foreground_process_name()
-- 	-- CWD and CMD could be nil (e.g. viewing log using Ctrl-Alt-l)
-- 	cmd = cmd and basename(cmd) or ""

-- 	-- Time
-- 	local time = wezterm.strftime("%H:%M")

-- 	-- Left status (left of the tab line)
-- 	window:set_left_status(wezterm.format({
-- 		{ Foreground = { Color = stat_color } },
-- 		{ Text = "  " },
-- 		{ Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
-- 		{ Text = " |" },
-- 	}))

-- 	-- Right status
-- 	window:set_right_status(wezterm.format({
-- 		-- Wezterm has a built-in nerd fonts
-- 		-- https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
-- 		{ Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
-- 		{ Text = " | " },
-- 		{ Foreground = { Color = "#e0af68" } },
-- 		{ Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
-- 		"ResetAttributes",
-- 		{ Text = " | " },
-- 		{ Text = wezterm.nerdfonts.md_clock .. "  " .. time },
-- 		{ Text = "  " },
-- 	}))
-- end)

-- -- and finally, return the configuration to wezterm
-- return config

local wezterm = require("wezterm")
local act = wezterm.action
local session_manager = require("wezterm-session-manager/session-manager")

wezterm.on("save_session", function(window)
	session_manager.save_state(window)
end)
wezterm.on("load_session", function(window)
	session_manager.load_state(window)
end)
wezterm.on("restore_session", function(window)
	session_manager.restore_state(window)
end)

local function is_vim(pane)
	-- this is set by the plugin, and unset on ExitPre in Neovim
	return pane:get_user_vars().IS_NVIM == "true"
end

local direction_keys = {
	Left = "h",
	Down = "j",
	Up = "k",
	Right = "l",
	-- reverse lookup
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "META" or "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

-- local dimmer = { brightness = 0.1 }
local config = {}
-- Use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Settings

config.color_scheme = "Tokyo Night"
-- config.window_background_opacity = 0.7
-- config.macos_window_background_blur = 30
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 15

config.max_fps = 120

config.initial_rows = 30
config.initial_cols = 90
-- config.background = {
-- 	-- This is the deepest/back-most layer. It will be rendered first
-- 	{
-- 		source = {
-- 			File = wezterm.config_dir .. "/background/image5.png",
-- 		},
-- 		-- The texture tiles vertically but not horizontally.
-- 		-- When we repeat it, mirror it so that it appears "more seamless".
-- 		-- An alternative to this is to set `width = "100%"` and have
-- 		-- it stretch across the display
-- 		repeat_x = "NoRepeat",
-- 		hsb = dimmer,
-- 		-- When the viewport scrolls, move this layer 10% of the number of
-- 		-- pixels moved by the main viewport. This makes it appear to be
-- 		-- further behind the text.
-- 	},
-- }

config.window_padding = {
	left = 2,
	right = 1,
	top = 20,
	bottom = 10,
}
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "main"

-- Dim inactive panes
config.inactive_pane_hsb = {
	saturation = 0.24,
	brightness = 0.5,
}

-- Keys
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- Send C-a when pressing C-a twice
	{ key = "a", mods = "LEADER|CTRL", action = act.SendKey({ key = "a", mods = "CTRL" }) },
	{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = "phys:Space", mods = "LEADER", action = act.ActivateCommandPalette },

	--Session Manager
	{ key = "S", mods = "LEADER", action = wezterm.action({ EmitEvent = "save_session" }) },
	{ key = "L", mods = "LEADER", action = wezterm.action({ EmitEvent = "load_session" }) },
	{ key = "R", mods = "LEADER", action = wezterm.action({ EmitEvent = "restore_session" }) },

	{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "|", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	-- { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	-- { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	-- { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	-- { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	-- move between split panes
	split_nav("move", "h"),
	split_nav("move", "j"),
	split_nav("move", "k"),
	split_nav("move", "l"),
	-- resize panes
	split_nav("resize", "h"),
	split_nav("resize", "j"),
	split_nav("resize", "k"),
	split_nav("resize", "l"),

	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "o", mods = "LEADER", action = act.RotatePanes("Clockwise") },
	-- We can make separate keybindings for resizing panes
	-- But Wezterm offers custom "mode" in the name of "KeyTable"
	-- {
	-- 	key = "r",
	-- 	mods = "LEADER",
	-- 	action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }),
	-- },

	-- Tab keybindings
	{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "[", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "]", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "n", mods = "LEADER", action = act.ShowTabNavigator },
	{
		key = "e",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Renaming Tab Title...:" },
			}),
			action = wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	-- Key table for moving tabs around
	{ key = "m", mods = "LEADER", action = act.ActivateKeyTable({ name = "move_tab", one_shot = false }) },
	-- Or shortcuts to move tab w/o move_tab table. SHIFT is for when caps lock is on
	{ key = "{", mods = "LEADER|SHIFT", action = act.MoveTabRelative(-1) },
	{ key = "}", mods = "LEADER|SHIFT", action = act.MoveTabRelative(1) },

	-- Lastly, workspace
	{ key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
}
-- I can use the tab navigator (LDR t), but I also want to quickly navigate tabs with index
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end

config.key_tables = {
	-- resize_pane = {
	-- 	{ key = "h", action = act.adjustpanesize({ "left", 1 }) },
	-- 	{ key = "j", action = act.adjustpanesize({ "down", 1 }) },
	-- 	{ key = "k", action = act.adjustpanesize({ "up", 1 }) },
	-- 	{ key = "l", action = act.adjustpanesize({ "right", 1 }) },
	-- 	{ key = "escape", action = "popkeytable" },
	-- 	{ key = "enter", action = "popkeytable" },
	-- },
	move_tab = {
		{ key = "h", action = act.MoveTabRelative(-1) },
		{ key = "j", action = act.MoveTabRelative(-1) },
		{ key = "k", action = act.MoveTabRelative(1) },
		{ key = "l", action = act.MoveTabRelative(1) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}

-- Tab bar
-- I don't like the look of "fancy" tab bar
config.use_fancy_tab_bar = false
config.status_update_interval = 1000
config.tab_bar_at_bottom = true
wezterm.on("update-status", function(window, pane)
	-- Workspace name
	local stat = window:active_workspace()
	local stat_color = "#f7768e"
	-- It's a little silly to have workspace name all the time
	-- Utilize this to display LDR or current key table name
	if window:active_key_table() then
		stat = window:active_key_table()
		stat_color = "#7dcfff"
	end
	if window:leader_is_active() then
		stat = "LDR"
		stat_color = "#bb9af7"
	end

	local basename = function(s)
		-- Nothing a little regex can't fix
		return string.gsub(s, "(.*[/\\])(.*)", "%2")
	end

	-- Current working directory
	local cwd = pane:get_current_working_dir()
	if cwd then
		if type(cwd) == "userdata" then
			-- Wezterm introduced the URL object in 20240127-113634-bbcac864
			cwd = basename(cwd.file_path)
		else
			-- 20230712-072601-f4abf8fd or earlier version
			cwd = basename(cwd)
		end
	else
		cwd = ""
	end

	-- Current command
	local cmd = pane:get_foreground_process_name()
	-- CWD and CMD could be nil (e.g. viewing log using Ctrl-Alt-l)
	cmd = cmd and basename(cmd) or ""

	-- Time
	local time = wezterm.strftime("%H:%M")

	-- Left status (left of the tab line)
	window:set_left_status(wezterm.format({
		{ Foreground = { Color = stat_color } },
		{ Text = "  " },
		{ Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
		{ Text = " |" },
	}))

	-- Right status
	window:set_right_status(wezterm.format({
		-- Wezterm has a built-in nerd fonts
		-- https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
		{ Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
		{ Text = " | " },
		{ Foreground = { Color = "#e0af68" } },
		{ Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
		"ResetAttributes",
		{ Text = " | " },
		{ Text = wezterm.nerdfonts.md_clock .. "  " .. time },
		{ Text = "  " },
	}))
end)

--[[ Appearance setting for when I need to take pretty screenshots
config.enable_tab_bar = false
config.window_padding = {
  left = '0.5cell',
  right = '0.5cell',
  top = '0.5cell',
  bottom = '0cell',

}
--]]

return config
