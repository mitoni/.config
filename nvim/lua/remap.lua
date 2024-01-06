vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>f", vim.cmd.Format)

vim.keymap.set("v", "K", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "L", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "p", '"_dP')

vim.keymap.set("n", "<leader>wv", "<C-w><C-v>")
vim.keymap.set("n", "<leader>wh", "<C-w><C-n>")
vim.keymap.set("n", "<leader>we", "<C-w><C-=>")

vim.keymap.set("n", "<C-j>", "<C-w><Left>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w><Down>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w><Up>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-;>", "<C-w><Right>", { noremap = true, silent = true })

vim.keymap.set("n", "<A-l>", ":bnext<CR>")
vim.keymap.set("n", "<A-j>", ":bprevious<CR>")
vim.keymap.set("n", "<A-d>", ":bdelete<CR>")

-- remap arrow keys
vim.keymap.set("n", "j", "<Left>", { noremap = true, silent = true })
vim.keymap.set("n", "k", "<Down>", { noremap = true, silent = true })
vim.keymap.set("n", "l", "<Up>", { noremap = true, silent = true })
vim.keymap.set("n", ";", "<Right>", { noremap = true, silent = true })

vim.keymap.set("v", "j", "<Left>", { noremap = true, silent = true })
vim.keymap.set("v", "k", "<Down>", { noremap = true, silent = true })
vim.keymap.set("v", "l", "<Up>", { noremap = true, silent = true })
vim.keymap.set("v", ";", "<Right>", { noremap = true, silent = true })
