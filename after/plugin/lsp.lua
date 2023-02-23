local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.set_preferences({
    suggest_lsp_servers = true
})

lsp.ensure_installed({
    'rust_analyzer',
    'lua_ls'
})

lsp.use('rust_analyzer', {
    diagnostic = { experimental = { enable = true } }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = true }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "gh", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "gi", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, opts)
end)

-- Sometimes this is needed that the lsp can resolve the 'vim' global variable
-- If this doesn't work, you might need to update neovim.
-- In case if you're using Arch, you might want to use `neovim-git` (AUR) instead of `neovim`.
-- It also helps to run `:so %` on this file sometimes. Idk why
-- Maybe it's the out-dated LuaJIT version, some environmet magic or just some lsp mischief.

-- require 'lspconfig'.sumneko_lua
require 'lspconfig'.lua_ls
    .setup {
        settings = { Lua = {
            runtime = { version = 'LuaJIT' }, -- Should techinically be auto-detected. Sometimes this needs to be commented out.
            diagnostics = { globals = { 'vim' } },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = { enable = false },
        } }
    }

lsp.setup()
