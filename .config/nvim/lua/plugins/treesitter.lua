local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

configs.setup({
  ensure_installed = {
    "lua", "python", "javascript", "typescript",
    "go", "rust", "bash", "yaml", "json",
    "dockerfile", "markdown", "toml"
  },

  highlight = { enable = true },
  indent = { enable = true },
})
