local theme = require("colors").get_colors()["base_16"]
local colors = require("colors").get_colors()["base_30"]

local black = colors.black
local black2 = colors.black2
local blue = colors.blue
local darker_black = colors.darker_black
local green = colors.green
local grey = colors.grey
local grey_fg = colors.grey_fg
local light_grey = colors.light_grey
local line = colors.line
local one_bg = colors.one_bg
local pmenu_bg = colors.pmenu_bg
local purple = colors.purple
local red = colors.red
local white = colors.white
local yellow = colors.yellow
local orange = colors.orange
local folder_bg = colors.folder_bg

return {
   Normal = {
      fg = theme.base05,
      bg = theme.base00,
   },

   NormalNC = {
      bg = theme.base01,
   },

   Bold = {
      bold = true,
   },

   Debug = {
      fg = theme.base08,
   },

   Directory = {
      fg = theme.base0D,
   },

   Error = {
      fg = theme.base00,
      bg = theme.base08,
   },

   ErrorMsg = {
      fg = theme.base08,
      bg = theme.base00,
   },

   Exception = {
      fg = theme.base08,
   },

   FoldColumn = {
      fg = theme.base0C,
      bg = theme.base01,
   },

   Folded = {
      fg = theme.base03,
      bg = theme.base01,
   },

   IncSearch = {
      fg = theme.base01,
      bg = theme.base09,
   },

   Italic = {
      italic = true,
   },

   Macro = {
      fg = theme.base08,
   },

   ModeMsg = {
      fg = theme.base0B,
   },

   MoreMsg = {
      fg = theme.base0B,
   },

   Question = {
      fg = theme.base0D,
   },

   Search = {
      fg = theme.base01,
      bg = theme.base0A,
   },

   Substitute = {
      fg = theme.base01,
      bg = theme.base0A,
      sp = "none",
   },

   SpecialKey = {
      fg = theme.base03,
   },

   TooLong = {
      fg = theme.base08,
   },

   UnderLined = {
      fg = theme.base0B,
   },

   Visual = {
      bg = theme.base02,
   },

   VisualNOS = {
      fg = theme.base08,
   },

   WarningMsg = {
      fg = theme.base08,
   },

   WildMenu = {
      fg = theme.base08,
      bg = theme.base0A,
   },

   Title = {
      fg = theme.base0D,
      sp = "none",
   },

   Conceal = {
      bg = "NONE",
   },

   Cursor = {
      fg = theme.base00,
      bg = theme.base05,
   },

   NonText = {
      fg = theme.base03,
   },

   SignColumn = {
      fg = theme.base03,
      sp = "NONE",
   },

   ColorColumn = {
      bg = theme.base01,
      sp = "none",
   },

   CursorColumn = {
      bg = theme.base01,
      sp = "none",
   },

   CursorLine = {
      bg = colors.line,
      sp = "none",
   },

   CursorLineNr = {
      bg = theme.base00,
      sp = "none",
   },

   QuickFixLine = {
      bg = theme.base01,
      sp = "none",
   },

   StatusLine = {
      bg = "NONE",
      sp = "none",
   },

   -- spell

   SpellBad = {
      undercurl = true,
      sp = theme.base08,
   },

   SpellLocal = {
      undercurl = true,
      sp = theme.base0C,
   },

   SpellCap = {
      undercurl = true,
      sp = theme.base0D,
   },

   SpellRare = {
      undercurl = true,
      sp = theme.base0E,
   },
   Comment = { fg = grey_fg, italic = true },

   LineNr = { fg = grey },

   -- those ugly ~'s
   EndOfBuffer = { fg = black },

   -- floating windows
   FloatBorder = { fg = blue },
   NormalFloat = { bg = darker_black },

   -- Pmenu i.e completion menu
   Pmenu = { bg = black2 },
   PmenuSbar = { bg = one_bg },
   PmenuSel = { bg = pmenu_bg, fg = black },
   PmenuThumb = { bg = grey },

   NvimInternalError = { fg = red },
   WinSeparator = { fg = line },

   -- Dashboard i.e alpha.nvim
   AlphaHeader = { fg = grey_fg },
   AlphaButtons = { fg = light_grey },

   -- Gitsigns.nvim
   DiffText = {
      fg = black,
      bg = folder_bg,
   },

   DiffAdd = {
      fg = black,
      bg = green,
   },

   DiffAdded = {
      fg = green,
   },

   DiffChange = {
      fg = orange,
   },

   DiffChangeDelete = {
      fg = red,
   },

   DiffModified = {
      fg = white,
      bg = blue,
   },

   DiffDelete = {
      fg = red,
   },

   DiffRemoved = {
      fg = red,
   },

   -- Indent blankline
   IndentBlanklineChar = { fg = line },
   IndentBlanklineSpaceChar = { fg = line },

   -- LSP References
   LspReferenceText = { fg = darker_black, bg = white },
   LspReferenceRead = { fg = darker_black, bg = white },
   LspReferenceWrite = { fg = darker_black, bg = white },

   -- Lsp Diagnostics
   DiagnosticHint = { fg = purple },
   DiagnosticError = { fg = red },
   DiagnosticWarn = { fg = yellow },
   DiagnosticInformation = { fg = green },

   -- whichkey
   WhichKey = { fg = blue },
   WhichKeySeparator = { fg = light_grey },
   WhichKeyDesc = { fg = red },
   WhichKeyGroup = { fg = green },
   WhichKeyValue = { fg = green },

   -- packer
   packerPackageName = { fg = red },

   -- vim-matchup
   MatchWord = {
      fg = black,
      bg = white,
   },
   MatchParen = { link = "MatchWord" },

   MatchWordCur = { },
   MatchParenCur = { link = "MatchWordCur" },
}
