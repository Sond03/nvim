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
  end,
}
