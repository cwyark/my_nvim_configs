return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "bash",
      "c",
      "rust",
      "html",
      "json",
      "lua",
      "markdown",
      "python",
      "xml",
      "regex",
      "yaml",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "m",
        node_incremental = "m",
        scope_incremental = false,
        node_decremental = "n",
      },
    },
  },
}
