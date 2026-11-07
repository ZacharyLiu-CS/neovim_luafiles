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
	-- Neovim 0.12 + nvim-treesitter master：indent 模块的谓词会报错
	-- (query_predicates.lua: attempt to call method 'type' (a nil value))。
	-- 缩进改用 Vim 自带 cindent，格式交给保存时的 clang-format。
	indent = { enable = false },
  textsubjects = {
		enable = true,
		prev_selection = ",", -- (Optional) keymap to select the previous selection
		keymaps = {
			["."] = "textsubjects-smart",
		},
	},
})
