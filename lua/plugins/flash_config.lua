local status_ok, flash = pcall(require, "flash")
if not status_ok then
	vim.notify("Fail to load plugin: flash!", "error")
	return
end

local opts = { noremap = true }
vim.api.nvim_set_keymap("n", "s", '<cmd>lua require("flash").jump()<CR>', opts)
vim.api.nvim_set_keymap("n", "S", '<cmd>lua require("flash").treesitter()<CR>', opts)
