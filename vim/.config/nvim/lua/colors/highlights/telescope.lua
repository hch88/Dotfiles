local colors = require("colors").get_colors()["base_30"]

return {

   TelescopeBorder = {
      fg = colors.darker_black,
      bg = colors.darker_black,
   },

   TelescopePromptBorder = {
      fg = colors.black2,
      bg = colors.black2,
   },

   TelescopePromptNormal = {
      fg = colors.white,
      bg = colors.black2,
   },

   TelescopePromptCounter = {
      fg = colors.cyan,
   },

   TelescopePromptPrefix = {
      fg = colors.red,
      bg = colors.black2,
   },

   TelescopeNormal = { bg = colors.darker_black },

   TelescopePreviewTitle = {
      fg = colors.black,
      bg = colors.green,
      bold = true,
   },

   TelescopePromptTitle = {
      fg = colors.black,
      bg = colors.red,
      bold = true,
   },

   TelescopeResultsTitle = {
      fg = colors.darker_black,
      bg = colors.darker_black,
   },

   TelescopeSelection = { bg = colors.pmenu_bg, fg = colors.black },
}
