local null_ls = require("null-ls")

local function map(mode, lhs, rhs, opts)
    local options = {silent = true, noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Register any number of sources simultaneously
local sources = {
    null_ls.builtins.formatting.jq.with({
        filetypes = { "json" },
    }),
    null_ls.builtins.formatting.prettier.with({
        filetypes = { "html", "yaml", "markdown" },
    }),
    null_ls.builtins.formatting.black.with({
        filetypes = { "python" },
    }),
    null_ls.builtins.formatting.isort.with({
        filetypes = { "python" },
    }),
    null_ls.builtins.formatting.isort.with({
        filetypes = { "python" },
    }),
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.shfmt.with({
        extra_args = { "-i", "2", "-ci" }
    }),
    null_ls.builtins.diagnostics.write_good,
    null_ls.builtins.code_actions.gitsigns,
}

null_ls.setup({
    sources = sources,
    on_attach = function()
        map('v', ',la', ':<C-U>Telescope lsp_range_code_actions<CR>')
        map('n', ',lf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
    end
})
