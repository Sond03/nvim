return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha",
  },
  config = function(_, opts)
      require("catppuccin").setup(opts)

      vim.cmd.colorscheme("catppuccin")

      -- vim.api.nvim_set_hl(0, "Normal",{ bg = "none"} )
      -- vim.api.nvim_set_hl(0, "NormalFloat",{ bg = "none"} )
      vim.api.nvim_set_hl(0, "Visual", { bg = "#454751"})
      vim.api.nvim_set_hl(0, "FlashMatch", {
          bg = "#66A4B6",
          fg = "#000000",
      })

      vim.api.nvim_set_hl(0, "FlashCurrent", {
          bg = "#66A4B6",
          fg = "#000000",
          bold = true,
      })
      vim.api.nvim_set_hl(0, "Search", { bg = "#3b4261", fg = "#a9b1d6" })
      vim.api.nvim_set_hl(0, "CurSearch", { bg = "#7aa2f7", fg = "#1d202f", bold = true })
  end,
}
