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
lspconfig.lua_ls.setup {
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            return
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                    -- Depending on the usage, you might want to add additional paths here.
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library",
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                -- library = vim.api.nvim_get_runtime_file("", true)
            }
        })
    end,
    settings = {
        Lua = {}
    }
}

local luasnip = require('luasnip')
vim.keymap.set('i', '<Tab>', function() luasnip.jump(1) end, { silent = true })
vim.keymap.set('i', '<S-Tab>', function() luasnip.jump(-1) end, { silent = true })
