return {
  {
    "ravitemer/mcphub.nvim",
    version = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest",
    opts = {
      port = 33000,
      config = vim.fn.stdpath("config") .. "/mcpservers.json",
      shutdown_delay = 0, -- Wait 0ms before shutting down server after last client exits
      log = {
        level = vim.log.levels.WARN,
        to_file = false,
        file_path = nil,
        prefix = "MCPHub",
      },
    },
  },
}
