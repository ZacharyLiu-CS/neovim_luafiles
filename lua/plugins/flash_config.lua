local status_ok, flash = pcall(require, "flash")
if not status_ok then
	vim.notify("Fail to load plugin: flash!", "error")
	return
end
