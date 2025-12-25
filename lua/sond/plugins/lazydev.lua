return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  -- { -- optional cmp completion source for require statements and module annotations
  --   "hrsh7th/nvim-cmp",
  --   opts = function(_, opts)
  --     opts.sources = opts.sources or {}
  --     table.insert(opts.sources, {
  --       name = "lazydev",
  --       group_index = 0, -- set group index to 0 to skip loading LuaLS completions
  --     })
  --   end,
  -- },
  { -- optional blink completion source for require statements and module annotations
    "saghen/blink.cmp",
    version = "*",
    opts = {
        keymap = {
            -- Sets up Tab and Shift-Tab for you
            preset = 'super-tab',
            ['<Tab>'] = {
                function(cmp)
                    if cmp.is_visible() then
                        return cmp.select_next()
                    end
                end,
                'fallback'
            },
            -- Manually adds Enter to accept the suggestion
            ['<CR>'] = { 'accept', 'fallback' },

            -- Optional: Makes the Up/Down arrows work too
            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
        },
      sources = {
        -- add lazydev to your completion providers
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
    },
  }
  -- { "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim
}
