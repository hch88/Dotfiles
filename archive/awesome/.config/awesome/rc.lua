-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
-- Declarative object management
local ruled = require("ruled")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- Load kyebindings
require('keys')

-- Load rules
require('rules')

-- Error handling
require('config.errorhandling')

-- {{{ Variable definitions
local theme_path = string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), "lambda")
beautiful.init(theme_path)
local nice = require("nice")
nice {
    titlebar_height = 30,
    titlebar_color = "#00ff00",
    titlebar_font = "SF Pro Display SemiBold 12",
    no_titlebar_maximized = true,
    button_size = 14,
    maximize_color = "#0246b5",
    close_color = "#d11717",
    floating_color = "#f542aa",
    
    -- Swap the designated buttons for resizing, and opening the context menu
    mb_resize = nice.MB_MIDDLE,
    mb_contextmenu = nice.MB_RIGHT,
    titlebar_items = {
      left = {"close", "minimize", "maximize"},
      middle = "title",
      right = "floating",
    }
}

-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor
-- }}}


-- {{{ Tag
-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.tile,
        awful.layout.suit.floating,
        awful.layout.suit.max,
    })
end)
-- }}}

screen.connect_signal("request::wallpaper", function(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end)

-- {{{ Mouse bindings
awful.mouse.append_global_mousebindings({
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewprev),
    awful.button({ }, 5, awful.tag.viewnext),
})
-- }}}

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)

-- load daemons
require("evil")

require('widgets.topbar')
require('widgets.notifications')
require('widgets.popup')

require('widgets.popup')

