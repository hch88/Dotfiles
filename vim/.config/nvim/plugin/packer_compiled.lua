-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/harish/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/harish/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/harish/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/harish/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/harish/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Catppuccino.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/Catppuccino.nvim",
    url = "https://github.com/Pocco81/Catppuccino.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/harish/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/harish/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-ultisnips"] = {
    after_files = { "/home/harish/.local/share/nvim/site/pack/packer/opt/cmp-nvim-ultisnips/after/plugin/cmp_nvim_ultisnips.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/cmp-nvim-ultisnips",
    url = "https://github.com/quangnguyen30192/cmp-nvim-ultisnips"
  },
  ["filetype.nvim"] = {
    loaded = true,
    path = "/home/harish/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  fzf = {
    loaded = true,
    path = "/home/harish/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/harish/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\5\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\2B\0\2\1K\0\1\0\fkeymaps\1\0\a\fnoremap\2\tn [g <cmd>Gitsigns prev_hunk<CR>\vbuffer\2\tn ]g <cmd>Gitsigns next_hunk<CR>\nn ,ga!<cmd>Gitsigns stage_hunk<CR>\nn ,gp#<cmd>Gitsigns preview_hunk<CR>\nn ,gu!<cmd>Gitsigns reset_hunk<CR>\nsigns\1\0\0\17changedelete\1\0\1\ttext\b▎\14topdelete\1\0\1\ttext\b▎\vdelete\1\0\1\ttext\b▎\vchange\1\0\1\ttext\b▎\badd\1\0\0\1\0\1\ttext\b▎\nsetup\rgitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["lspkind-nvim"] = {
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/harish/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15statusline\frequire\0" },
    loaded = true,
    path = "/home/harish/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  neogit = {
    commands = { "Neogit" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/home/harish/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/harish/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    after = { "cmp-buffer", "lspkind-nvim", "cmp-nvim-ultisnips", "cmp-nvim-lsp" },
    config = { "require('autocompletion')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp",
    wants = { "lspkind-nvim" }
  },
  ["nvim-lspconfig"] = {
    config = { "require('lsp_settings')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig",
    wants = { "cmp-nvim-lsp", "null-ls.nvim" }
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-textobjects" },
    config = { "require('treesitter_settings')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/harish/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["stabilize.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14stabilize\frequire\0" },
    loaded = true,
    path = "/home/harish/.local/share/nvim/site/pack/packer/start/stabilize.nvim",
    url = "https://github.com/luukvbaal/stabilize.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/harish/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21telescope_config\frequire\0" },
    keys = { { "", ",rf" }, { "", ",b" }, { "", ",F" }, { "", "<M-x>" }, { "", ",h" }, { "", ",rg" }, { "", ",gv" }, { "", ",v" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim",
    wants = { "plenary.nvim", "popup.nvim", "trouble.nvim" }
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\3=\3\15\2B\0\2\1K\0\1\0\16action_keys\16toggle_fold\1\3\0\0\azA\aza\15open_folds\1\3\0\0\azR\azr\16close_folds\1\3\0\0\azM\azm\15jump_close\1\2\0\0\6o\tjump\1\3\0\0\t<cr>\n<tab>\1\0\t\fpreview\6p\tnext\a]q\nhover\6K\19toggle_preview\6P\16toggle_mode\6m\rprevious\a[q\vcancel\n<esc>\nclose\6q\frefresh\6r\1\0\1\tmode\29lsp_document_diagnostics\nsetup\ftrouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ultisnips = {
    after_files = { "/home/harish/.local/share/nvim/site/pack/packer/opt/ultisnips/after/plugin/UltiSnips_after.vim" },
    config = { "require('ultisnip_settings')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/ultisnips",
    url = "https://github.com/SirVer/ultisnips"
  },
  ["vim-abolish"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-commentary"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-cool"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/vim-cool",
    url = "https://github.com/romainl/vim-cool"
  },
  ["vim-fugitive"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-repeat"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/harish/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-surround"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-unimpaired"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n|\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\fplugins\1\0\0\rspelling\1\0\0\1\0\2\fenabled\2\16suggestions\3\20\nsetup\14which-key\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/harish/.local/share/nvim/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^plenary"] = "plenary.nvim",
  ["^popup"] = "popup.nvim",
  ["^trouble"] = "trouble.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: stabilize.nvim
time([[Config for stabilize.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14stabilize\frequire\0", "config", "stabilize.nvim")
time([[Config for stabilize.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15statusline\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> ,v <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = ",v", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ,gv <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = ",gv", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ,rg <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = ",rg", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ,h <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = ",h", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ,b <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = ",b", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ,rf <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = ",rf", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ,F <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = ",F", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <M-x> <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>M-x>", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'vim-fugitive', 'nvim-web-devicons', 'which-key.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPost * ++once lua require("packer.load")({'vim-commentary', 'vim-cool', 'Catppuccino.nvim', 'vim-repeat', 'vim-surround', 'vim-unimpaired', 'ultisnips', 'vim-abolish'}, { event = "BufReadPost *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-treesitter'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre,InsertEnter * ++once lua require("packer.load")({'trouble.nvim'}, { event = "BufReadPre,InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'gitsigns.nvim', 'nvim-lspconfig', 'null-ls.nvim'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
