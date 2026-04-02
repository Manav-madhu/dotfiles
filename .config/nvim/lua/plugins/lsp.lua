require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",        -- Lua
    "pyright",       -- Python
    "ts_ls",         -- TypeScript/JavaScript
    "gopls",         -- Go
    "rust_analyzer", -- Rust
    "bashls",        -- Bash
    "dockerls",      -- Dockerfile
    "yamlls",        -- YAML
  },
  automatic_installation = true,
})

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"]      = cmp.mapping.confirm({ select = true }),
    ["<Tab>"]     = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
      else fallback() end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  }),
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

local servers = { "lua_ls", "pyright", "ts_ls", "gopls",
                  "rust_analyzer", "bashls", "dockerls", "yamlls" }
for _, server in ipairs(servers) do
  lspconfig[server].setup({ capabilities = capabilities })
end
