local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local gears = require("gears")
local dpi = require('beautiful').xresources.apply_dpi

local battery_widget = {}

local icon_widget = wibox.widget {
    font = "SF Pro Display 12",
    widget = wibox.widget.textbox,
}
local level_widget = wibox.widget {
    markup = "0%", 
    font = "SF Pro Display 12",
    widget = wibox.widget.textbox
}

battery_widget = wibox.widget {
    icon_widget,
    level_widget,
    spacing = dpi(4),
    layout = wibox.layout.fixed.horizontal,
}

awesome.connect_signal("evil::battery", function(battery)
    icon_widget.markup = "<span foreground='#fefefe'>"..battery.image.."</span>"
    level_widget.markup = "<span foreground='#fefefe'>"..battery.value.."%</span>"
end)

return battery_widget
