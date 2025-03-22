return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = "*",
    opts = {
      -- add any opts here
      provider = "o3_mini",
      auto_suggestions_provider = "openai",
      vendors = {
        local_ollama = {
          __inherited_from = "openai",
          endpoint = "http://127.0.0.1:11434/v1",
          model = "gemma3:4b",
          disable_tools = false,
        },
        remote_ollama = {
          __inherited_from = "openai",
          endpoint = "http://172.17.40.58:11434/v1",
          model = "gemma3:27b",
          disable_tools = false,
        },
        o3_mini = {
          __inherited_from = "openai",
          endpoint = "https://api.openai.com/v1",
          model = "o3-mini",
          disable_tools = false,
        },
        gpt_4o = {
          __inherited_from = "openai",
          endpoint = "https://api.openai.com/v1",
          model = "gpt-4o",
          disable_tools = false,
        },
        gpt_4o_mini = {
          __inherited_from = "openai",
          endpoint = "https://api.openai.com/v1",
          model = "gpt-4o-mini",
          disable_tools = false,
        },
      },
      cursor_applying_provider = "gpt_4o",
      behaviour = {
        enable_cursor_planning_mode = false,
      },
      system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        ---@diagnostic disable-next-line: need-check-nil
        return hub:get_active_servers_prompt()
      end,
      custom_tools = function()
        return {
          require("mcphub.extensions.avante").mcp_tool(),
        }
      end,
    },
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "echasnovski/mini.pick",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp",
      "ibhagwan/fzf-lua",
      "nvim-tree/nvim-web-devicons",
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>a", group = "avante", icon = "󰚩" },
      },
    },
  },
}
