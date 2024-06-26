-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require ("lspconfig")
local servers = { "html", "cssls", "pyright"}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

--python
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"}
})

--c and cpp
lspconfig.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"c", "cpp"},
  cmd = {
    "clangd",
    "--header-insertion=never",
    "--query-driver=D:\\backup\\Desktop\\JOSH FILES\\Clang\\llvm-mingw-20240404-msvcrt-x86_64\\bin\\clang.exe,*",
    "--clang-tidy",
    "--background-index",
    "--fallback-style=google",
    "--j=4",
  },
})
