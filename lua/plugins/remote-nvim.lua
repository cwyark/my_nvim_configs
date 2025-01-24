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
          config = {
            compression = {
              enabled = true,
              additional_opts = { "--exclude-vcs" },
            },
          },
        },
      },
    },
  },
}
