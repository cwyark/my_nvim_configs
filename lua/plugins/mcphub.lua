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
      shutdown_delay = 200, -- Wait 0ms before shutting down server after last client exits
      log = {
        level = vim.log.levels.WARN,
        to_file = false,
        file_path = nil,
        prefix = "MCPHub",
      },
    },
  },
}
