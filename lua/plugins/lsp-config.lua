return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "lua_ls", -- typescript
      "neocmake", -- cmake
      "clangd", -- C/C++
      "ruff", -- python linter and formatter
      "pyright", -- python LSP server
      "ts_ls", -- typescript/javascript LSP
      "biome", -- typescript/javascript/json linter and formatter
      "rust_analyzer", -- rust lsp / linter / formatter
      "bashls", -- bash
      "yamlls", -- yaml
    },
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
}
