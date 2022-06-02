local merge_tb = require("colors").merge_tb

local highlights = {}
local hl_files = {"base", "syntax", "feline", "treesitter", "devicons", "cmp", "telescope", "trouble"}
for _, file in ipairs(hl_files) do
   local integration = require("colors.highlights." .. file)
   highlights = merge_tb(highlights, integration)
end

-- Theme specific highlights
local polish_hl = require("colors").get_colors()["polish_hl"]
if polish_hl then
   highlights = merge_tb(highlights, polish_hl)
end

-- Set all highlights
for hl, col in pairs(highlights) do
   vim.api.nvim_set_hl(0, hl, col)
end
