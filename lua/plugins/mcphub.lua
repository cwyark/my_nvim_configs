return {
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest",
    config = {
      port = 3000,
      config = vim.fn.stdpath("config") .. "/mcpservers.json",
    },
  },
}
