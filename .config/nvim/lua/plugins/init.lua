-- 🔹 BOOTSTRAP lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- 🔹 Plugins
require("lazy").setup({

  -- Colorscheme

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    config = function()
      require("plugins.telescope")
    end
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("plugins.treesitter")
    end
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("plugins.lsp")
    end
  },

  -- UI plugins (FIXED)

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("plugins.ui").ibl()
    end
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.ui").which_key()
    end
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins.ui").gitsigns()
    end
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim"
    },
    config = function()
      require("plugins.ui").neo_tree()
    end
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function ()
      local npairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")
      npairs.setup({})
      -- 👇 ADD RULES HERE
      npairs.add_rules({
        Rule("<", ">")
      })
    end
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,      -- auto close tags
          enable_rename = true,     -- auto rename pairs
          enable_close_on_slash = true
        }
})    end
  },
})
