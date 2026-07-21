return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        flavour = "mocha",
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            notify = false,
            barbar = false,
            blink_cmp = true, -- Enable this if you use blink.cmp
            mini = {
                enabled = true,
                indentscope_color = "",
            },
            lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                    ok = { "italic" },
                },
            }
        },
        custom_highlights = function(colors)
            return {
                Visual = { bg = "#454751" },
                FlashMatch = { bg = "#66A4B6", fg = "#000000" },
                FlashCurrent = { bg = "#66A4B6", fg = "#000000", bold = true },
                Search = { bg = "#3b4261", fg = "#a9b1d6" },
                CurSearch = { bg = "#7aa2f7", fg = "#1d202f", bold = true },
            }
        end
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
    end,
}
