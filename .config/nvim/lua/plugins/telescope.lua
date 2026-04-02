local telescope = require("telescope")

telescope.setup({
  defaults = {
    file_ignore_patterns = { "node_modules", ".git/" },
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
})

-- Load extensions
pcall(telescope.load_extension, "fzf")
