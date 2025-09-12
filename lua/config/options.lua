-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.laststatus = 3

-- When running on the remote Neovim host, prepend `remote-tools/<os>-<arch>/bin` to PATH
-- so that locally-prepared tools (lazygit, yazi, node/npm wrappers) are usable in remote sessions.
-- Place tools under: stdpath('data')/remote-tools/<os>-<arch>/bin
-- Example: ~/.local/share/nvim/remote-tools/linux-x86_64/bin/lazygit
if vim.g.remote_neovim_host then
  local uname = vim.uv and vim.uv.os_uname() or vim.loop.os_uname()
  local osname = (uname.sysname or ""):lower()
  -- Normalize OS name to directory convention
  if osname == "darwin" then
    osname = "macos"
  elseif osname == "linux" then
    osname = "linux"
  end

  local arch = uname.machine or ""
  -- Normalize arch name
  if arch == "aarch64" then
    arch = "arm64"
  end

  local data = vim.fn.stdpath("data")
  local tools_bin = table.concat({ data, "remote-tools", (osname .. "-" .. arch), "bin" }, "/")

  if vim.fn.isdirectory(tools_bin) == 1 then
    -- Prepend the tools bin directory to the PATH
    vim.env.PATH = tools_bin .. ":" .. (vim.env.PATH or "")
  end
end

vim.o.clipboard = "unnamedplus"

local function paste()
  return {
    vim.fn.split(vim.fn.getreg(""), "\n"),
    vim.fn.getregtype(""),
  }
end

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = paste,
    ["*"] = paste,
  },
}
