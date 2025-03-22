return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    -- lazy = true,
    cmd = { "ToggleTerm" },
    config = function()
      -- reference for skipping lazygit for ESC key
      -- https://git.freiewildbahn.de/oli/nvim/src/commit/e308de510afeed59d3ff3f81790f5d6abcdebfe8/lua/plugins/toggleterm.lua#L6-L8
      -- https://www.xiaoyizhiqu.com/xyzq_news/article/66b932394ddd79f11a2b9f36
      function _G.set_terminal_keymaps(term)
        local opts = { buffer = 0 } -- Set options for key mappings
        if term.cmd ~= "lazygit" then
          vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
        end
        vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      end
      require("toggleterm").setup({
        on_open = set_terminal_keymaps,
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        direction = "horizontal" or "vertical" or "window" or "float",
        close_on_exit = true,
        float_opts = {
          border = "curved",
        },
      })
    end,
    keys = {
      {
        "<leader>th",
        "<cmd>ToggleTerm size=10 direction=horizontal<cr>",
        desc = "ToggleTerm horizontal split",
      },
      {
        "<leader>tf",
        "<cmd>ToggleTerm direction=float<cr>",
        desc = "ToggleTerm float",
      },
      {
        "<leader>tv",
        "<cmd>ToggleTerm size=80 direction=vertical<cr>",
        desc = "ToggleTerm vertical split",
      },
      {
        "<leader>ts",
        "<cmd>TermSelect<cr>",
        desc = "Select term",
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>t", group = "terminal", icon = "" },
      },
    },
  },
}
