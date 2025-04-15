return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    -- version = "v0.0.23"
    version = false,
    opts = {
      provider = "gpt_4dot1",
      vendors = {
        local_ollama = {
          __inherited_from = "openai",
          endpoint = "http://127.0.0.1:11434/v1",
          model = "gemma3:4b",
        },
        remote_ollama = {
          __inherited_from = "openai",
          endpoint = "http://172.17.40.58:11434/v1",
          model = "gemma3:27b",
        },
        o3_mini = {
          __inherited_from = "openai",
          endpoint = "https://api.openai.com/v1",
          model = "o3-mini",
        },
        gpt_4o = {
          __inherited_from = "openai",
          endpoint = "https://api.openai.com/v1",
          model = "gpt-4o",
        },
        gpt_4o_mini = {
          __inherited_from = "openai",
          endpoint = "https://api.openai.com/v1",
          model = "gpt-4o-mini",
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
        fast_apply_model = {
          __inherited_from = "openai",
          endpoint = "http://127.0.0.1:11434/v1",
          model = "hf.co/Kortix/FastApply-1.5B-v1.0_GGUF:Q4_K_M",
        },
      },
      cursor_applying_provider = "fast_apply_model",
      behaviour = {
        enable_cursor_planning_mode = true,
      },
      system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        if hub then
          return hub:get_active_servers_prompt()
        else
          return nil
        end
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
