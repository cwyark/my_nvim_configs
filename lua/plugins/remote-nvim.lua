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
      devpod = {
        dotfiles = {
          path = "https://github.com/cwyark/dotfiles.git",
          install_script = ".local/bin/install.sh",
        },
      },
      remote = {
        copy_dirs = {
          config = {
            compression = {
              enabled = true,
              additional_opts = { "--exclude-vcs" },
            },
          },
          --data = {
          --  base = vim.fn.stdpath("data"),
          --  dirs = { "remote-tools" },
          --  compression = {
          --    enabled = true,
          --  },
          --},
        },
      },
    },
  },
}
