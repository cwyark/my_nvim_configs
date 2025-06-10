return {
  {
    "CRAG666/code_runner.nvim",
    version = "*",
    config = {
      filetype = {
        python = "python3 -u",
        rust = {
          "cd $dir &&",
          "rustc $fileName &&",
          "$dir/$fileNameWithoutExt",
        },
      },
    },
    keys = {
      {
        "<leader>rr",
        "<cmd>RunCode<cr>",
        desc = "Run Code",
      },
      {
        "<leader>rf",
        "<cmd>RunFile<cr>",
        desc = "Run Current File",
      },
      {
        "<leader>rc",
        "<cmd>RunClose<cr>",
        desc = "Close Current Run Window",
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
