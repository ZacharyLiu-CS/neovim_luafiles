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

-- Neovim 0.12 兼容修复：
-- 0.12 中 query predicate/directive 的 match 值改成了「节点数组」
-- （match[capture_id] = TSNode[]），而 nvim-treesitter 的 master 分支已经归档，
-- 其 kind-eq? 仍按单个 TSNode 处理（node:type()），执行时直接报错。
-- C/C++ 的 indents 查询用了 #not-kind-eq?，报错会让 indentexpr 计算失败，
-- 结果回车后新行缩进变成 0（全部顶到行首）。
-- 这里用兼容 0.12 的版本覆盖该 predicate。
local ts_query = require("vim.treesitter.query")
ts_query.add_predicate("kind-eq?", function(match, _pattern, _bufnr, pred)
	local node = match[pred[2]]
	-- 0.12 是节点数组；老版本是单个节点
	if type(node) == "table" then
		node = node[1]
	end
	if not node then
		return true
	end
	return vim.tbl_contains({ unpack(pred, 3) }, node:type())
end, { force = true })
