return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- Command to run after installation/updates to fetch parsers
  opts = {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query" }, -- Languages to install
    auto_install = true, -- Automatically install missing parsers
    highlight = {
      enable = true, -- Enable treesitter highlighting
    },
    indent = {
      enable = true, -- Enable treesitter-based indentation
    },
  },
}

