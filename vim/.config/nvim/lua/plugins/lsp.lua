-- LSP Settings
local nvim_lsp = require 'lspconfig'

local on_attach = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    vim.keymap.set('n', ',la', '<cmd>Telescope lsp_code_actions<CR>', bufopts)
    vim.keymap.set('n', ',ca', '<cmd>Telescope lsp_code_actions<CR>', bufopts)
    vim.keymap.set('v', ',ca', ':<C-U>Telescope lsp_range_code_actions<CR>', bufopts)
    vim.keymap.set('v', ',la', ':<C-U>Telescope lsp_range_code_actions<CR>', bufopts)
    vim.keymap.set('n', ',lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', bufopts)
    vim.keymap.set('n', 'gr',  '<cmd>Telescope lsp_references<CR>', bufopts)
    vim.keymap.set('n', ',ls', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', bufopts)
    vim.keymap.set('n', 'K',   '<cmd>lua vim.lsp.buf.hover()<CR>', bufopts)
    vim.keymap.set('n', 'gs',  '<cmd>lua vim.lsp.buf.signature_help()<CR>', bufopts)
    vim.keymap.set('i', '<C-k>',  '<cmd>lua vim.lsp.buf.signature_help()<CR>', bufopts)
    vim.keymap.set('n', 'gR',  '<cmd>lua vim.lsp.buf.rename()<CR>', bufopts)
    vim.keymap.set('n', 'gD',  '<cmd>Telescope lsp_definitions<CR>', bufopts)
    vim.keymap.set('n', 'gd',  '<cmd>Telescope lsp_definitions<CR>', bufopts)
    vim.keymap.set('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', bufopts)


    -- Better jump and show diagnostics
    local float_opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = 'double',
        source = 'always',
        prefix = function(diagnostic, _, _)
            local severity_symbols = {'', '', '', ''}
            local symbol_prefix = severity_symbols[diagnostic["severity"]]
            return ' ' .. symbol_prefix .. ' '
        end,
        scope = 'cursor',
        header = {"   Diagnostics:", "markdownH1"}
    }
    local diagnostic_next_options = { float = float_opts }
    vim.keymap.set('n', '[e',  function() vim.diagnostic.goto_prev(diagnostic_next_options) end, bufopts)
    vim.keymap.set('n', ']e',  function() vim.diagnostic.goto_next(diagnostic_next_options) end, bufopts)

    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
            vim.diagnostic.open_float(nil, float_opts)
        end
    })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Change diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Enable the following language servers
local servers = { 'gopls', 'rust_analyzer', 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = '/home/harish/.local/bin/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/lua-language-server"

local luadev = require("lua-dev").setup({
  -- add any options here, or leave empty to use the default settings
  lspconfig = {
    cmd = {sumneko_binary},
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      telemetry = {
        enable = false,
      },
    },
  },
})

nvim_lsp.sumneko_lua.setup(luadev)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'single'
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'single',
})

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
})
