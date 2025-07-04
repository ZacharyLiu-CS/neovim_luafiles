local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	vim.notify("Fail to load plugin: treesitter!")
	return
end

treesitter_configs.setup({
	ensure_installed = {
		"bash",
		"c",
		"commonlisp",
		"cpp",
		"python",
		"lua",
		"rust",
		"go",
		"markdown",
		"make",
		"cmake",
		"gitignore",
		"scheme",
		"toml",
		"yaml",
		"proto",
	}, -- one of "all" or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
  textsubjects = {
		enable = true,
		prev_selection = ",", -- (Optional) keymap to select the previous selection
		keymaps = {
			["."] = "textsubjects-smart",
		},
	},
})
