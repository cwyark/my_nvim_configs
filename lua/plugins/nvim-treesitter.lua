return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "cmake",
        "rust",
        "html",
        "css",
        "lua",
        "python",
        "markdown",
        "dockerfile",
        "json",
        "xml",
        "yaml",
        "toml",
        "javascript",
        "typescript",
      },
    },
    configs = {
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
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    opts = {
      move = {
        enable = true,
        goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
        goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
        goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
        goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
      },
    },
  },
}
