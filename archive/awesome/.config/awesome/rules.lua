-- Declarative object management
-- Standard awesome library
local awful = require("awful")
-- Declarative object management
local ruled = require("ruled")
local beautiful = require("beautiful")

-- Get screen geometry
-- I am using a single screen setup and I assume that screen geometry will not
-- change during the session.
screen_width = awful.screen.focused().geometry.width
screen_height = awful.screen.focused().geometry.height

-- Add titlebars to normal clients and dialogs
ruled.client.append_rule {
    id         = "titlebars",
    rule_any   = { type = { "normal", "dialog" } },
    properties = { titlebars_enabled = true      }
}

-- A-- Rules to apply to new clients.
ruled.client.connect_signal("request::rules", function()
    -- All clients will match this rule.
    ruled.client.append_rule {
        id         = "global",
        rule       = { },
        properties = {
            focus     = awful.client.focus.filter,
            raise     = true,
            screen    = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    }

    -- Floating clients.
    ruled.client.append_rule {
        id       = "floating",
        rule_any = {
            instance = { "copyq", "pinentry" },
            class    = {
                "Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv",
                "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer", "mpv"
            },
            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name    = {
                "Event Tester",  -- xev.
            },
            role    = {
                "AlarmWindow",    -- Thunderbird's calendar.
                "ConfigManager",  -- Thunderbird's about:config.
                "pop-up",         -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = { floating = true }
    }

    ruled.client.append_rule {
        rule       = { class = "qBittorrent"     },
        properties = { tag = "6" }
    }
    ruled.client.append_rule {
        rule       = { class = "Firefox"     },
        properties = { tag = "2" }
    }
    ruled.client.append_rule {
        rule       = { class = "Chromium"     },
        properties = { tag = "3" }
    }

    ruled.client.append_rule {
        rule = { class = "mpv" },
        properties = { },
        callback = function (c)
            -- Make it floating, ontop and move it out of the way if the current tag is maximized
            c.floating = true
            c.ontop = true
            c.width = screen_width * 0.4
            c.height = screen_height * 0.5
            awful.placement.bottom_right(c, {
                honor_padding = true,
                honor_workarea = true,
                margins = { bottom = beautiful.useless_gap * 2, right = beautiful.useless_gap * 2}
            })

            -- Restore `ontop` after fullscreen is disabled
            -- Sorta tries to fix: https://github.com/awesomeWM/awesome/issues/667
            c:connect_signal("property::fullscreen", function ()
                if not c.fullscreen then
                    c.ontop = true
                end
            end)
        end
    }

end)

-- Signals
-- ===================================================================
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set every new window as a slave,
    -- i.e. put it at the end of others instead of setting it master.
    if not awesome.startup then awful.client.setslave(c) end
end)
