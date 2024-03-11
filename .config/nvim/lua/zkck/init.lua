-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Configure nvim-lspconfig and nvim-cmp
require('zkck.lsp.mappings')
require('zkck.lsp.cmp')

-- Setup language servers.
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconfig.pyright.setup {
    capabilities = capabilities,
}
lspconfig.rust_analyzer.setup {
    capabilities = capabilities,
    settings = {
        ['rust-analyzer'] = {
            imports = {
                granularity = {
                    group = "item",
                }
            }
        }
    },
}
lspconfig.gopls.setup {
    capabilities = capabilities,
}

local luasnip = require('luasnip')
vim.keymap.set('i', '<Tab>', function() luasnip.jump(1) end, { silent = true })
vim.keymap.set('i', '<S-Tab>', function() luasnip.jump(-1) end, { silent = true })

