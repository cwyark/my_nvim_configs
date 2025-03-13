return {
  {
    "ibhagwan/fzf-lua",
    opts = function(_, opts)
      local fzf = require("fzf-lua")
      local actions = fzf.actions

      opts.files.actions["ctrl-h"] = { actions.toggle_hidden }
      opts.files.actions["ctrl-i"] = { actions.toggle_ignore }

      opts.grep.actions["ctrl-h"] = { actions.toggle_hidden }
      opts.grep.actions["ctrl-i"] = { actions.toggle_ignore }

      return opts
    end,
  },
}
