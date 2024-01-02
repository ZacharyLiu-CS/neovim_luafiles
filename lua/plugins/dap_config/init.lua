local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	vim.notify("Fail to load plugin: lspconfig!", "error")
	return
end
