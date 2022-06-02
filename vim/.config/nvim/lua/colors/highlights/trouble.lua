local theme = require("colors").get_colors()["base_16"]
local colors = require("colors").get_colors()["base_30"]

local green = colors.green
local cyan = colors.cyan
local vibrant_green = colors.vibrant_green
local folder_bg = colors.folder_bg

return {
   TroubleSignHint = { fg = theme.base0C },
   TroubleSignError = { fg = theme.base08 },
   TroubleSignWarning = { fg = theme.base0A },
   TroubleSignOther = { fg = green },
   TroubleFile = { fg = vibrant_green, bold = true },
   TroubleFoldIcon = { fg = cyan, bold = true },
   TroubleCount = { bg = folder_bg, fg = "black", bold = true },
}
