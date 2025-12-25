return {
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require('mini.statusline').setup({ use_icons = true })
            require('mini.pairs').setup()
            require('mini.indentscope').setup(
                {symbol = '│',}
            )
        end,
    },
}
