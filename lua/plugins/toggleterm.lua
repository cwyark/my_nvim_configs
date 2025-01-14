return {
  {
    "akinsho/toggleterm.nvim",
    version = "2.13.1",
    lazy = true,
    cmd = { "ToggleTerm" },
    opts = {
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      direction = "horizontal" or "vertical" or "window" or "float",
      close_on_exit = true,
    },
    keys = {
      {
        "<leader>th",
        "<cmd>ToggleTerm size=10 direction=horizontal<cr>",
        desc = "ToggleTerm horizontal split",
      },
      {
        "<leader>tf",
        "<cmd>ToggleTerm direction=float<cr>",
        desc = "ToggleTerm float",
      },
      {
        "<leader>tv",
        "<cmd>ToggleTerm size=80 direction=vertical<cr>",
        desc = "ToggleTerm vertical split",
      },
      {
        "<leader>ts",
        "<cmd>TermSelect<cr>",
        desc = "Select term",
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.icons = {
        rules = {
          {
            pattern = "term",
            icon = "💻",
          },
        },
      }
    end,
  },
}
