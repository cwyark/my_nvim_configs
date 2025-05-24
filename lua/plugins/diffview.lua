return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggle", "DiffviewFileHistory" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
    { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
    { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview File History" },
  },
}
