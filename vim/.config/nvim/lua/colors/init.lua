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

M.get_all_themes = function()
    local themes = {}
    local dirname = vim.fn.stdpath "config" .. "/lua/colors/themes/"
    local theme_paths = require("plenary.scandir").scan_dir({ dirname }, {})

    -- trunacate absolute theme paths to just theme names
    for _, theme in ipairs(theme_paths) do
        local name = vim.fn.fnamemodify(theme, ":t")
        name = vim.fn.fnamemodify(name, ":r")

        themes[#themes + 1] = name
    end
    return themes
end

M.theme_selector = function()
    local pickers = require "telescope.pickers"
    local finders = require "telescope.finders"
    local conf = require("telescope.config").values
    local actions = require "telescope.actions"
    local action_state = require "telescope.actions.state"

    -- our picker function: colors
    local colors = function(opts)
        opts = opts or {}
        pickers.new(opts, {
            prompt_title = " Select Theme",
            finder = finders.new_table {
                results = M.get_all_themes()
            },
            sorter = conf.generic_sorter(opts),
            attach_mappings = function(prompt_bufnr, _)
                actions.select_default:replace(function()
                    actions.close(prompt_bufnr)
                    local selection = action_state.get_selected_entry()
                    vim.g.theme_name = selection[1]
                    M.load_theme()
                end)
                return true
            end,
        }):find()
    end

    -- to execute the function
    local dropdown_opts = require('telescope.themes').get_dropdown {
        results_title = false,
        prompt_prefix = "  ",
        layout_config = {
            anchor = "",
            width = 45,
            height = 0.3,
        },
    }colors(dropdown_opts)
end

return M
