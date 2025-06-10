return {
  {
    "CRAG666/code_runner.nvim",
    version = "*",
    config = {
      python = "python3 -u",
      rust = {
        "cd $dir &&",
        "rustc $fileName &&",
        "$dir/$fileNameWithoutExt",
      },
    },
    keys = {
      {
        "<leader>rr",
        "<cmd>RunCode<cr>",
        desc = "Run Code",
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>r", group = "CodeRunner", icon = "" },
      },
    },
  },
}
