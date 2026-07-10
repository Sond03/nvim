-- setting the leader key to space
vim.g.mapleader = " "

--shift K move line up and J down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = "Move full line down a line"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv",{desc = "Move full line up a line"})


-- unsure so uncomment for now
-- vim.api.nvim_set_keymap("n", "<leader>tf", "<Plug>PlenaryTestFile", { noremap = false, silent = false })

-- put next line to the one your on
vim.keymap.set("n", "J", "mzJ`z")

--CTRL d down u up paragrapg
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--Better next with n and N backwards
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--indent paragraph
vim.keymap.set("n", "=ap", "ma=ap'a")

--lsp restart
-- vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>", {desc = "Restart lsp"})

-- vim.keymap.set("n", "<leader>vwm", function()
--     require("vim-with-me").StartVimWithMe()
-- end)
-- vim.keymap.set("n", "<leader>svwm", function()
--     require("vim-with-me").StopVimWithMe()
-- end)

-- pastes without copying into clipboard
vim.keymap.set("x", "<leader>p", [["_dP]], {desc = "Paste without copying"})

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]],{desc = "Copy word to clipboard"})
vim.keymap.set("n", "<leader>Y", [["+Y]],{desc = "Copy line to clipboard"})

-- Deletes without copying to clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d", {desc = "Deletes without copying to clipboard"})

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

-- i dont user tmux yet 
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<M-h>", "<cmd>silent !tmux-sessionizer -s 0 --vsplit<CR>")
-- vim.keymap.set("n", "<M-H>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>")

--Next and prev error
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

--Next and previous
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", {desc = "Next in location list"})
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", {desc = "Previous in location list"})

-- Changes the word under the cursor on every iteration
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],{
    desc = "Changes every iteration of a word inside the same file with a new one"
})

-- Makes the file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true , desc = "Exit and make executable"})

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end, {desc = "Reload config"})

vim.keymap.set('n', '<leader>u', function()
  vim.cmd('UndotreeToggle')
  vim.cmd('UndotreeFocus')
end, { desc = 'Toggle and focus Undotree' })

-- barbar keymaps


local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-h>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-l>', '<Cmd>BufferNext<CR>', opts)
-- Alt . prev , next

-- Goto tab in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Alt 1-0

-- Close open tab with Alt c
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

-- Pin tabs with Alt p
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

-- Code runner hotkeys start file with f5 and close with esc 
vim.keymap.set('n', '<F5>', ':RunCode<CR>', opts)
vim.keymap.set('t', '<leader>qq', [[<C-\><C-n>:q!<CR>]], opts)

vim.keymap.set('n', '"', 'ciw""<Esc>P', opts)
-- goto definition
vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, {desc = "Go to definition"})

-- previos buffer
vim.keymap.set('n', '<leader><tab>', '<cmd>b#<CR>', { desc = 'Alternate buffer' })


-- Escape in normal mode getting rid of search 
vim.keymap.set('n', '<Esc>', function()
    vim.fn.setreg('/', '')   -- Wipes the search memory register
    vim.cmd('nohlsearch')    -- Turns off current highlight rendering
    return '<Esc>'           -- Sends the actual Esc key through so it behaves normally
end, { expr = true, silent = true, desc = "Clear search highlights on Esc" })
