-- Provides:
-- evil::battery
--      percentage (integer)
-- evil::charger
--      plugged (boolean)

local awful = require("awful")
local naughty = require("naughty")

local update_interval = 5

-- Subscribe to power supply status changes with acpi_listen
local charger_script = [[
sh -c '
acpi_listen | grep --line-buffered ac_adapter
'
]]

local function does_start_with(String,Start)
  return string.sub(String,1,string.len(Start))==Start
end

-- First get battery file path
-- If there are multiple, only get the first one
-- TODO support multiple batteries
local command = "sh -c 'out=\"$(find /sys/class/power_supply/BAT?/capacity)\" && (echo \"$out\" | head -1) || false' "
awful.spawn.easy_async_with_shell(command, function (battery_file, _, __, exit_code)
  -- No battery file found
  if not (exit_code == 0) then
    return
  end

  -- Periodically get battery info
  awful.widget.watch("cat "..battery_file, update_interval, function(_, stdout)
    local charging = false
    local battery_status_file = string.gsub(battery_file, "capacity", "status")
    local status_command = "cat "..battery_status_file
    awful.spawn.easy_async_with_shell(status_command, function(output)
      if does_start_with(output, "Charging") then
        charging = true
      end 
      local charge = tonumber(stdout)

      if charging then
        icon = ""
      elseif (charge >= 0 and charge < 10) then
        icon = ""
        require("widgets.notifications").battery(charge)
      elseif (charge < 20) then 
        icon = ""
      elseif charge < 30 then
        icon = ""
      elseif charge < 40 then
        icon = ""
      elseif charge < 50 then
        icon = ""
      elseif charge < 60 then
        icon = ""
      elseif charge < 70 then
        icon = ""
      elseif charge < 80 then
        icon = ""
      elseif charge < 90 then
        icon = ""
      elseif charge < 100 then
        icon = ""
      else
        icon = ""
      end
      awesome.emit_signal("evil::battery", {
        value = charge,
        image = icon
      })


    end)
  end)

end)

-- First get charger file path
awful.spawn.easy_async_with_shell("sh -c 'out=\"$(find /sys/class/power_supply/*/online)\" && (echo \"$out\" | head -1) || false' ", function (charger_file, _, __, exit_code)
  -- No charger file found
  if not (exit_code == 0) then
    return
  end
  -- Then initialize function that emits charger info
  local emit_charger_info = function()
    awful.spawn.easy_async_with_shell("cat "..charger_file, function (out)
      local status = tonumber(out) == 1
      awesome.emit_signal("evil::charger", status)
    end)
  end

  -- Run once to initialize widgets
  emit_charger_info()

  -- Kill old acpi_listen process
  awful.spawn.easy_async_with_shell("ps x | grep \"acpi_listen\" | grep -v grep | awk '{print $1}' | xargs kill", function ()
    -- Update charger status with each line printed
    awful.spawn.with_line_callback(charger_script, {
      stdout = function(_)
        emit_charger_info()
      end
    })
  end)
end)
