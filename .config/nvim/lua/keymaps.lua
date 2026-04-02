local map = vim.keymap.set

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basics
map("n", "<leader>w", "<cmd>write<cr>",  { desc = "Save file" })
map("n", "<leader>q", "<cmd>quit<cr>",   { desc = "Quit" })
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "File tree" })

-- Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Buffers
map("n", "<Tab>",   "<cmd>bnext<cr>",   { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>bprev<cr>",   { desc = "Prev buffer" })
map("n", "<leader>x", "<cmd>bdelete<cr>", { desc = "Close buffer" })

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>",  { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>",   { desc = "Grep project" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>",     { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>",   { desc = "Help" })
map("n", "<leader>fc", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })

-- LSP (set in lsp on_attach)
map("n", "gd",  vim.lsp.buf.definition,    { desc = "Go to definition" })
map("n", "gr",  vim.lsp.buf.references,    { desc = "References" })
map("n", "K",   vim.lsp.buf.hover,         { desc = "Hover docs" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "[d",  vim.diagnostic.goto_prev,  { desc = "Prev diagnostic" })
map("n", "]d",  vim.diagnostic.goto_next,  { desc = "Next diagnostic" })

-- Lazygit
map("n", "<leader>gg", "<cmd>terminal lazygit<cr>i", { desc = "LazyGit" })

-- Move lines up/down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centered while scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
