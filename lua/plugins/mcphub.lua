return {
  {
    "ravitemer/mcphub.nvim",
    -- version = "v3.5.0",
    version = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest",
    opts = {
      port = 32400,
      config = vim.fn.stdpath("config") .. "/mcpservers.json",
      log = {
        level = vim.log.levels.INFO,
        to_file = false,
        file_path = nil,
        prefix = "MCPHub",
      },
    },
  },
}
