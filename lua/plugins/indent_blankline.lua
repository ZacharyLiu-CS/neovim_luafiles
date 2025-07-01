local status_ok, indent_blankline = pcall(require, "ibl")
if not status_ok then
	vim.notify("Fail to load plugin: indent_blankline!", "error")
	return
end


indent_blankline.setup({

})
