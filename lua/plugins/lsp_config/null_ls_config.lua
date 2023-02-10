local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- register any number of sources simultaneously
local sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.write_good,
    null_ls.builtins.code_actions.gitsigns,
}

null_ls.setup({ sources = sources })


vim.api.nvim_set_keymap('n', '<A-f>', ":lua vim.lsp.buf.format()<CR>", {})
vim.api.nvim_set_keymap('n', 'gl', ":lua vim.diagnostic.open_float()<CR>", {})
vim.api.nvim_set_keymap('n', '<A-d>', ":lua vim.diagnostic.setqflist()<CR>", {})
