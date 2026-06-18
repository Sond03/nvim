return {
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require('mini.statusline').setup({ use_icons = true })
            require('mini.pairs').setup()

            require('mini.indentscope').setup({
                symbol = '│',
                draw = {
                    delay = 0,
                    animation = require('mini.indentscope').gen_animation.none(),
                },
            })


        end,
    },
}
