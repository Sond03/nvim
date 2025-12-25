return {
  "folke/which-key.nvim", -- enabled = false, (scuffed for now disable by uncommenting)
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Keymaps",
    }
  },
}
