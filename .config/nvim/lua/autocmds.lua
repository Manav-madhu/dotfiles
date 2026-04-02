local autocmd = vim.api.nvim_create_autocmd

-- Highlight yanked text
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- Auto resize splits when window resized
autocmd("VimResized", {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- Set filetype-specific indentation (example)
autocmd("FileType", {
  pattern = { "lua", "javascript", "typescript" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})
