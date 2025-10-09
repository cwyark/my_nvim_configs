return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    opts = {
      provider = "gpt_5_mini",
      providers = {
        local_ollama = {
          __inherited_from = "openai",
          endpoint = "http://127.0.0.1:11434/v1",
          model = "gemma3:12b",
        },
        remote_ollama = {
          __inherited_from = "openai",
          endpoint = "http://172.17.40.58:11434/v1",
          model = "gemma3:27b",
        },
        o3 = {
          __inherited_from = "openai",
          endpoint = "https://api.openai.com/v1",
          model = "o3",
        },
        o3_mini = {
          __inherited_from = "openai",
          endpoint = "https://api.openai.com/v1",
          model = "o3-mini",
        },
        o4_mini = {
          __inherited_from = "openai",
          endpoint = "https://api.openai.com/v1",
          model = "o4-mini",
        },
        gpt_4dot1 = {
          __inherited_from = "openai",
          endpoint = "https://api.openai.com/v1",
          model = "gpt-4.1",
        },
        gpt_4dot1_mini = {
          __inherited_from = "openai",
          endpoint = "https://api.openai.com/v1",
          model = "gpt-4.1-mini",
        },
        gpt_4dot1_nano = {
          __inherited_from = "openai",
          endpoint = "https://api.openai.com/v1",
          model = "gpt-4.1-nano",
        },
        gpt_5 = {
          __inherited_from = "openai",
          endpoint = "https://api.openai.com/v1",
          model = "gpt-5",
          extra_request_body = {
            temperature = 1,
          },
        },
        gpt_5_mini = {
          __inherited_from = "openai",
          endpoint = "https://api.openai.com/v1",
          model = "gpt-5-mini",
          extra_request_body = {
            temperature = 1,
          },
        },
        gpt_5_nano = {
          __inherited_from = "openai",
          endpoint = "https://api.openai.com/v1",
          model = "gpt-5-nano",
          extra_request_body = {
            temperature = 1,
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
    build = "make",
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
