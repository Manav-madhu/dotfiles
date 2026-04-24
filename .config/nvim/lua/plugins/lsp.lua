require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    --"pyright",
    --"ts_ls",
    --"gopls",
    --"rust_analyzer",
    --"bashls",
    --"dockerls",
    --"yamlls",
  },
})

-- nvim-cmp setup (keep as is)
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
})

-- 🔥 NEW LSP WAY
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
  "lua_ls", "pyright", "ts_ls", "gopls",
  "rust_analyzer", "bashls", "dockerls", "yamlls"
}

for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    capabilities = capabilities,
  })
  vim.lsp.enable(server)
end
