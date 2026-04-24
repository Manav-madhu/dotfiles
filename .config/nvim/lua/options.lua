local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation (change per project with .editorconfig)
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Visual
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
--opt.colorcolumn = "100"
opt.list = true
opt.listchars = { tab = "→ ", trail = "·", nbsp = "␣" }

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Files
opt.undofile = true      -- Persistent undo (survives nvim restart)
opt.swapfile = false
opt.backup = false
opt.updatetime = 250

-- Clipboard
opt.clipboard = "unnamedplus"

-- Completion
opt.completeopt = "menuone,noinsert,noselect"
