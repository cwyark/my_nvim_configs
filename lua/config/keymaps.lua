-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remap <C-i> to scroll up
vim.keymap.set("n", "<C-i>", "<C-d>", { noremap = true, silent = true })

-- delete lazyvim's default terminal key bindings
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<C-/>")
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<C-_>")
vim.keymap.del("t", "<C-/>")
vim.keymap.del("t", "<C-_>")
