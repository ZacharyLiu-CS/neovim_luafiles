local status_ok, notify = pcall(require, "notify")
if not status_ok then
	vim.notify("Fail to load plugin: notify!", "error")
	return
end
notify.setup({
	background_colour = "#000000",
	fps = 30,
	icons = {
		DEBUG = "",
		ERROR = "",
		INFO = "",
		TRACE = "✎",
		WARN = "",
	},
	level = 2,
  width = 40,
  max_width = 80,
	render = "minimal",
	stages = "slide",
	timeout = 5000,
	top_down = true,
})

vim.notify = notify
