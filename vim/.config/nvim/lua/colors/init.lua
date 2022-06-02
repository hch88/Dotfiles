local M = {}

M.get_theme_tb = function()
    local name = vim.g.theme_name
    local default_path = "colors.themes." .. name

    local present, default_theme = pcall(require, default_path)
    if present then
        return default_theme
    else
        vim.notify("no such theme!")
    end
end

M.get_colors = function()
    return M.get_theme_tb()
end

M.merge_tb = function(table1, table2)
    return vim.tbl_deep_extend("force", table1, table2)
end

M.load_theme = function()
    require("plenary.reload").reload_module "colors.highlights"
    require "colors.highlights"
end

M.theme_selector = function()
  local actions = require('telescope.actions')
  local action_state = require('telescope.actions.state')
  local pickers = require('telescope.pickers')
  local finders = require('telescope.finders')
  local conf = require('telescope.config')

  local theme_names = {"catppuccin", "onedark", "everfores"}
  pickers.new({}, {
    finder = finders.new_table({
      results = theme_names,
    }),
    sorter = conf.generic_sorter(),
    attach_mappings = function(_)
      actions.select_default:replace(function()
        local theme = action_state.get_selected_entry()[1]
        vim.g.theme_name = theme
        require('colors').load_theme()
      end)
      return true
    end,
  }):find()
end

return M
