return {
  {
    "yetone/avante.nvim",
    build = "make",
    event = "VeryLazy",
    version = false,
    opts = {
      provider = "gpt-5-mini",
      providers = {
        ["gpt-5"] = {
          __inherited_from = "openai",
          endpoint = "https://api.openai.com/v1",
          model = "gpt-5",
          context_window = 128000,
          extra_request_body = {
            temperature = 1,
            max_completion_tokens = 16384,
            reasoning_effort = "low",
          },
        },
        ["gpt-5-codex"] = {
          __inherited_from = "openai",
          endpoint = "https://api.openai.com/v1",
          model = "gpt-5-codex",
          context_window = 128000,
          extra_request_body = {
            temperature = 1,
            max_completion_tokens = 16384,
            reasoning_effort = "low",
          },
        },
        ["gpt-5-mini"] = {
          __inherited_from = "openai",
          endpoint = "https://api.openai.com/v1",
          model = "gpt-5-mini",
          context_window = 128000,
          extra_request_body = {
            temperature = 1,
            max_completion_tokens = 16384,
            reasoning_effort = "low",
          },
        },
        ["gpt-5-nano"] = {
          __inherited_from = "openai",
          endpoint = "https://api.openai.com/v1",
          model = "gpt-5-nano",
          context_window = 128000,
          extra_request_body = {
            temperature = 1,
            max_completion_tokens = 16384,
            reasoning_effort = "low",
          },
        },
      },
      system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        return hub and hub:get_active_servers_prompt() or ""
      end,
      custom_tools = function()
        return {
          require("mcphub.extensions.avante").mcp_tool(),
        }
      end,
    },

    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-mini/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "stevearc/dressing.nvim", -- for input provider dressing
      "folke/snacks.nvim", -- for input provider snacks
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
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
