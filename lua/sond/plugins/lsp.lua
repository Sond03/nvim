return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "saghen/blink.cmp", -- Add blink as a dependency
        "j-hui/fidget.nvim",
    },

    config = function()
        -- 1. Get blink's capabilities
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "ts_ls",
                "pyright",
                "clangd",
                "jdtls",
            },

            handlers = {
                -- Default handler
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                -- Custom handler for Lua
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
            }
        })

        vim.lsp.config.qml = {
            cmd = { 'qmlls6' , '-E'},
            filetypes = { 'qml' },
            root_markers = { 'shell.qml', 'qmldir', '.git' },
            handlers = {
                ["textDocument/publishDiagnostics"] = function() end,
            },
            on_attach = function(client, _)
                -- Disable semantic tokens only for qmlls6
                client.server_capabilities.semanticTokensProvider = nil
            end,
        }
        vim.lsp.enable('qml', { capabilities = capabilities })
        -- qmlls6 for autocomplete since qml-language-server doesnt fint qtquick

        vim.lsp.config.qml_syntax = {
            cmd = { 'qml-language-server' },
            filetypes = { 'qml' },
            root_markers = { 'shell.qml', 'qmldir', '.git' },
        }
        vim.lsp.enable('qml_syntax', { capabilities = capabilities })
        -- enabling qml-language server for syntax highlighting since qmlls6 is very very very very slow

        -- 2. Diagnostic Configuration
        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
