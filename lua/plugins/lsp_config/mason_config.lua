local servers = {
	"lua_ls",
	"rust_analyzer",
	"clangd",
	"zls",
	"gopls",
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
	-- mason-lspconfig 2.x removed `automatic_installation`; enabling installed
	-- servers is now controlled by `automatic_enable`. We enable them
	-- explicitly with vim.lsp.enable() below.
	automatic_enable = false,
})

-- Load per-server settings from lua/plugins/lsp_config/servers/<name>.lua.
-- The old code concatenated the path without a ".", so none of these files
-- were ever loaded. rust-analyzer's file uses a hyphen, hence the fallback.
local function load_server_config(server)
	for _, name in ipairs({ server, (server:gsub("_", "-")) }) do
		local ok, conf = pcall(require, "plugins.lsp_config.servers." .. name)
		if ok and type(conf) == "table" then
			return conf
		end
	end
	return {}
end

local enabled = {}
for _, server in ipairs(servers) do
	-- Allow entries like "rust_analyzer@nightly": Mason understands the
	-- version suffix, but vim.lsp.config/vim.lsp.enable need the base name.
	local name = vim.split(server, "@")[1]
	table.insert(enabled, name)
	vim.lsp.config(name, load_server_config(name))
end

vim.lsp.enable(enabled)
