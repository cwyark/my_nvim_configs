return {
  {
    "LintaoAmons/scratch.nvim",
    version = "*",
    config = {
      filetypes = { "py", "rs", "cpp" },
      filetype_details = {
        rs = {
          requireDir = true,
          content = { "", "", "fn main(){", "", "}" },
          cursor = {
            location = { 4, 2 },
            insert_mode = true,
          },
        },
        cpp = {
          content = { "", "", "int main() {", "", "}" },
          cursor = {
            location = { 4, 2 },
            insert_mode = true,
          },
        },
      },
    },
    keys = {
      {
        "<leader>fsn",
        "<cmd>Scratch<cr>",
        desc = "New Scrach file",
      },
      {
        "<leader>fsN",
        "<cmd>ScratchWithName<cr>",
        desc = "New Scrach file with file name",
      },
      {
        "<leader>fso",
        "<cmd>ScratchOpen<cr>",
        desc = "Open an existing scratch file",
      },
      {
        "<leader>fsf",
        "<cmd>ScratchOpenFzf<cr>",
        desc = "Fuzzy find scrach file.",
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>fs", group = "scratch", icon = "󱦹" },
      },
    },
  },
}
