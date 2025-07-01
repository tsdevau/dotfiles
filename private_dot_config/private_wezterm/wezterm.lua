local wezterm = require("wezterm")
local config = wezterm.config_builder()
local wezbar = wezterm.plugin.require("https://github.com/tsdevau/wezbar")

-- Colour Palette and Styling
config.window_background_opacity = 0.9
config.text_background_opacity = 1.0
config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.6,
}
config.window_padding = {
	left = "4px",
	right = "4px",
	top = "4px",
	bottom = "4px",
}
-- config.window_decorations = "RESIZE"
config.native_macos_fullscreen_mode = false
config.macos_window_background_blur = 0
config.hide_tab_bar_if_only_one_tab = false
config.tab_max_width = 32
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false

local mocha_palette = {
	rosewater = "#f5e0dc",
	flamingo = "#f2cdcd",
	pink = "#f5c2e7",
	mauve = "#cba6f7",
	red = "#f38ba8",
	maroon = "#eba0ac",
	peach = "#fab387",
	yellow = "#f9e2af",
	green = "#a6e3a1",
	teal = "#94e2d5",
	sky = "#89dceb",
	sapphire = "#74c7ec",
	blue = "#89b4fa",
	lavender = "#b4befe",
	text = "#cdd6f4",
	subtext1 = "#bac2de",
	subtext0 = "#a6adc8",
	overlay2 = "#9399b2",
	overlay1 = "#7f849c",
	overlay0 = "#6c7086",
	surface2 = "#585b70",
	surface1 = "#45475a",
	surface0 = "#313244",
	base = "#1e1e2e",
	mantle = "#181825",
	crust = "#11111b",
}

local mocha = wezterm.get_builtin_color_schemes()["Catppuccin Mocha"]
mocha.background = mocha_palette.crust
mocha.compose_cursor = mocha_palette.red
mocha.cursor_bg = mocha_palette.rosewater
mocha.cursor_border = mocha_palette.rosewater
mocha.cursor_fg = mocha_palette.crust
mocha.foreground = mocha_palette.text
mocha.scrollbar_thumb = mocha_palette.surface2
mocha.selection_bg = mocha_palette.surface2
mocha.selection_fg = mocha_palette.text
mocha.split = mocha_palette.overlay0
mocha.visual_bell = mocha_palette.red

mocha.ansi = {
	mocha_palette.surface1,
	mocha_palette.red,
	mocha_palette.green,
	mocha_palette.yellow,
	mocha_palette.blue,
	mocha_palette.mauve,
	mocha_palette.teal,
	mocha_palette.subtext1,
}

mocha.brights = {
	mocha_palette.surface2,
	mocha_palette.red,
	mocha_palette.green,
	mocha_palette.yellow,
	mocha_palette.blue,
	mocha_palette.mauve,
	mocha_palette.teal,
	mocha_palette.text,
}

mocha.indexed = {
	[17] = mocha_palette.peach,
	[18] = mocha_palette.rosewater,
}

mocha.tab_bar = {
	background = mocha_palette.base,
	inactive_tab_edge = mocha_palette.base,
	active_tab = {
		bg_color = mocha_palette.blue,
		fg_color = mocha_palette.crust,
		intensity = "Bold",
		italic = false,
		strikethrough = false,
		underline = "None",
	},
	inactive_tab = {
		bg_color = mocha_palette.surface0,
		fg_color = mocha_palette.text,
		intensity = "Half",
		italic = false,
		strikethrough = false,
		underline = "None",
	},
	inactive_tab_hover = {
		bg_color = mocha_palette.surface0,
		fg_color = mocha_palette.text,
		intensity = "Bold",
		italic = false,
		strikethrough = false,
		underline = "None",
	},
	new_tab = {
		bg_color = mocha_palette.surface0,
		fg_color = mocha_palette.green,
		intensity = "Bold",
		italic = false,
		strikethrough = false,
		underline = "None",
	},
	new_tab_hover = {
		bg_color = mocha_palette.surface0,
		fg_color = mocha_palette.green,
		intensity = "Bold",
		italic = false,
		strikethrough = false,
		underline = "None",
	},
}

config.color_schemes = {
	["Catppuccin Mocha"] = mocha,
}

config.colors = mocha

-- Font Configuration
config.window_frame = {
	font = wezterm.font({ family = "Helvetica Neue" }),
	font_size = 16.0,
	active_titlebar_bg = mocha_palette.base,
	inactive_titlebar_bg = mocha_palette.base,
	active_titlebar_border_bottom = mocha_palette.text,
	inactive_titlebar_border_bottom = mocha_palette.text,
}

config.font = wezterm.font_with_fallback({
	{ family = "MesloLGM Nerd Font Mono" },
	{ family = "JetBrainsMono Nerd Font Mono" },
})
config.font_size = 16.0
config.font_rules = {
	{
		intensity = "Bold",
		font = wezterm.font_with_fallback({ family = "MesloLGM Nerd Font Mono", weight = "Bold" }),
	},
	{
		italic = true,
		font = wezterm.font_with_fallback({ family = "MesloLGM Nerd Font Mono", style = "Italic" }),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font_with_fallback({ family = "MesloLGM Nerd Font Mono", weight = "Bold", style = "Italic" }),
	},
	{
		intensity = "Half",
		italic = false,
		font = wezterm.font_with_fallback({ family = "MesloLGM Nerd Font Mono", weight = "Light" }),
	},
	{
		intensity = "Half",
		italic = true,
		font = wezterm.font_with_fallback({ family = "MesloLGM Nerd Font Mono", weight = "Light", style = "Italic" }),
	},
}

-- Cursor Configuration
config.default_cursor_style = "BlinkingBar"
config.cursor_thickness = 2
config.cursor_blink_rate = 600

-- Shell Configuration

config.default_prog = { "/opt/homebrew/bin/zsh" }
config.scrollback_lines = 100000

-- Other Options
config.audible_bell = "Disabled"
config.automatically_reload_config = true
config.exit_behavior = "CloseOnCleanExit"
config.window_close_confirmation = "NeverPrompt"
config.selection_word_boundary = " \t\n{}[]()\"'-"
config.enable_kitty_keyboard = true
config.use_dead_keys = false
config.enable_csi_u_key_encoding = true
-- Fix for NixPkgs build crashing just after startup (https://github.com/wezterm/wezterm/issues/6731) -- Didn't resolve the issue for me
-- config.warn_about_missing_glyphs = false
-- Same issue as above, but this is a chatGPT suggestion because the update check is being called on a background thread -- This did resolve the crash issue for me
config.check_for_updates = false
-- config.check_for_updates_interval_seconds = 86400

config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 2000 }

config.keys = {
	-- Mux Session Management
	{ key = "w", mods = "CTRL|SHIFT", action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
	{ key = "[", mods = "CTRL|SHIFT", action = wezterm.action.SwitchWorkspaceRelative(-1) },
	{ key = "]", mods = "CTRL|SHIFT", action = wezterm.action.SwitchWorkspaceRelative(1) },
	{
		key = "r",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for workspace",
			action = wezterm.action_callback(function(_, _, line)
				local current_ws = wezterm.mux.get_active_workspace()
				if line and current_ws then
					wezterm.mux.rename_workspace(current_ws, line)
				end
			end),
		}),
	},

	-- Tab Management
	{ key = "t", mods = "CMD", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "CMD", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
	{ key = "w", mods = "CMD|ALT", action = wezterm.action.CloseCurrentTab({ confirm = false }) },

	-- Tab Navigation
	{ key = "1", mods = "CMD", action = wezterm.action.ActivateTab(0) },
	{ key = "2", mods = "CMD", action = wezterm.action.ActivateTab(1) },
	{ key = "3", mods = "CMD", action = wezterm.action.ActivateTab(2) },
	{ key = "4", mods = "CMD", action = wezterm.action.ActivateTab(3) },
	{ key = "5", mods = "CMD", action = wezterm.action.ActivateTab(4) },
	{ key = "6", mods = "CMD", action = wezterm.action.ActivateTab(5) },
	{ key = "7", mods = "CMD", action = wezterm.action.ActivateTab(6) },
	{ key = "8", mods = "CMD", action = wezterm.action.ActivateTab(7) },
	{ key = "9", mods = "CMD", action = wezterm.action.ActivateLastTab },
	{ key = "1", mods = "LEADER", action = wezterm.action.ActivateTab(0) },
	{ key = "2", mods = "LEADER", action = wezterm.action.ActivateTab(1) },
	{ key = "3", mods = "LEADER", action = wezterm.action.ActivateTab(2) },
	{ key = "4", mods = "LEADER", action = wezterm.action.ActivateTab(3) },
	{ key = "5", mods = "LEADER", action = wezterm.action.ActivateTab(4) },
	{ key = "6", mods = "LEADER", action = wezterm.action.ActivateTab(5) },
	{ key = "7", mods = "LEADER", action = wezterm.action.ActivateTab(6) },
	{ key = "8", mods = "LEADER", action = wezterm.action.ActivateTab(7) },
	{ key = "9", mods = "LEADER", action = wezterm.action.ActivateLastTab },
	{ key = "[", mods = "CMD|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "]", mods = "CMD|SHIFT", action = wezterm.action.ActivateTabRelative(1) },
	{ key = "Tab", mods = "CTRL", action = wezterm.action.ActivateTabRelative(1) },
	{ key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },

	-- Pane Management
	{
		key = "d",
		mods = "CMD",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "d",
		mods = "CMD|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{ key = "[", mods = "CMD|ALT", action = wezterm.action.ActivatePaneDirection("Prev") },
	{ key = "]", mods = "CMD|ALT", action = wezterm.action.ActivatePaneDirection("Next") },
	{ key = "H", mods = "CMD|ALT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "L", mods = "CMD|ALT", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "Enter", mods = "CMD|ALT", action = wezterm.action.TogglePaneZoomState },
	{ key = "=", mods = "CMD|ALT", action = wezterm.action.PaneSelect({ mode = "Activate" }) },

	-- Pane Resizing
	{ key = "LeftArrow", mods = "CMD|ALT", action = wezterm.action.AdjustPaneSize({ "Left", 10 }) },
	{ key = "RightArrow", mods = "CMD|ALT", action = wezterm.action.AdjustPaneSize({ "Right", 10 }) },
	{ key = "UpArrow", mods = "CMD|ALT", action = wezterm.action.AdjustPaneSize({ "Up", 10 }) },
	{ key = "DownArrow", mods = "CMD|ALT", action = wezterm.action.AdjustPaneSize({ "Down", 10 }) },

	-- Window Management
	{ key = "n", mods = "CMD", action = wezterm.action.SpawnWindow },
	{ key = "q", mods = "CMD", action = wezterm.action.QuitApplication },
	{ key = "f", mods = "CMD|CTRL", action = wezterm.action.ToggleFullScreen },

	-- Font Size
	{ key = "=", mods = "CMD", action = wezterm.action.IncreaseFontSize },
	{ key = "+", mods = "CMD", action = wezterm.action.IncreaseFontSize },
	{ key = "-", mods = "CMD", action = wezterm.action.DecreaseFontSize },
	{ key = "0", mods = "CMD", action = wezterm.action.ResetFontSize },

	-- Copy/Paste
	-- { key = "c", mods = "CMD", action = wezterm.action.CopyTo("Clipboard") },
	-- { key = "v", mods = "CMD", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "a", mods = "CMD", action = wezterm.action.ActivateCopyMode },

	-- Navigation
	{ key = "LeftArrow", mods = "CMD", action = wezterm.action.SendKey({ key = "Home" }) },
	{ key = "RightArrow", mods = "CMD", action = wezterm.action.SendKey({ key = "End" }) },
	{ key = "LeftArrow", mods = "ALT", action = wezterm.action.SendString("\x1bb") },
	{ key = "RightArrow", mods = "ALT", action = wezterm.action.SendString("\x1bf") },
	{ key = "Backspace", mods = "CMD", action = wezterm.action.SendString("\x1b[1;\x08") },
	{ key = "Delete", mods = "", action = wezterm.action.SendString("\x1b[3~") },
	{ key = "Delete", mods = "CMD", action = wezterm.action.SendKey({ key = "k", mods = "CTRL" }) },
	{ key = "k", mods = "CMD|SHIFT", action = wezterm.action.SendString("\x1b[1;[4;k") },
	{ key = "Delete", mods = "ALT", action = wezterm.action.SendKey({ key = "d", mods = "ALT" }) },

	-- Scrolling
	{ key = "UpArrow", mods = "CMD", action = wezterm.action.ScrollToTop },
	{ key = "DownArrow", mods = "CMD", action = wezterm.action.ScrollToBottom },
	{ key = "Home", mods = "", action = wezterm.action.SendKey({ key = "Home" }) },
	{ key = "End", mods = "", action = wezterm.action.SendKey({ key = "End" }) },
	{ key = "PageUp", mods = "", action = wezterm.action.SendKey({ key = "PageUp" }) },
	{ key = "PageDown", mods = "", action = wezterm.action.SendKey({ key = "PageDown" }) },
	{ key = "Tab", mods = "SHIFT", action = wezterm.action.SendKey({ key = "Tab", mods = "SHIFT" }) },

	-- Other Keys
	{
		key = ",",
		mods = "CMD",
		action = wezterm.action.SpawnCommandInNewTab({
			cwd = os.getenv("WEZTERM_CONFIG_DIR"),
			args = { os.getenv("SHELL"), "-c", "$EDITOR $WEZTERM_CONFIG_FILE" },
		}),
	},
	{
		key = "u",
		mods = "LEADER",
		action = wezterm.action_callback(function(_, _)
			local success, _ = pcall(wezterm.plugin.update_all())
			if success then
				wezterm.reload_configuration()
			end
		end),
	},
	{ key = ",", mods = "CMD|SHIFT", action = wezterm.action.ReloadConfiguration },
	{ key = "p", mods = "CMD|SHIFT", action = wezterm.action.ActivateCommandPalette },
}

wezterm.on("gui-startup", function(cmd)
	local cmd_args = { os.getenv("SHELL"), "-l", "-c", "yazi" }

	if cmd then
		cmd_args = cmd.args
	end

	local tab, _, window = wezterm.mux.spawn_window({
		workspace = "tsdevau",
		cwd = wezterm.home_dir,
		args = cmd_args,
	})

	window:spawn_tab({
		cwd = wezterm.home_dir,
	})

	tab:activate()
end)

-- Tab bar init
wezbar.setup({
	options = {
		theme = mocha,
		section_separators = "",
		component_separators = "",
		tab_separators = "",
	},
})

return config
