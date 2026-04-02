local M = {}

function M.lualine()
  require("lualine").setup({
    options = {
      theme = "catppuccin",
    },
  })
end

function M.ibl()
  require("ibl").setup()
end

function M.which_key()
  require("which-key").setup()
end

function M.gitsigns()
  require("gitsigns").setup()
end

function M.neo_tree()
  require("neo-tree").setup({
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
      },
    },
  })
end

return M
