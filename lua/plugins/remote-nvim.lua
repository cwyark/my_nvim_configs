return {
  {
    "amitds1997/remote-nvim.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = {
      remote = {
        copy_dirs = {
          base = vim.fn.stdpath("data"),
          compression = {
            dirs = { "lazy" },
            enabled = true,
            additional_opts = { "--exclude-vcs" },
          },
        },
      },
    },
  },
}
