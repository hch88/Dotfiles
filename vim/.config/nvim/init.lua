vim.opt.shadafile = "NONE"

require('core/autocmds')
require('core/options')
require('core/keymaps')
require('core/statusline')

-- Name of the theme. Look in lua/colors/themes for the list of themes.
local theme_name = "catppuccin"

vim.defer_fn(function()
    require("packer_init")

    -- Apply theme
    vim.g.theme_name = theme_name
    require('colors').load_theme()
    require('plugins.feline')
end, 0)

vim.opt.shadafile = ""
