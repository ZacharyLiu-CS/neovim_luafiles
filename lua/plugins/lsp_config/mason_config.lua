local servers = {
	"lua_ls",
	"rust_analyzer",
	"clangd",
	"zls",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	-- mason-lspconfig 2.x 的 automatic_installation 已被移除，
	-- 是否自动启用改由 automatic_enable 控制；这里由下面显式 vim.lsp.enable 接管。
	automatic_enable = false,
})

-- 加载 servers/<name>.lua 中的 server 专属配置。
-- 原代码少了一个 "."，导致这些文件从来没有被加载成功过。
-- 另外 rust-analyzer 的文件名是 "rust-analyzer.lua"（短横线），需要额外兼容。
local function load_server_config(server)
	for _, name in ipairs({ server, (server:gsub("_", "-")) }) do
		local ok, conf = pcall(require, "plugins.lsp_config.servers." .. name)
		if ok and type(conf) == "table" then
			return conf
		end
	end
	return {}
end

for _, server in ipairs(servers) do
	vim.lsp.config(server, load_server_config(server))
end

vim.lsp.enable(servers)
