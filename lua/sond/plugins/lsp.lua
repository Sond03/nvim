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
            cmd = { 'qml-language-server' },
            filetypes = { 'qml' },
            root_markers = { 'qmldir', '.git' },
        }
        vim.lsp.enable('qml')
        -- Manual qml server that works with quickshell qml-language-server is needed on the system

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
