-- Suppress nvim-lspconfig v2 -> v3 deprecation warnings
local orig_notify = vim.notify
vim.notify = function(msg, log_level, opts)
    if type(msg) == "string" and msg:match("The `require%(\'lspconfig\'%)` \"framework\" is deprecated") then
        return  -- ignore this specific warning
    end
    orig_notify(msg, log_level, opts)  -- show all other messages
end

-- Load required modules
local lspconfig = require('lspconfig')
local lsp_zero = require('lsp-zero')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

-- 1. Initialize Mason plugin + server installaton via Mason-LSPconfig
require('mason').setup()
mason_lspconfig.setup({
    -- Ensure these servers are installed via Mason
    ensure_installed = {
        'pyright',
        'bashls',
        'lua_ls',
        'julials',
    },
    -- Use the handlers to apply custom configuration after installation/setup
    handlers = {
        -- Use the default LSP Zero setup for all other servers
        lsp_zero.default_setup,

        -- fix lua_ls (Removes the "undefined vim" warning)
        lua_ls = function()
            lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
        end,

        -- Custom configuration for Pyright (Replaces lsp.configure('pyright', ...))
        pyright = function()
            lspconfig.pyright.setup({
                on_attach = lsp_zero.on_attach, -- Use LSP Zero's on_attach for keymaps
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            diagnosticMode = "workspace",
                            diagnosticSeverityOverrides = {
                                reportUnboundVariable = "none",
                            },
                        },
                    }
                }
            })
        end,
    },
})

-- 5. Keymaps and Diagnostics
lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

vim.opt.signcolumn = 'yes'

lsp_zero.setup()

require('luasnip.loaders.from_vscode').lazy_load()

-- 6. Autocompletion
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  -- Load the snippets you have in Packer (friendly-snippets)
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'luasnip', keyword_length = 2},
    {name = 'buffer', keyword_length = 3},
  },
  -- Add borders to the menu to look good in Ghostty
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    -- Tab to cycle forward
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    -- Shift-Tab to cycle backward
    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
    -- Enter to confirm
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    -- Ctrl+Space to force trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})
