return {
  {
    "ravitemer/mcphub.nvim",
    version = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = "MCPHub",
    build = "npm install -g mcp-hub@latest",
    config = function()
      require("mcphub").setup({
        port = 32400,
        config = vim.fn.stdpath("config") .. "/mcpservers.json",
        auto_approve = true,
        extensions = {
          avante = {
            enabled = true,
            make_slash_commands = true, -- make /slash commands from MCP server prompts
          },
        },
      })
    end,
  },
}
