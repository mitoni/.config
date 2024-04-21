-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux

-- This table will hold the configuration.
local config = {}

config.default_prog = { "tmux" }
config.default_cwd = "~/dev"

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- Colors:
config.color_scheme = "Catppuccin Macchiato"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 30

-- dim unfocused panes
config.inactive_pane_hsb = {
	saturation = 1.0,
	brightness = 0.8,
}

-- Fonts
config.font_size = 12.0
config.line_height = 1.15
-- config.font_dirs = { "assets/fonts" }
config.font = wezterm.font_with_fallback({
	{
		family = "SF Mono",
		weight = "Regular",
		harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	},
})

-- Window:
-- Remove padding (Neovim would display an ugly padding around)
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.enable_scroll_bar = false
config.use_resize_increments = true
-- Remove title bar, but keep resizable border
config.window_decorations = "RESIZE"
--config.window_background_opacity = 0.95

config.enable_tab_bar = false

-- TabBar
-- config.tab_bar_at_bottom = true -- this is needed if plugin is not used
-- config.use_fancy_tab_bar = false -- this allows the color_scheme to style also tabs (w/o plugin)
-- wezterm.plugin.require("https://github.com/nekowinston/wezterm-bar").apply_to_config(config, {
-- 	position = "top",
-- 	max_width = 32,
-- 	dividers = "slant_right", -- or "slant_left", "arrows", "rounded", false
-- 	indicator = {
-- 		leader = {
-- 			enabled = true,
-- 			off = " ",
-- 			on = " ",
-- 		},
-- 		mode = {
-- 			enabled = true,
-- 			names = {
-- 				resize_mode = "RESIZE",
-- 				copy_mode = "VISUAL",
-- 				search_mode = "SEARCH",
-- 			},
-- 		},
-- 	},
-- 	tabs = {
-- 		numerals = "arabic", -- or "roman"
-- 		pane_count = "superscript", -- or "subscript", false
-- 		brackets = {
-- 			active = { "", " ◉" },
-- 			inactive = { "", " ◯" },
-- 		},
-- 	},
-- 	clock = { -- note that this overrides the whole set_right_status
-- 		enabled = false,
-- 		format = "%H:%M", -- use https://wezfurlong.org/wezterm/config/lua/wezterm.time/Time/format.html
-- 	},
-- })

-- Every time a resize occurs, save dimensions in a file and recover those when wezterm is reopened.
-- NB: multi-window is not supported. If a new window is spawned, any resize on any window will overwrite previous
-- dimensions.
local cache_dir = wezterm.config_dir
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	cache_dir = cache_dir .. "\\.cache\\"
else
	cache_dir = cache_dir .. "/.cache/"
end
local cache_window_f = cache_dir .. "window.json"

wezterm.on("gui-startup", function(cmd)
	-- Ensure cache directory exists
	os.execute("mkdir " .. cache_dir)

	-- Open cache file to recover previous dimensions
	local file = io.open(cache_window_f, "r")
	if file ~= nil then
		local cached = wezterm.json_parse(file:read("a"))
		local tab, pane, window = mux.spawn_window(cmd or { width = cached.cols, height = cached.rows })
		io.close(file)
	end
end)

wezterm.on("window-resized", function(window, pane)
	print(window:active_tab():panes_with_info())
	-- Save current dimensions to cache file
	local dimension = window:active_tab():get_size()
	local cached = { cols = dimension.cols, rows = dimension.rows }
	local file = io.open(cache_window_f, "w")
	if file ~= nil then
		io.output(file)
		io.write(wezterm.json_encode(cached))
		io.close(file)
	end
end)

-- and finally, return the configuration to wezterm
return config
