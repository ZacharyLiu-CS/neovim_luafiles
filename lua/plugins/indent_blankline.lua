local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	vim.notify("Fail to load plugin: indent_blankline!", "error")
	return
end

vim.cmd([[highlight IndentBlanklineIndent guifg=#807369 gui=nocombine]])
vim.cmd([[highlight IndetBlanklineHighlight guifg=#FB4935 gui=nocombine]])

indent_blankline.setup({
	-- for example, context is off by default, use this to turn it on
	show_current_context = true,
	show_current_context_start = true,
	space_char_blankline = " ",
	char_highlight_list = {
		"IndentBlanklineIndent",
	},
	space_char_highlight_list = {
		"IndentBlanklineIndent",
	},
  context_highlight_list = {
    "IndetBlanklineHighlight"
  }
})
