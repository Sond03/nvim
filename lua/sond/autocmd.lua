vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        vim.b.miniindentscope_disable = true
    end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "man",
  callback = function()
    -- Hide the tabline specifically for this buffer
    vim.opt_local.showtabline = 0
    vim.b.miniindentscope_disable = true
  end,
})
