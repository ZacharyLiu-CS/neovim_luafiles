local status_ok, hop = pcall(require, "hop")
if not status_ok then
	vim.notify("Fail to load plugin: htop!", "error")
	return
end

hop.setup({ keys = "etovxqpdygfblzhckisuran", multi_windows = true })
-- place this in one of your configuration file(s)
local directions = require("hop.hint").HintDirection
vim.keymap.set("", "f", function()
	hop.hint_words() end, { remap = true })
vim.keymap.set("", "F", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
