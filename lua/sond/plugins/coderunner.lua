return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 15,
        open_mapping = [[<c-\>]], --ctrl+\
        shade_terminals = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_mode = false,
        direction = "horizontal",
        close_on_exit = false,
      })
    end,
  },
  {
    "CRAG666/code_runner.nvim",
    opts = {
      mode = "toggleterm",
      filetype = {
        java = {
          "cd $dir &&",
          "javac $fileName &&",
          "java $fileNameWithoutExt",
        },
        python = "python3 -u",
        c = "cd $dir && gcc $fileName -g -O0 -Wall -Wextra -std=c89 -o $fileNameWithoutExt && ./$fileNameWithoutExt",
      },
    },
  },
}
