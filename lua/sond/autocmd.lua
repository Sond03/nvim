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

local hl_group = vim.api.nvim_create_augroup("SearchHighlightToggle", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
    group = hl_group,
    pattern = "*",
    callback = function()
        vim.opt.hlsearch = false
    end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
    group = hl_group,
    pattern = "*",
    callback = function()
        vim.fn.setreg('/', '')
        vim.opt.hlsearch = true
    end,
})
