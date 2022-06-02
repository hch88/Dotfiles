-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '300' })
  end
})

-- Don't auto commenting new lines
autocmd({'BufEnter'}, {
  pattern = '*',
  command = 'set fo-=c fo-=r fo-=o'
})

-- Set path variable
autocmd({'BufEnter', 'DirChanged'}, {
  pattern = '*',
  command = 'lua require("extras.sane_path").set_path()'
})
