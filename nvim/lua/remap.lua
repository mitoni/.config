vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>f", vim.cmd.Format)

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({ "n", "v" }, "<leader>p", '"0p')

vim.keymap.set("n", "<leader>wv", "<C-w><C-v>")
vim.keymap.set("n", "<leader>wh", "<C-w><C-n>")
vim.keymap.set("n", "<leader>we", "<C-w><C-=>")
vim.keymap.set("n", "<leader>wo", ":only<CR>")

-- vim.keymap.set("n", "<C-j>", "<C-w><Left>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-,>", "<C-w><Down>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-k>", "<C-w><Up>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-l>", "<C-w><Right>", { noremap = true, silent = true })

-- remap arrow keys
-- vim.keymap.set("n", "j", "<Left>", { noremap = true, silent = true })
-- vim.keymap.set("n", ",", "<Down>", { noremap = true, silent = true })
-- vim.keymap.set("n", "k", "<Up>", { noremap = true, silent = true })
-- vim.keymap.set("n", "l", "<Right>", { noremap = true, silent = true })
--
-- vim.keymap.set("v", "j", "<Left>", { noremap = true, silent = true })
-- vim.keymap.set("v", ",", "<Down>", { noremap = true, silent = true })
-- vim.keymap.set("v", "k", "<Up>", { noremap = true, silent = true })
-- vim.keymap.set("v", "l", "<Right>", { noremap = true, silent = true })

-- remap go to definition and declaration
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
